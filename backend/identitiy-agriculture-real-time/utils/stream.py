import asyncio
import base64
import concurrent.futures
import threading
import time
from multiprocessing.pool import ThreadPool
import cv2
from fastapi import status
from utils.pyobjectid import PyobjectId
from services.fetchapi import FetchAgricultureManager, FetchYoloAPI

try:
    from greenlet import getcurrent as get_ident
except:
    try:
        from _thread import get_ident
    except ImportError:
        from _thread import get_ident

class CameraEvent(object):
    def __init__(self) -> None:
        self.events = {}

    def wait(self):
        ident = get_ident()
        if ident not in self.events:
            self.events[ident] = [threading.Event(), time.time()]
        return self.events[ident][0].wait()
    
    def set(self):
        now = time.time()
        remove = []
        for ident, event in self.events.items():
            if not event[0].isSet():
                event[0].set()
                event[1] = now
            else:
                if now - event[1] > 5:
                    remove.append(ident)
        for ident in remove:
            del self.events[ident]

    def clear(self):
        self.events[get_ident()[0].clear()]

class BaseCamera:
    thread = None
    frame = None
    last_access = 0
    event = CameraEvent()

    def __init__(self) -> None:
        if self.thread is None:
            self.last_access = time.time()
            self.thread = threading.Thread(target=self._thread, daemon = True)
            self.thread.start()
            while self.get_frame() is None:
                time.sleep(0)

    def get_frame(self):
        self.last_access = time.time()
        self.event.wait()
        self.event.clear()
        return self.frame
    
    def frames(self)->any:
        raise RuntimeError('Must be implement by subclasses.')
    
    def _thread(self):
        print('[INFO] Starting camera thread.')
        frames_iterator = self.frames()
        for frame in frames_iterator:
            self.frame = frame
            self.event.set()
            time.sleep(0)
            if time.time() - self.last_access > 10:
                frames_iterator.close()
                print('[INFO] Stopping camera thread duo to inacivity.')
                break
        self.thread = None

class CameraStream(BaseCamera):
    def __init__(self, src=0, manager=None, task=None):
        self.src = src
        self.manager=manager
        self.fetchYoloAPI = FetchYoloAPI()
        self.fetchAgriculture = FetchAgricultureManager()
        self.task = task
        self.agriculture = []
        self.data_obj = {}
        super().__init__()

    def fetchDetect(self, img):
        _, im_arr = cv2.imencode('.jpg', img)
        im_bytes = im_arr.tobytes()
        image = base64.b16decode(im_bytes)
        self.agriculture = asyncio.run(self.fetchYoloAPI.predict(image))

    def useAI(self, img):
        _, im_arr = cv2.imencode('.jpg', img)
        im_bytes = im_arr.tobytes()
        image = base64.b64decode(im_bytes)

        self.agricultures = asyncio.run(self.fetchYoloAPI.predict(image))

        if self.agricultures == [] or self.agricultures == None:
            return
        
        object = {
            'agricultures': self.agricultures,
        }

        data = asyncio.run(
            self.fetchAgriculture.get_agriculture_info(object)
        )

        self.data_obj = data
        if data != []:
            asyncio.run(self.manager.broadcast(data))

    def frames(self)->any:
        frame = cv2.VideoCapture(self.src)
        count = 0
        coun1 = 0
        agriculture = []
        try:
            while True:
                success, img = frame.read()
                if not success:
                    print('Cannot connect camera')
                    break
                count += 1
                coun1 += 1
                if count % 60 == 0:
                    count=0
                    thred = threading.Thread(target=self.useAI, args=(img,))
                    thred.start()

                register = self.data_obj.get('register', [])
                unregister = self.data_obj.get('not_registered', [])

                if count1&250==0 and (register!=[] or unregister != []):
                    self.data_obj = {}
                    count1 = 0
                
                for re in register:
                    x0 = re['coordinate']['x0']
                    y0 = re['coordinate']['y0']
                    x1 = re['coordinate']['x1']
                    y1 = re['coordinate']['y1']
                    cv2.rectangle(img, (int(x0), int(y0)), (int(x1), int(y1)), (255, 0, 0), 2)
                    image = cv2.putText(
                        img, 
                        re['username'], 
                        (int(x0)-10, int(y0)-10), 
                        cv2.FONT_HERSHEY_SIMPLEX, 
                        1, 
                        (255, 0, 0), 
                        2, 
                        cv2.LINE_AA
                    )
                for re in unregister:
                    x0 = re['coordinate']['x0']
                    y0 = re['coordinate']['y0']
                    x1 = re['coordinate']['x1']
                    y1 = re['coordinate']['y1']
                    cv2.rectangle(img, (int(x0), int(y0)), (int(x1), int(y1)), (0, 0, 255), 2)
                    image = cv2.putText(
                        img, 
                        "Unknown", 
                        (int(x0)-10, int(y0)-10), 
                        cv2.FONT_HERSHEY_SIMPLEX, 
                        1, 
                        (0, 0, 255), 
                        2, 
                        cv2.LINE_AA
                    )

                yield cv2.imencode('.jpg', img)[1].tobytes()
        except Exception as e:
            print(e)