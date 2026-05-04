import 'package:flutter/material.dart';
import '../widgets/carte.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 60),

          Text(
            "Nukon AI ",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 6),

          Text(
            "Détection intelligente de fraude mobile",
            style: TextStyle(color: Colors.grey),
          ),

          SizedBox(height: 30),

          // STAT CARD
          Row(
            children: [
              Expanded(
                child: Carte(
                  child: Column(
                    children: [
                      Icon(Icons.shield, color: Colors.greenAccent),
                      SizedBox(height: 10),
                      Text("Transactions sûres"),
                      Text("82%", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 10),

              Expanded(
                child: Carte(
                  child: Column(
                    children: [
                      Icon(Icons.warning, color: Colors.orange),
                      SizedBox(height: 10),
                      Text("Fraudes détectées"),
                      Text("18%", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Carte(
            child: ListTile(
              leading: Icon(Icons.analytics, color: Colors.blue),
              title: Text("Analyse IA"),
              subtitle: Text("Système actif en temps réel"),
            ),
          ),
        ],
      ),
    );
  }
}