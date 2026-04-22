# Fraud AI Scanner

Cette application Flutter permet de scanner des preuves pour détecter les fraudes à l'aide d'une IA.

## Fonctionnalités

- Sélection d'image depuis la galerie
- Analyse de l'image via un service backend
- Affichage des résultats d'analyse (score, statut, problèmes détectés)

## Installation

1. Assurez-vous d'avoir Flutter installé : `flutter doctor`
2. Installez les dépendances : `flutter pub get`
3. Lancez l'application : `flutter run`

## Backend

L'application communique avec un backend Python via HTTP (par défaut : http://10.0.2.2:8000 pour l'émulateur Android).

## Tests

Lancez les tests : `flutter test`

## Build

- Android : `flutter build apk`
- iOS : `flutter build ios`
- Web : `flutter build web`
