from fastapi import FastAPI, Form
from fastapi.middleware.cors import CORSMiddleware

from database.models import initialiser_db, seed_data
from services.extraction_service import extraire
from services.verification_service import verifier
from services.similarite_service import similarite
from services.modele_ia_service import entrainer, predire
from services.decision_service import decider
from services.signalement_service import signaler
from services.fraude_service import log

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

initialiser_db()
seed_data()
entrainer()


@app.post("/analyser")
def analyser(texte: str = Form(...)):

    data = extraire(texte)

    verif = verifier(data)
    sim = similarite(data)
    ia = predire(data["montant"], int(verif))

    decision = decider(verif, ia, sim)

    log(data["numero"], str(decision["fraude"]), decision["score"])

    signal = signaler(data["numero"])

    return {
        "data": data,
        "verification": verif,
        "similarite": sim,
        "ia": ia,
        "decision": decision,
        "signalement": signal
    }