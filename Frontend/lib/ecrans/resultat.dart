import 'package:flutter/material.dart';

class Resultat extends StatelessWidget {
  final bool fraude;
  final int score;

  Resultat({required this.fraude, required this.score});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              fraude ? Icons.warning : Icons.check_circle,
              size: 100,
              color: fraude ? Colors.red : Colors.green,
            ),

            SizedBox(height: 20),

            Text(
              fraude ? "Transaction frauduleuse" : "Transaction valide",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Score : $score%",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}