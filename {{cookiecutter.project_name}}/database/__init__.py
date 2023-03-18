import os
import logging

from sqlmodel import create_engine
from sqlmodel import SQLModel

# Models must be imported to be created
from database.models import fruit


# Set up logging for module
logging.basicConfig(level=logging.INFO, format='%(levelname)s:\t%(name)s - %(message)s')
logger = logging.getLogger(__name__)

# Create the database engine
DB_URL = os.getenv('DATABASE_URL')
DB_ENGINE = create_engine(DB_URL)
SQLModel.metadata.create_all(DB_ENGINE)
logger.info(f"Loading engine from url '{DB_URL}'.")
