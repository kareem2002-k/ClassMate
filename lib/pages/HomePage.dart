import 'package:flutter/material.dart';
import 'package:class_mate/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = AuthenticationService().currentUser;
    // welcom page
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to ClassMate ${user!.displayName!}",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  AuthenticationService().signOut();
                },
                child: const Text("Sign Out"),
              ),
            ],
          ),
        ));
  }
}
