from datetime import datetime
import sqlite3

# Connessione al database
conn = sqlite3.connect("sentiment_log.db", check_same_thread=False)
cursor = conn.cursor()

cursor.execute("""
               CREATE TABLE IF NOT EXISTS predictions (
                   id INTEGER PRIMARY KEY AUTOINCREMENT,
                   text TEXT NOT NULL,
                   sentiment TEXT NOT NULL,
                   confidence REAL NOT NULL,
                   timestamp TEXT NOT NULL
                   )
                   """)
conn.commit()

# Funzione per salvare una prediction
def log_prediction(text, sentiment, confidence):
    timestamp = datetime.utcnow().isoformat()
    cursor.execute("INSERT INTO predictions (text, sentiment, confidence, timestamp) VALUES (?, ?, ?, ?)",
                   (text, sentiment, confidence, timestamp))
    conn.commit()