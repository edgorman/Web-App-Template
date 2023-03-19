import logging

from fastapi import APIRouter
from fastapi import HTTPException
from database.models.fruit import Fruit
from database.handlers.fruit import *


# Set up logger
logger = logging.getLogger(__name__)

# Set up a demo router
router = APIRouter(
    prefix='/fruit',
    tags=['fruit']
)


@router.get("/", response_description="Get all fruits")
async def get_fruits():
    try:
        return [fruit for fruit in read_fruits()]
    except Exception as e:
        raise HTTPException(status_code=404, detail=f"Could not get list of fruits: '{e}'.")

@router.get("/{name}", response_description="Get the fruit by name")
async def get_fruit_by_name(name: str):
    try:
        return read_fruit_by_name(name)
    except Exception as e:
        raise HTTPException(status_code=404, detail=f"Could not find '{name}'.")

@router.get("/{name}/amount", response_description="Get the amount of fruit by name")
async def get_fruit_by_amount(name: str):
    try:
        return read_fruit_by_name(name).amount
    except Exception as e:
        raise HTTPException(status_code=404, detail=f"Could not find '{name}'.")

@router.post("/create", response_description="Create a new fruit")
async def create_fruit(fruit: Fruit):
    try:
        create_fruits([fruit])
        return "OK"
    except Exception as e:
        raise HTTPException(status_code=424, detail=f"Could not create '{fruit}': '{e}'.")

@router.post("/update", response_description="Update an existing fruit")
async def update_fruit(fruit: Fruit):
    try:
        update_fruits([fruit])
        return "OK"
    except Exception as e:
        raise HTTPException(status_code=424, detail=f"Could not update '{fruit}': '{e}'.")

@router.post("/delete", response_description="Delete an existing fruit")
async def delete_fruit(fruit: Fruit):
    try:
        delete_fruits([fruit])
        return "OK"
    except Exception as e:
        raise HTTPException(status_code=424, detail=f"Could not delete '{fruit}': '{e}'.")
