import 'package:flutter/material.dart';
import 'admin_dashboard.dart';
import 'security_dashboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(BuildContext context) {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username == 'admin' && password == '12345') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminDashboard()),
      );
    } else if (username == 'sbce' && password == 'sbce123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecurityDashboard()),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Invalid login credentials",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VisitorPro Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login to VisitorPro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => handleLogin(context),
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}