import re

def extraire(texte: str):

    montant = re.search(r"\d+[.,]?\d*", texte)
    numero = re.search(r"229\d{8}", texte)

    return {
        "montant": int(montant.group().replace(",", "")) if montant else 0,
        "numero": numero.group() if numero else None
    }