import pytesseract
from PIL import Image
import re

# ⚠️ Windows uniquement (adapter si besoin)
# pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'


def extraire_texte(image: Image.Image) -> str:
    """
    Extrait le texte depuis une image (OCR)
    """
    return pytesseract.image_to_string(image)


def extraire_informations(texte: str) -> dict:
    """
    Extraction intelligente adaptée aux SMS MTN / Celtiis / Moov
    """

    texte = texte.replace("\n", " ")

    # 🔹 Montant (ex: 5.000,00F ou 10000F)
    match_montant = re.search(r'(\d{1,3}(?:[.,]\d{3})*(?:[.,]\d+)?F)', texte)

    # 🔹 Numéro béninois (229XXXXXXXX)
    match_numero = re.search(r'(229\d{8,})', texte)

    # 🔹 ID transaction (REF ou ID)
    match_id = re.search(r'(REF[:\s]*[A-Z0-9]+|ID[:\s]*[A-Z0-9]+)', texte)

    # 🔹 Date (plusieurs formats)
    match_date = re.search(r'(\d{4}-\d{2}-\d{2}|\d{1,2}/\d{1,2}/\d{2,4})', texte)

    # 🔹 Nom (approximation)
    match_nom = re.search(r'de\s([A-Z\s]+)', texte)

    return {
        "montant": match_montant.group(1) if match_montant else None,
        "numero": match_numero.group(1) if match_numero else None,
        "id_transaction": match_id.group(1) if match_id else None,
        "date": match_date.group(1) if match_date else None,
        "nom": match_nom.group(1).strip() if match_nom else None
    }


def detecter_operateur(texte: str) -> str:
    """
    Détecte l'opérateur GSM à partir du SMS
    """

    texte = texte.lower()

    if "mtn" in texte:
        return "MTN"
    elif "moov" in texte:
        return "MOOV"
    elif "celtiis" in texte or "pokette" in texte:
        return "CELTIIS"

    return "INCONNU"