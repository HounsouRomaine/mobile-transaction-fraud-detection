import 'package:flutter/material.dart';
import 'upload.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fraud AI")),
      body: Center(
        child: ElevatedButton(
          child: Text("Scanner une preuve"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Upload()),
            );
          },
        ),
      ),
    );
  }
}
