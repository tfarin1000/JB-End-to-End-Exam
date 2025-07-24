# 1. Write a Dockerfile with a multi-stage build for image baseline + pip install (add requirements.txt file for the packages required).
# The application -
# Runs a Python-based application (provided here).
# Uses environment variables for AWS Secret Key (provided separately).
# Exposes port 5001.

# Dockerfile for Backend Service
FROM python:3.12-slim

#creating a working app directory
WORKDIR /app
# copying the app files to the container (main.py, requirements.txt)
COPY app/ .
# install dependecies
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5001

# because the app located in /app and the main.py is in app/src/main.py i need to specify the new location
CMD ["python", "app/main.py"]