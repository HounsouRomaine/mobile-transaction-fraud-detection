from config import SEUIL_DECISION

def decider(verif, ia, sim):

    score = 0

    if verif:
        score += 50
    if ia == 1:
        score += 30
    if sim > 80:
        score += 20

    return {
        "fraude": score < SEUIL_DECISION,
        "score": score
    }