from database.db import get_connection

def verifier(donnees):

    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
    SELECT * FROM transactions
    WHERE numero=? AND montant=?
    """, (donnees["numero"], donnees["montant"]))

    res = cursor.fetchone()
    conn.close()

    return res is not None