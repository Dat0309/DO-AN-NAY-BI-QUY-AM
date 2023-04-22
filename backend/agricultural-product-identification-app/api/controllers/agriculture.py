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
