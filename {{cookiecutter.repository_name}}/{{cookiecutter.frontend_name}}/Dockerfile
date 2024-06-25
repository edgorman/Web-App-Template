# Use an official Node.js runtime as a parent image
FROM node:{{cookiecutter.frontend_node_version}}-alpine

# Set up environment variables
ARG REACT_APP_{{cookiecutter.backend_name|upper}}_ADDRESS
ENV REACT_APP_{{cookiecutter.backend_name|upper}}_ADDRESS ${REACT_APP_{{cookiecutter.backend_name|upper}}_ADDRESS}

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json into the container
COPY package*.json ./

# Install any dependencies specified in package.json
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Build the React application
RUN npm run build

# Install serve to serve the build files
RUN npm install -g serve

# Expose the port that the app runs on
EXPOSE {{cookiecutter.frontend_port}}

# Command to run the web server
CMD ["serve", "-s", "build", "-l", "{{cookiecutter.frontend_port}}"]
