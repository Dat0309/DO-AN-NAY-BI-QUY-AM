from datetime import datetime
from enum import Enum
from typing import List, Optional, Union

import pydantic
from base.models import BaseModel
from base.schema import IDSchema, PaginationInfo
from pydantic import EmailStr, Field
from utils.pyobjectid import ObjectId, PyObjectId


class AgricultureType(str,Enum):
    flower="flower"
    fruit="fruit"
    plant="plant"
    leaf="leaf"

class AgricultureModel(BaseModel):
    image: str = Field(...) #hinhd ảnh
    common_name: str = Field(...) #tên chung
    specific_name: str = Field(...) #tên khoa học
    description: str = Field(...) #mô tả về loài cây
    lifespan: int = Field(...) # tuổi thọ
    height_when_mature: float = Field(...) # chiều cao khi trưởng thành
    type: AgricultureType = Field(...) #loại nông sản

    class Config:
        schema_extra = {
            "example": {
                "image": "str",
                "common_name": "str",
                "specific_name": "str",
                "description": "str",
                "lifespan": 5,
                "height_when_mature": 55,
                "type":"Agriculture type (ex: flower, fruit, plant, leaf)"
            }
        }

class UpdateAgricultureModel(BaseModel):
    image: str = Field(...) #hinhd ảnh
    common_name: str = Field(...) #tên chung
    specific_name: str = Field(...) #tên khoa học
    description: str = Field(...) #mô tả về loài cây
    lifespan: int = Field(...) # tuổi thọ
    height_when_mature: float = Field(...) # chiều cao khi trưởng thành
    type: Optional[AgricultureType]

    class Config:
        schema_extra = {
            "example": {
                "image": "str",
                "common_name": "str",
                "specific_name": "str",
                "description": "str",
                "lifespan": 5,
                "height_when_mature": 55,
                "type":"Agriculture type (ex: flower, fruit, plant, leaf)"
            }
        }


class AgricultureModelOut(UpdateAgricultureModel,IDSchema):
    pass

class AgricultureModelListOut(PaginationInfo):
    list: Optional[List[AgricultureModelOut]]


class SearchAgriculture(BaseModel):
    image: str = Field(...) #hinhd ảnh
    common_name: str = Field(...) #tên chung
    specific_name: str = Field(...) #tên khoa học
    description: str = Field(...) #mô tả về loài cây
    lifespan: int = Field(...) # tuổi thọ
    height_when_mature: float = Field(...) # chiều cao khi trưởng thành
    type: Optional[AgricultureType]