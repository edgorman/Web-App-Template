import logging

from requests.models import Response

from fastapi import APIRouter
from fastapi import HTTPException


# Set up logger
logger = logging.getLogger(__name__)

# Set up a demo router
router = APIRouter(
    prefix='/fruit',
    tags=['fruit']
)


@router.get("/", response_description="Get all fruits")
async def get_fruits():
    return ["Apple", "Banana", "Orange"]

@router.post("/collect", response_description="Tasks a runner with collecting fruit")
async def post_collect_fruits():
    logger.info("Task a runner with collecting fruit")

@router.get("/{fruit_name}", response_description="Get the amount of this fruit")
async def get_fruit_amount(fruit_name: str):
    if fruit_name.lower() not in [f.lower() for f in ["Apple", "Banana", "Orange"]]:
        return HTTPException(status_code=422, detail=f"Could not find '{fruit_name}'.")

    return 5
