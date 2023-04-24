from fastapi import APIRouter
from .routers.permission import router as permission_router
from .routers.agriculture import router as agriculture_router

router = APIRouter(prefix='/api/v1/agricultural-product-identification-app',responses={'404':{'description':'Not found test'}})
router.include_router(permission_router)
router.include_router(agriculture_router)