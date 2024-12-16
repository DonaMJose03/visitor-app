import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VisitorListFile extends StatefulWidget {
  const VisitorListFile({super.key});

  @override
  State<VisitorListFile> createState() => _VisitorListFileState();
}

class _VisitorListFileState extends State<VisitorListFile> {
  List<Map<String, dynamic>> visitors = [];

  Future<void> fetchVisitorsData() async {
    final apiUrl = Uri.parse("https://log-app-demo-api.onrender.com/getvistors");
    try {
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        setState(() {
          visitors = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVisitorsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor List"),
      ),
      body: visitors.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: visitors.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(visitors[index]["firstname"] ?? "N/A"),
              subtitle: Text(
                "Last Name: ${visitors[index]["lastname"] ?? "N/A"}\n"
                    "Purpose: ${visitors[index]["purpose"] ?? "N/A"}\n"
                    "Whom to Meet: ${visitors[index]["whomtomeet"] ?? "N/A"}\n"
                    "Date: ${visitors[index]["date"] ?? "N/A"}",
              ),
            ),
          );
        },
      ),
    );
  }
}
