import 'package:flutter/material.dart';
import '../widgets/carte.dart';
import '../widgets/bouton.dart';
import '../ecrans/resultat.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  TextEditingController controller = TextEditingController();

  void fakeAnalyse() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Resultat(
          fraude: true,
          score: 85,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 60),

            Text(
              "Détection de fraude",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Analyse intelligente des transactions mobiles",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 30),

            Carte(
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    maxLines: 4,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Collez le SMS ici...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Bouton(
              texte: "Analyser",
              onTap: fakeAnalyse,
            )
          ],
        ),
      ),
    );
  }
} 