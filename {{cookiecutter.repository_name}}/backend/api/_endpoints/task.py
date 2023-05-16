import logging

from fastapi import APIRouter
from fastapi import HTTPException

from worker.tasks import get_task_status


# Set up logger
logger = logging.getLogger(__name__)

# Set up a demo router
router = APIRouter(
    prefix='/task',
    tags=['task']
)

@router.get("/task/{taskid}", response_description="Get the status of a task id")
async def get_task(taskid: str):
    try:
        return get_task_status(taskid)
    except Exception as e:
        raise HTTPException(status_code=404, detail=f"Could not find task '{taskid}': '{e}'")