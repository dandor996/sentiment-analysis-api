from fastapi import FastAPI
from pydantic import BaseModel
from src.model import get_sentiment
from src.database import log_prediction

# Crea un'istnza dell'app FastAPI
app = FastAPI()

# Modello di richiesta per ricevere il testo dall'utente
class TextRequest(BaseModel):
    text: str
    
@app.get("/")
def read_root():
    return {"message": "Benvenuto nell'API di Sentiment Analysis"}

# Endpoint POST per fare una previsione sul sentiment del testo
@app.post("/predict")
async def predict_sentiment(request: TextRequest):
    sentiment, score = get_sentiment(request.text) # Analizza il sentiment
    log_prediction(request.text, sentiment, score)
    return {"sentiment": sentiment, "score": score}