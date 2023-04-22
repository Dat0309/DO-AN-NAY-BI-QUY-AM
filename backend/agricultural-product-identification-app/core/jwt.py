from datetime import datetime, timedelta
from typing import Union

from core.config import settings
from fastapi import Depends, FastAPI, status
from fastapi.exceptions import HTTPException
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from jose import JWTError, jwt
from passlib.context import CryptContext

ALGORITHM = 'HS256'
SECRET_KEY = settings.JWT_SECRET_KEY
ACCESS_TOKEN_EXPIRE_MINUTES = settings.ACCESS_TOKEN_EXPIRE_MINUTES

pwd_context = CryptContext(schemes=['bcrypt'],deprecated='auto')

oauth2_scheme = OAuth2PasswordBearer(
    tokenUrl='/api/v1/agricultural-product-identification-app/auth/oauth2/login',
    scheme_name='JWT'
)

def get_current_user(token: str = Depends(oauth2_scheme)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        user = payload.get("user")
        if user is None:
            raise credentials_exception
        return user
    except JWTError:
        raise 