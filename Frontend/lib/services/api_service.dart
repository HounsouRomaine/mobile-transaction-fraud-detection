import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = "http://10.0.2.2:8000";
  // ⚠️ Android emulator → 10.0.2.2 = localhost

  static Future<Map<String, dynamic>> analyserImage(File image) async {
    var requete = http.MultipartRequest('POST', Uri.parse("$baseUrl/analyser"));

    requete.files.add(await http.MultipartFile.fromPath('fichier', image.path));

    var reponse = await requete.send();
    var resultat = await http.Response.fromStream(reponse);

    return jsonDecode(resultat.body);
  }
}
