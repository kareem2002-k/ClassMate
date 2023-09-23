import 'package:flutter/material.dart';
import 'package:class_mate/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:class_mate/pages/LoginPage.dart';
import 'ProfilePage.dart';
import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index of the selected tab

  final List<Widget> _pages = [
    HomePageContent(), // Your original home page content
    SettingsPage(), // Add your SettingsPage here
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthenticationService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            // Handle case where user is null (not authenticated)
            return LoginPage();
          } else {
            return Scaffold(
              body: _pages[_selectedIndex], // Show the selected page content
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            );
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your original home page content here
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to the Home Page'),
          ElevatedButton(
            onPressed: () {
              // Do something when a button is pressed on the home page
            },
            child: Text('Button on Home Page'),
          ),
        ],
      ),
    );
  }
}
