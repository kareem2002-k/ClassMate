import 'package:flutter/material.dart';
import 'package:class_mate/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:class_mate/pages/LoginPage.dart';

class HomePage extends StatelessWidget {
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
            // User is authenticated, access user properties safely
            String? displayName = user.displayName;
            String? email = user.email;

            // Check for null values before using them
            if (displayName != null && email != null) {
              return buildAuthenticatedUI(context, displayName, email);
            } else {
              // Handle case where user properties are null
              return Text("User information is missing.");
            }
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

  Widget buildAuthenticatedUI(
      BuildContext context, String displayName, String email) {
    // Build your authenticated UI here using displayName and email
    return WillPopScope(
      onWillPop: () async {
        // Prevent navigation back to the previous page
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome, $displayName'),
          automaticallyImplyLeading: false, // Hide the back button
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Email: $email'),
              ElevatedButton(
                onPressed: () {
                  AuthenticationService().signOut();
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
