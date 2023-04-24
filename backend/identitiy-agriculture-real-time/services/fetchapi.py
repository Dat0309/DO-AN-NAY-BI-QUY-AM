import json
import aiohttp
import requests
from fastapi import status
from fastapi.exceptions import HTTPException
from utils.singleton import SingletonMeta

class FetchYoloAPI(metaclass=SingletonMeta):
    def __init__(self):
        self.url = 'http://ai_service:8080/api/v1/yolo-identity-agriculture'
        
    async def predict(self, image):
        data = aiohttp.FormData()
        data.add_field("file", image)
        async with aiohttp.ClientSession() as session:
            async with session.post(f'{self.url}/images/predict', data=data) as response:
                if response.status==200:
                    return await response.json()
                raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail='Network bad request')
            
class FetchAgricultureManager(metaclass=SingletonMeta):
    def __init__(self) -> None:
        self.url = 'http://app_service:8080/api/v1/agricultural-product-identification-app'

    async def get_agriculture_info(self, data):
        async with aiohttp.ClientSession() as session:
            async with session.post(f'{self.url}/agriculture/info', json=data) as response:
                if response.status==200:
                    return await response.json()
                raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail='Network bad request')
    
