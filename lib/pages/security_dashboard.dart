import 'package:flutter/material.dart';
import 'visitor_entry_page.dart';
import 'visitor_list_file.dart';

class SecurityDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Dashboard'),
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          MenuTile(
            icon: Icons.add,
            title: 'Add Visitor Entry',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VisitorEntryPage()),
              );
            },
          ),
          MenuTile(
            icon: Icons.list,
            title: 'View All Visitors',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VisitorListFile()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Define MenuTile Widget
class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.black),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
