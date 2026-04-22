import random

def verifier_transaction_operateur(donnees: dict) -> dict:
    """
    Simulation API opérateur GSM
    """

    if donnees["id_transaction"] and donnees["montant"]:
        valide = random.choice([True, True, False])

        return {
            "valide": valide,
            "operateur": "Simulation GSM",
            "message": "Transaction confirmée" if valide else "Transaction introuvable"
        }

    return {
        "valide": False,
        "operateur": "Inconnu",
        "message": "Informations insuffisantes"
    }