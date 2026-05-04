import 'package:flutter/material.dart';
import '../widgets/carte.dart';

class Historique extends StatelessWidget {

  final data = [
    {"sms": "MTN transfert 5000F", "score": 90},
    {"sms": "Moov dépôt suspect", "score": 35},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        SizedBox(height: 40),

        Text(
          "Historique des analyses",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 20),

        ...data.map((e) => Carte(
          child: ListTile(
            leading: Icon(Icons.sms),
         title: Text(e["sms"].toString()),
            trailing: Text("${e["score"]}%"),
          ),
        ))
      ],
    );
  }
}