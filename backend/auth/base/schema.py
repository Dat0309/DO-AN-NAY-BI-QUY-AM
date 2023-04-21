from typing import Optional
from pydantic import Field
from utils.pyobjectid import PyObjectId
from .models import BaseModel

class IDSchema(BaseModel):
    id: PyObjectId = Field(default_factory=PyObjectId, alias="_id")

class PaginationInfo(BaseModel):
    total_page: Optional[int]
    page_size: Optional[int]
    page: Optional[int]
    limit: Optional[int]