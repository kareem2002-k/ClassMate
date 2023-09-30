import 'package:flutter/material.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({Key? key}) : super(key: key);

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedTopic = 'Topic 1';
  String _notificationMessage = '';

  // List of predefined topics
  final List<String> _topics = ['Topic 1', 'Topic 2', 'Topic 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Topic',
                ),
                value: _selectedTopic,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTopic = newValue!;
                  });
                },
                items: _topics.map((topic) {
                  return DropdownMenuItem<String>(
                    value: topic,
                    child: Text(topic),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Notification Message',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
                onSaved: (value) {
                  _notificationMessage = value!;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Send Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
