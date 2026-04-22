import numpy as np
from sklearn.ensemble import RandomForestClassifier


class ModeleFraude:
    def __init__(self):
        self.modele = RandomForestClassifier(n_estimators=20)
        self._entrainer()

    def _entrainer(self):
        """
        Données simulées pour entraîner le modèle
        """

        X = np.array([
            [1, 1, 1],
            [0, 1, 1],
            [1, 0, 1],
            [1, 1, 0],
            [0, 0, 1],
            [0, 1, 0],
            [1, 0, 0],
            [0, 0, 0]
        ])

        y = np.array([0, 1, 1, 1, 1, 1, 1, 1])

        self.modele.fit(X, y)

    def predire_proba(self, donnees: dict) -> float:
        """
        Retourne une probabilité de fraude (0 à 1)
        """

        vecteur = [
            1 if donnees["montant"] else 0,
            1 if donnees["date"] else 0,
            1 if donnees["id_transaction"] else 0
        ]

        proba = self.modele.predict_proba([vecteur])[0][1]
        return float(proba)