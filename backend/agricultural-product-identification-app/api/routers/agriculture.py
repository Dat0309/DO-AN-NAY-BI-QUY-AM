import json
from typing import List

from api.models.agriculture import (UpdateAgricultureModel, AgricultureModel,
                                AgricultureModelListOut, AgricultureModelOut,
                                AgricultureSubModel)
from core.jwt import get_current_user
from fastapi import APIRouter, Depends, File, Query,UploadFile
from utils.decorators import check_has_permission
from utils.pagination import pagination_info
from utils.pyobjectid import PyObjectId
from api.controllers.controller import *

router = APIRouter(
    prefix='/agriculture',
    tags=['Agriculture'],
    responses={404: {'description': 'Not found'}}
)


@router.get('/', response_model=AgricultureModelListOut)
# @check_has_permissions
async def get_all_agriculture(
    page: int = Query(0, ge=0),
    limit: int = Query(20, ge=0, le=20),
    # current_user=Depends(get_current_user)
):
    agricultures, info = await agricultureCtrl.agricultureCrud.get_all(is_get_info=True, page=page, limit=limit)
    return pagination_info(agricultures, info)


@router.get('/{id_agriculture}', response_model=AgricultureModelOut)
@check_has_permission
async def get_agriculture(
    id_agriculture: str,
    current_user=Depends(get_current_user)
):
    agriculture = await agricultureCtrl.agricultureCrud.get(value=id_agriculture)
    return agriculture


@router.post('/', response_model=AgricultureModelOut)
@check_has_permission
async def add_agriculture(
    agriculture: AgricultureModel,
    current_user=Depends(get_current_user)
):
    await  agricultureCtrl.agricultureCrud.set_unique([('agriculture', 1)])
    new_data = await  agricultureCtrl.agricultureCrud.add(agriculture.dict())
    return new_data


@router.put('/{id_agriculture}')
@check_has_permission
async def update_agriculture(
    id_agriculture: str,
    update: UpdateAgricultureModel,
    current_user=Depends(get_current_user)
):
    is_finish = await agricultureCtrl.agricultureCrud.update(id_agriculture, update.dict())
    return {"detail": "update successfully"} if is_finish == True else {"detail": "not to update"}


@router.delete('/{id_agriculture}')
@check_has_permission
async def delete_agriculture(
    id_agriculture: str,
    current_user=Depends(get_current_user)
):
    await agricultureCtrl.agricultureCrud.delete(value=id_agriculture)
    return {"detail": "delete successfully"}


@router.post('/read_file_json')
async def read_file_json( upload_file: UploadFile = File(...)):
    json_data = json.load(upload_file.file)
    await agricultureCtrl.insert_json(json_data['list'])
    return {"detail": "add json successfully"}