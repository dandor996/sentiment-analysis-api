# Usa un'immagine base di Python
FROM python:3.12-slim

# Imposta la directory di lavoro all'interno del container
WORKDIR /src/project

# Installa le dipendenze di sistema necessarie (curl, build tools, Rust, ecc.)
RUN apt-get update && \
    apt-get install -y \
    curl \
    build-essential \
    git \
    pkg-config \
    libssl-dev
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Aggiungi Rust al PATH
ENV PATH="/root/.cargo/bin:$PATH"

# Verifica l'installazione di Rust (dev'essere nel PATH ora)
RUN rustc --version && cargo --version

# Copia il file requirements.txt
COPY requirements.txt .

# Installa le dipendenze Python
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia il codice sorgente nel container
COPY ./src /src/project/app

# Esporre la porta su cui il server FastAPI sarà in ascolto
EXPOSE 8000

# Comando per eseguire il server con Uvicorn
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
