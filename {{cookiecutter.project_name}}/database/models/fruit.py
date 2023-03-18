from typing import Optional
from sqlmodel import SQLModel, Field


class Fruit(SQLModel, table=True):
    name: str = Field(primary_key=True)
    amount: Optional[int] = None
