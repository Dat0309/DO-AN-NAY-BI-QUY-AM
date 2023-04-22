from datetime import datetime
from base.crud import BaseCrud
from pymongo import IndexModel
from pytz import timezone
from utils.pyobjectid import PyObjectId
from pymongo import IndexModel
import math

app = 'agriculture_app'
tz = timezone('Asia/Ho_Chi_Minh')

class AgricultureCrud(BaseCrud):
    def __init__(self):
        super().__init__(f'{app}_agriculture')
