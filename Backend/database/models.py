from database.db import get_connection

def initialiser_db():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_transaction TEXT,
        numero TEXT,
        montant INTEGER,
        date TEXT,
        operateur TEXT
    )
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        numero TEXT,
        resultat TEXT,
        score INTEGER,
        date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    """)

    conn.commit()
    conn.close()


def seed_data():
    conn = get_connection()
    cursor = conn.cursor()

    data = [
        ("MTN001", "2290142260098", 10000, "2026-04-22", "MTN"),
        ("MOOV002", "2290197368876", 3125, "2026-04-22", "MOOV"),
        ("CELT003", "2290141861092", 5000, "2026-04-12", "CELTIIS"),
    ]

    cursor.executemany("""
    INSERT INTO transactions (id_transaction, numero, montant, date, operateur)
    VALUES (?, ?, ?, ?, ?)
    """, data)

    conn.commit()
    conn.close()