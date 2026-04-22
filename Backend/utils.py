def calculer_score_final(score_regles: int, proba_modele: float) -> int:
    """
    Combine règles + modèle
    """
    score = int(score_regles * 0.6 + proba_modele * 100 * 0.4)
    return min(score, 100)


def determiner_statut(score: int) -> str:
    """
    Interprétation du score
    """
    if score > 70:
        return "Fraude probable"
    elif score > 40:
        return "Suspect"
    else:
        return "Valide"