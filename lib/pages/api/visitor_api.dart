import 'dart:convert';
import 'package:http/http.dart' as http;

class VisitorAPI {
  static const String baseUrl = "https://api.example.com/visitors";

  static Future<List<dynamic>> getAllVisitors() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load visitors');
    }
  }

  static Future<void> addVisitor(Map<String, dynamic> visitorData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(visitorData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add visitor');
    }
  }
}