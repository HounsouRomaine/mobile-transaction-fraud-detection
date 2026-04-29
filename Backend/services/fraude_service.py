from database.db import get_connection

def log(numero, resultat, score):

    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
    INSERT INTO logs (numero, resultat, score)
    VALUES (?, ?, ?)
    """, (numero, resultat, score))

    conn.commit()
    conn.close()