import logging
from typing import List

from sqlmodel import select
from sqlmodel import Session

from database import DB_ENGINE
from database.models.fruit import Fruit


logger = logging.getLogger(__name__)

def create_fruits(fruits: List[Fruit]) -> None:
    with Session(DB_ENGINE) as session:
        for fruit in fruits:
            session.add(fruit)
        session.commit()

def get_fruits() -> List[Fruit]:
    with Session(DB_ENGINE) as session:
        statement = select(Fruit)
        results = session.exec(statement)
        return results.all()

def get_fruit_by_name(name: str) -> Fruit:
    with Session(DB_ENGINE) as session:
        statement = select(Fruit).where(Fruit.name == name)
        results = session.exec(statement)
        return results.one()

def update_fruits(fruits: List[Fruit]) -> None:
    with Session(DB_ENGINE) as session:
        for fruit in fruits:
            statement = select(Fruit).where(Fruit.name == fruit.name)
            results = session.exec(statement)
            result = results.one()
            result.update(fruit)
            session.add(result)
        session.commit()

def delete_fruits(fruits: List[Fruit]) -> None:
    with Session(DB_ENGINE) as session:
        for fruit in fruits:
            statement = select(Fruit).where(Fruit.name == fruit.name)
            results = session.exec(statement)
            result = results.one()
            session.delete(result)
        session.commit()
