import os
import logging

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

import database  # Required to initialise the connection to the database
from backend.routers.fruit import router as fruit_router


# Set up logging for module
logging.basicConfig(level=logging.INFO, format='%(levelname)s:\t%(name)s - %(message)s')
logger = logging.getLogger(__name__)

# Set up FastAPI service
api = FastAPI()
api.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Add endpoints to the API
api.include_router(fruit_router)

@api.get("/")
async def root():
    return {
        "name": __name__,
        "version": "0.0.1"
    }
