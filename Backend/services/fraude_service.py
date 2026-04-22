liste_noire = ["97000000", "96000000", "95000000"]

def analyser_numero(numero: str) -> dict:

    if numero in liste_noire:
        return {
            "suspect": True,
            "raison": "Numéro déjà signalé"
        }

    return {
        "suspect": False,
        "raison": "Aucun problème détecté"
    }