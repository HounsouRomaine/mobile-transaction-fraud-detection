import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000"; // Android emulator

  static Future<Map<String, dynamic>> analyserSMS(String texte) async {
    var uri = Uri.parse("$baseUrl/analyser");

    var response = await http.post(
      uri,
      body: {"texte": texte},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Erreur serveur");
    }
  }
}