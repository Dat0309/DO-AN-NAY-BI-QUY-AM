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
    agriculture: object = Field(...)
    type: AgricultureType = Field(...)

    class Config:
        schema_extra = {
            "example": {
                "agriculture": "str",
                "type":"Agriculture type (ex: flower, fruit, plant, leaf)"
            }
        }

class AgricultureSubModel(BaseModel):
    agriculture: object= Field(...)
    type: AgricultureType = Field(...)

    class Config:
        schema_extra = {
            "example": {
                "agriculture": "object",
                "type":"Agriculture type (ex: flower, fruit, plant, leaf)"
            }
        }

class UpdateAgricultureModel(BaseModel):
    plate: Optional[object]
    type: Optional[AgricultureType]

    class Config:
        schema_extra = {
            "example": {
                "agriculture": "object",
                "type":"Agriculture type (ex: flower, fruit, plant, leaf)"
            }
        }


class AgricultureModelOut(UpdateAgricultureModel,IDSchema):
    pass

class AgricultureModelListOut(PaginationInfo):
    list: Optional[List[AgricultureModelOut]]


class SearchAgriculture(BaseModel):
    agriculture: Optional[object]
    type: Optional[AgricultureType]