# Use a slim Python base image
FROM python:3.12-slim

# Set work directory inside the container
WORKDIR /app

# Copy only requirements first for caching
COPY validation-framework/requirements.txt .

# Install dependencies without cache to reduce image size
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY validation-framework/ .

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Default command to run the validator
ENTRYPOINT ["python", "app/main.py"]
