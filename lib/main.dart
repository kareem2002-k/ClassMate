import 'package:class_mate/pages/LandingPage.dart';
import 'package:class_mate/pages/LoginPage.dart';
import 'package:class_mate/pages/ProfilePage.dart';
import 'package:class_mate/pages/AccountPage.dart';
import 'package:class_mate/pages/SignUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:class_mate/pages/BottomNavBar.dart';
import 'services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/sign_up': (context) => const SignUp(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),
      },
      home: const AuthCheck(),
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthenticationService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const LandingPage();
          } else {
            return HomePage(); // Remove the null check operator here
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
}
