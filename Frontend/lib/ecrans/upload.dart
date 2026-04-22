import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/api_service.dart';
import 'resultat.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? image;

  Future<void> choisirImage() async {
    final picker = ImagePicker();
    final fichier = await picker.pickImage(source: ImageSource.gallery);

    if (fichier != null) {
      setState(() {
        image = File(fichier.path);
      });
    }
  }

  Future<void> analyser() async {
    if (image == null) return;

    final resultat = await ApiService.analyserImage(image!);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Resultat(resultat: resultat)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload preuve")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image != null
              ? Image.file(image!, height: 200)
              : Text("Aucune image sélectionnée"),

          SizedBox(height: 20),

          ElevatedButton(onPressed: choisirImage, child: Text("Choisir image")),

          ElevatedButton(onPressed: analyser, child: Text("Analyser")),
        ],
      ),
    );
  }
}
