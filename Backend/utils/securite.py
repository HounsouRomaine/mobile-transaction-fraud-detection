import re

def nettoyer_texte(texte: str):
    return texte.strip()

def valider_numero(numero: str):
    return bool(re.match(r"229\d{8}", numero))