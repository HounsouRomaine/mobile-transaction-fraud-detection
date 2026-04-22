def analyser_regles(donnees: dict) -> dict:
    """
    Analyse heuristique des anomalies
    """
    score = 0
    problemes = []

    # Montant
    if not donnees["montant"]:
        score += 30
        problemes.append("Montant non détecté")

    # Date
    if not donnees["date"]:
        score += 30
        problemes.append("Date absente ou illisible")

    # ID transaction
    id_tx = donnees["id_transaction"]
    if not id_tx:
        score += 40
        problemes.append("ID transaction manquant")
    elif len(id_tx) < 8:
        score += 20
        problemes.append("ID transaction trop court")

    return {
        "score_regles": min(score, 100),
        "problemes": problemes
    }