FROM python:3.12-slim

WORKDIR /app

# (Opcional) libs de sistema — deixe só se precisar compilar algo
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir

COPY . .

EXPOSE 8502

CMD ["streamlit", "run", "zpl.py", "--server.address=0.0.0.0", "--server.port=8502"]
