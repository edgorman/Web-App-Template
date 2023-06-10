import os
import time
import logging

from celery import Celery
from celery.result import AsyncResult

import database  # noqa: F401, Required to initialise the connection to the database
from database.models.fruit import Fruit
from database.handlers.fruit import create_fruits


logger = logging.getLogger(__name__)

# Set up a worker
BROKER_URL = os.getenv("BROKER_URL")
BACKEND_URL = os.getenv("BACKEND_URL")
app = Celery("worker", broker=BROKER_URL, backend=BACKEND_URL)


@app.task
def get_task_status(task_id: str):
    task_result = AsyncResult(task_id)
    return {
        "task_id": task_id,
        "task_status": task_result.status,
        "task_result": task_result.result
    }


@app.task
def collect_fruit_by_name(name: str):
    fruit = Fruit(**{
        "name": name,
        "amount": 15
    })
    logger.info(f"creating fruit {fruit} from name {name}")
    time.sleep(15)
    create_fruits([fruit])
    logger.info(f"done creating fruit {fruit}")


logger.info("Successfully loaded worker")
