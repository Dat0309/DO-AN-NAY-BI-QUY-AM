from ONNXModel.func.function import *
from ONNXModel.baseONNX.onnxv7 import YOLOv7Detect, YOLOv7Recognize
from ONNXModel.baseONNX.onnxv5 import YOLOv5Detect,YOLOv5Recognize

detect = YOLOv7Detect()
# detect = YOLOv5Detect()
# recog = YOLOv5Recognize(cuda=True)
recog = YOLOv7Recognize()

def processing(image):
    img = image
    result = []
    for (x0,y0,x1,y1) in detection(yolo=detect,image=img):
        agriculture = {}
        region = img[y0:y1,x0:x1]
        recog_agriculture = recognize(yolo=recog,image=region)
        if recog_agriculture == None: continue
        agriculture['agriculture'] = recog_agriculture
        agriculture['coordinate'] = {'x0':x0,'y0':y0,'x1':x1,'y1':y1}
        result.append(agriculture)
    return result