import os

from dotenv import load_dotenv
from pydantic import BaseSettings

load_dotenv(dotenv_path = '../../env/auth.env')

class CommonSettings(BaseSettings):
    DEBUG_MODE: bool = True

class ServerSettings(BaseSettings):
    HOST: str = '0.0.0.0'
    PORT: int = 8080

class DatabaseSettings(BaseSettings):
    DB_URL: str = os.environ.get('MONGODB_URL')
    DB_NAME: str = os.environ.get('MONGODB_NAME')

class JWTSettings(BaseSettings):
    JWT_SECRET_KEY: str = os.environ.get('JWT_SECRET_KEY')
    ACCESS_TOKEN: int = 60*24*30
    PATH_KEY: str = 'c20c4a219481f901'

class OTPSettings(BaseSettings):
    ACCESS_OTP: int = 120

class CloudinarySettings(BaseSettings):
    CLOUD_NAME: str = os.environ.get('CLOUD_NAME')
    API_KEY: str = os.environ.get('API_KEY')
    API_SECRET: str = os.environ.get('API_SECRET')
    STORE: str = 'images/avatars'

class Settings(
    CommonSettings,
    ServerSettings,
    DatabaseSettings,
    JWTSettings,
    OTPSettings,
    CloudinarySettings
) :  pass

settings = Settings()