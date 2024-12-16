import 'package:flutter/material.dart';
import 'api/visitor_api.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: FutureBuilder(
        future: VisitorAPI.getAllVisitors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final visitorList = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: visitorList.length,
              itemBuilder: (context, index) {
                final visitor = visitorList[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(visitor['name']),
                    subtitle: Text('Reason: ${visitor['reason']}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}