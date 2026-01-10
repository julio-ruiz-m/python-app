FROM python:3.12-slim

WORKDIR /app

RUN useradd -m appuser
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app
COPY tests ./tests

USER appuser

EXPOSE 8080
CMD ["python", "-m", "app.main"]