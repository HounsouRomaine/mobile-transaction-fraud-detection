from fastapi import FastAPI, File, UploadFile
from PIL import Image
import io

# Modules internes
from ocr import extraire_texte, extraire_informations, detecter_operateur
from detection import analyser_regles
from modele import ModeleFraude
from utils import calculer_score_final, determiner_statut

# Services simulés
from services.operateur_service import verifier_transaction_operateur
from services.fraude_service import analyser_numero
from services.signalement_service import signaler_numero

app = FastAPI(title="API Détection Fraude Mobile Money")

modele = ModeleFraude()

historique = []


@app.get("/")
def accueil():
    return {"message": "API opérationnelle"}


@app.post("/analyser")
async def analyser_preuve(fichier: UploadFile = File(...)):
    """
    Pipeline complet :
    image → OCR → extraction → IA → simulation opérateur → signalement
    """

    # 🔹 Lecture image
    contenu = await fichier.read()
    image = Image.open(io.BytesIO(contenu))

    # 🔹 OCR
    texte = extraire_texte(image)

    # 🔹 Extraction infos
    donnees = extraire_informations(texte)

    # 🔹 Détection opérateur
    operateur = detecter_operateur(texte)

    # 🔹 Analyse règles
    resultat_regles = analyser_regles(donnees)

    # 🔹 IA
    proba = modele.predire_proba(texte, donnees)

    # 🔹 Score final
    score = calculer_score_final(resultat_regles["score_regles"], proba)

    statut = determiner_statut(score)

    # 🔹 Simulation opérateur
    verification_operateur = verifier_transaction_operateur(donnees)

    # 🔹 Analyse numéro
    numero = donnees.get("numero") or "inconnu"
    analyse_numero = analyser_numero(numero)

    # 🔹 Signalement si fraude
    if not verification_operateur["valide"] or analyse_numero["suspect"]:
        signaler_numero(numero, "Transaction suspecte")

    # 🔹 Historique
    historique.append({
        "score": score,
        "statut": statut,
        "operateur": operateur
    })

    return {
        "statut": statut,
        "score": score,
        "operateur": operateur,
        "donnees": donnees,
        "verification_operateur": verification_operateur,
        "analyse_numero": analyse_numero,
        "confiance_modele": round(proba, 2),
        "texte": texte[:300]
    }


@app.get("/historique")
def get_historique():
    return historique 