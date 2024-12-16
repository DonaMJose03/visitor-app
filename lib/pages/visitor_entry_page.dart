import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VisitorEntryPage extends StatefulWidget {
  @override
  _VisitorEntryPageState createState() => _VisitorEntryPageState();
}

class _VisitorEntryPageState extends State<VisitorEntryPage> {
  final TextEditingController id = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController purpose = TextEditingController();
  final TextEditingController whomToMeet = TextEditingController();
  final TextEditingController date = TextEditingController();

  Future<void> fetchData() async {
    final apiurl = Uri.parse("https://log-app-demo-api.onrender.com/addvisitor");
    try {
      final response = await http.post(
        apiurl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "id": id.text,
          "firstname": fname.text,
          "lastname": lname.text,
          "purpose": purpose.text,
          "whomToMeet": whomToMeet.text,
          "date": date.text,
        }),
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Visitor successfully added!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add visitor.")),
        );
      }
    } catch (exception) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $exception")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor Entry"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: id,
                decoration: InputDecoration(
                  labelText: "Visitor ID",
                  hintText: "Enter Visitor ID",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: fname,
                decoration: InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter First Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: lname,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  hintText: "Enter Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: purpose,
                decoration: InputDecoration(
                  labelText: "Purpose",
                  hintText: "Enter Purpose",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: whomToMeet,
                decoration: InputDecoration(
                  labelText: "Whom to Meet",
                  hintText: "Enter Whom to Meet",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      date.text.isEmpty ? "Select a Date" : date.text,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          date.text = "${pickedDate.toLocal()}".split(' ')[0];
                        });
                      }
                    },
                    child: Text("Pick Date"),
                  ),
                ],
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  await fetchData();
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
