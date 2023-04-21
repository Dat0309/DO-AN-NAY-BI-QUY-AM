import json
import aiohttp
import requests
from fastapi import status
from fastapi.exceptions import HTTPException
from utils.singleton import SingletonMeta

class FetchAgricultureManagerment(metaclass=SingletonMeta):
    def __init__(self):
        self.url = 'http://app_service:8000/api/v1/agriculture-product-identities-app'