import 'package:class_mate/adminPage/EditCoursePage.dart';
import 'package:flutter/material.dart';
import 'package:class_mate/adminPage/AddCoursePage.dart';
import 'PushNotification.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Options'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add a Course'),
            onTap: () {
              // navigate to AddCoursePage
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddCoursePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Course'),
            onTap: () {
              // Handle Edit Course option
              // navigate to AddCoursePage
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditCoursePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Push Notification to Course'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PushNotification(),
                ),
              );
              // Handle Push Notification option
            },
          ),
        ],
      ),
    );
  }
}
