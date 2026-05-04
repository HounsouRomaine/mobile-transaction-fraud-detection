import 'package:flutter/material.dart';
import '../widgets/carte.dart';
import '../widgets/bouton.dart';

class Analyse extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          SizedBox(height: 60),

          Text(
            "Analyse IA des transactions",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          Carte(
            child: TextField(
              controller: controller,
              maxLines: 6,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Collez le SMS ici...",
                border: InputBorder.none,
              ),
            ),
          ),

          SizedBox(height: 20),

          Bouton(
            texte: "Analyser avec IA",
            onTap: () {},
          )
        ],
      ),
    );
  }
}