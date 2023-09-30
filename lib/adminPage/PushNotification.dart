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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    sendNotification(_selectedTopic, _notificationMessage);
                  }
                },
                child: Text('Send Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Replace this function with your actual notification sending logic
  void sendNotification(String topic, String message) {
    // Implement your notification sending logic here
    // You can use Firebase Cloud Messaging (FCM) or another service to send the notification
    // Remember to handle errors and provide feedback to the user
    // For demonstration purposes, we'll print the message to the console
    print('Sending notification to topic: $topic with message: $message');
  }
}
