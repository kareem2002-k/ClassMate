import 'package:flutter/material.dart';
import 'package:class_mate/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:class_mate/pages/LoginPage.dart';
import 'AccountPage.dart';
import 'SearchCourses.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index of the selected tab

  final List<Widget> _pages = [
    const SearchCourses(), // Your original home page content
    const SettingsPage(), // Add your SettingsPage here
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
            return const LoginPage();
          } else {
            return Scaffold(
              body: _pages[_selectedIndex], // Show the selected page content
              bottomNavigationBar: FlashyTabBar(
                selectedIndex: _selectedIndex,
                onItemSelected: _onItemTapped,
                items: [
                  FlashyTabBarItem(
                    icon: const Icon(
                      Icons.home,
                      size: 30, // Adjust the size as needed
                      color: Colors.grey, // Adjust the color as needed
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 16, // Adjust the font size as needed
                        fontWeight:
                            FontWeight.bold, // Adjust the font weight as needed
                        color: Color(
                            0xFF52B6DF), // Adjust the text color as needed
                      ),
                    ),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Icons.person,
                      size: 30, // Adjust the size as needed
                      color: Colors.grey, // Adjust the color as needed
                    ),
                    title: const Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 16, // Adjust the font size as needed
                        fontWeight:
                            FontWeight.bold, // Adjust the font weight as needed
                        color: Color(
                            0xFF52B6DF), // Adjust the text color as needed
                      ),
                    ),
                  ),
                ],
                animationDuration: const Duration(milliseconds: 200),
                animationCurve: Curves.easeInExpo,
              ),
            );
          }
        } else {
          return const Scaffold(
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
