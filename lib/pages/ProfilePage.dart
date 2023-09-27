import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/authentication_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = AuthenticationService().currentUser;
  var name, university, faculty;

  @override
  Widget build(BuildContext context) {
    name = user!.displayName!;
    university = "Ain Shams";
    faculty = "Engineering";
    final TextEditingController _nameCont = TextEditingController(text: name);
    final TextEditingController _emailCont =
        TextEditingController(text: user!.email);
    final TextEditingController _uniCont =
        TextEditingController(text: university);
    final TextEditingController _facultyCont =
        TextEditingController(text: faculty);

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(
      //     color: Colors.black, //change your color here
      //   ),
      //   elevation: 0,
      // ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 40,
              right: 0,
              left: 0, // Position at the top-right corner
              child: Container(
                width: 150, // Adjust the width as needed
                height: 90, // Adjust the height as needed
                child: const Image(
                  image: AssetImage('assets/images/user.png'),
                ),
              ),
            ),
            // Back Arrow Button
            // Positioned(
            //   top: 22,
            //   left: 0,
            //   child: IconButton(
            //     iconSize: 33,
            //     icon: Icon(Icons.arrow_back),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ),
            Positioned(
              top: 130,
              bottom: 0,
              child: Container(
                width: 360,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0x6082AFC4), // Start color (with opacity)
                      Color(0x50B4E7FF), // End color (with opacity)
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  // Wrap the Column with SingleChildScrollView
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: Text(
                          "Name",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: TextField(
                          // controller: emailCont,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: 'Enter your Name',
                          ),
                          controller: _nameCont,
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: TextField(
                          enabled: false,
                          // controller: passCont,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: '',
                          ),
                          controller: _emailCont,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: Text(
                          "University",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: TextField(
                          // controller: passCont,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: 'Ain shams',
                          ),
                          controller: _uniCont,
                        ),
                      ), // Add spacing
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: Text(
                          "faculty",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: TextField(
                          // controller: passCont,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: 'Engineering',
                          ),
                          controller: _facultyCont,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                //  await _handleLogin();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "update profile",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
