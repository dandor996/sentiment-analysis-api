# Usa Python 3.10 per compatibilità con tokenizers
FROM python:3.10-slim

WORKDIR /src/project

# Installa le dipendenze di sistema
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    pkg-config \
    libssl-dev \
    python3-dev \
    curl \
    ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Installa Rust in modalità non interattiva
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/root/.cargo/bin:$PATH"

# Verifica Rust
RUN rustc --version && cargo --version

# Copia i requirements
COPY requirements.txt .

# Installa le dipendenze Python
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copia il codice sorgente
COPY ./src /src/project/app

EXPOSE 8000

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
