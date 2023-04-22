from api.models.agriculture import AgricultureModel
from api.services.crud import AgricultureCrud
from api.services.fetchapi import FetchAuthAPI
from utils.singleton import SingletonMeta


class AgricultureController(metaclass=SingletonMeta):
    def __init__(self):
        self.agricultureCrud  = AgricultureCrud()
        self.fetchAPI = FetchAuthAPI()
    
    async def insert_json(self,data:list):
        await self.agricultureCrud.add_many(data)
    
    async def add_vehicle_for_current_user(self,object):
        await self.agricultureCrud.set_unique([('agriculture', 1)])
        agriculture = AgricultureModel(**{**object.dict()})
        return await self.agricultureCrud.add(data=agriculture.dict())