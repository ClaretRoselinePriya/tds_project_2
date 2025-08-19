FROM python:3.11-slim

# system deps for matplotlib/reportlab/etc.
RUN apt-get update && apt-get install -y \
    build-essential libglib2.0-0 libgl1 libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

# HF Spaces will route traffic to this port
ENV PORT=7860
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]
