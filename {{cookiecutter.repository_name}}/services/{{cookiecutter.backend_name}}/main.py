from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware


# Set up FastAPI service
api = FastAPI()
api.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost", "http://localhost:8080"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Add endpoints to the API
# api.include_router(...)

@api.get("/")
async def root():
    return {
        "name": "{{cookiecutter.backend_name}}",
        "version": "0.1.0"
    }
