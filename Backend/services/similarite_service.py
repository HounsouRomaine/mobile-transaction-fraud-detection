from rapidfuzz import fuzz
from database.db import get_connection

def similarite(donnees):

    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM transactions")
    data = cursor.fetchall()

    best = 0

    for t in data:
        score = fuzz.ratio(str(donnees["montant"]), str(t["montant"]))
        if score > best:
            best = score

    conn.close()

    return best