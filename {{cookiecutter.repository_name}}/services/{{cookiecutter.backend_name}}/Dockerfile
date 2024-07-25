# Use an official Python runtime as a parent image
FROM python:{{cookiecutter.backend_python_version}}-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that the FastAPI app runs on
EXPOSE {{cookiecutter.backend_port}}

# Command to run the FastAPI server
CMD ["uvicorn", "main:api", "--host", "0.0.0.0", "--port", "{{cookiecutter.backend_port}}"]
