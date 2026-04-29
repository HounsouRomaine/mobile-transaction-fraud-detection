from sklearn.ensemble import RandomForestClassifier

modele = RandomForestClassifier()

def entrainer():
    X = [
        [10000, 1],
        [5000, 1],
        [3000, 1],
        [99999, 0],
        [1, 0]
    ]
    y = [1,1,1,0,0]
    modele.fit(X,y)

def predire(montant, present):
    return modele.predict([[montant, present]])[0]