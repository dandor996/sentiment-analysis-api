from transformers import pipeline

# Carica il modello pre-addestrato per l'anilisi del sentiment
sentiment_analyzer = pipeline("sentiment-analysis")

# Funzione per ottenere il sentiment e il punteggio
def get_sentiment(text: str):
    result = sentiment_analyzer(text)[0] # Analizza il testo
    sentiment = result["label"] # Etichetta del sentiment (pos/neg)
    score = result["score"] # Punteggio di affidabilità
    return sentiment, score