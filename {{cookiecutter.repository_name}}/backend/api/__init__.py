import os
import logging

from fastapi import FastAPI
from fastapi import HTTPException
from fastapi.middleware.cors import CORSMiddleware

import database  # Required to initialise the connection to the database
from worker.tasks import get_task_status
from api._endpoints.fruit import router as fruit_router


# Set up logging for module
logging.basicConfig(level=logging.INFO, format='%(levelname)s:\t%(name)s - %(message)s')
logger = logging.getLogger(__name__)

# Set up FastAPI service
api = FastAPI()
api.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost", "http://{{ cookiecutter.frontend_port }}"],
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

@api.get("/task/{taskid}", response_description="Get the status of a task id")
async def get_task(taskid: str):
    try:
        return get_task_status(taskid)
    except Exception as e:
        raise HTTPException(status_code=404, detail=f"Could not find task '{taskid}': '{e}'")

logger.info(f"Successfully loaded API")
