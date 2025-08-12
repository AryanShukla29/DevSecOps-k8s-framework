FROM python:3.12-slim

WORKDIR /app

# Install only what we need
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

EXPOSE 80

CMD ["python", "app.py"]
