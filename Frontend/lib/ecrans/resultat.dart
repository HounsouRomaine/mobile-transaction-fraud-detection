import 'package:flutter/material.dart';

class Resultat extends StatelessWidget {
  final Map<String, dynamic> resultat;

  Resultat({required this.resultat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Résultat analyse")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Score: ${resultat['score']}", style: TextStyle(fontSize: 24)),

            SizedBox(height: 10),

            Text(
              "Statut: ${resultat['statut']}",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            Text("Confiance IA: ${resultat['confiance_modele']}"),

            SizedBox(height: 20),

            Text(
              "Problèmes détectés:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            ...List.generate(
              resultat['problemes'].length,
              (i) => Text("- ${resultat['problemes'][i]}"),
            ),
          ],
        ),
      ),
    );
  }
}
