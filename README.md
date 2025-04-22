# **Sentiment Analysis API**

## 📄 Descrizione
Questo è un semplice progetto di **Analisi del Sentiment** realizzato utilizzando modelli di **Natural Language Processing (NLP)**. L'obiettivo è creare una **API REST** che possa ricevere un testo (ad esempio un titolo di notizia) e restituire una previsione sul **sentiment** (positivo, negativo o neutro) utilizzando un modello pre-addestrato di Hugging Face.

## 🛠️ Tecnologie Utilizzate
- **Python** (linguaggio principale)
- **FastAPI** (per la creazione dell'API)
- **Hugging Face Transformers** (per il modello di sentiment analysis)
- **Docker** (per la conteinerizzazione dell'applicazione)
- **SQLite/PostgreSQL** (per il salvataggio dei risultati delle analisi)
- **Uvicorn** (ASGI server per il deploy dell'API)

## 🚀 Come avviare il progetto
1. **Clona il repository**:
   ```bash
   git clone https://github.com/dandor996/sentiment-analysis-api.git
   cd sentiment-analysis-api
