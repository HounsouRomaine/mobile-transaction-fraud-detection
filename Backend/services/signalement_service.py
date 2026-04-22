signalements = []

def signaler_numero(numero: str, raison: str):

    signalements.append({
        "numero": numero,
        "raison": raison
    })

    return {
        "message": "Signalement enregistré (simulation CNIN)"
    }


def get_signalements():
    return signalements