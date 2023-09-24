import 'package:class_mate/pages/BottomNavBar.dart';
import 'package:class_mate/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color myColor = const Color.fromRGBO(179, 121, 223, 0.2);
  Color signup = const Color.fromRGBO(180, 170, 242, 100);
  final emailCont = TextEditingController();
  final passCont = TextEditingController();
  var hidePass = true;
  var passIcons = const Icon(Icons.visibility_off);

  Future<void> _handleLogin() async {
    String? result =
        await AuthenticationService().logIn(emailCont.text, passCont.text);

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $result"),
        ),
      );
    } else {
      // Navigate to the home page and replace the current route
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      // Remove the previous routes from the stack
      Navigator.of(context).removeRoute(
        ModalRoute.of(context)!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white, // Set the background color here
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0, // Position at the top-right corner
              child: Container(
                width: 210, // Adjust the width as needed
                height: 200, // Adjust the height as needed
                child: const Image(
                  image: AssetImage(
                      'assets/images/support, technology, error _ deadline, stress, man, customer service.png'),
                ),
              ),
            ),
            Positioned(
              top: 200,
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
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 30),
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
                          controller: emailCont,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: 'Enter your email',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: TextFormField(
                          validator: (val) => val!.length < 6
                              ? 'Enter a password with length of 6+ chars'
                              : null,
                          obscureText: hidePass,
                          controller: passCont,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                hidePass = !hidePass;
                                passIcons = hidePass
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility);
                                setState(() {});
                              },
                              icon: passIcons,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50), // Add spacing
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
                                if (passCont.text.length < 6) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            backgroundColor: Colors.grey[300],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            title: const Center(
                                                child: Text(
                                              "Password is too weak",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            actions: [
                                              Center(
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      // Clear the text fields here
                                                      emailCont.clear();
                                                      passCont.clear();
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("OK")),
                                              )
                                            ],
                                          ));
                                }
                                await _handleLogin();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Log in",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context,
                                  '/sign_up'); // Use push to allow navigation back to login page
                            },
                            child: const Text("Sign up"),
                          ),
                        ],
                      ),
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
