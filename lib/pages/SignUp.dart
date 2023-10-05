import 'package:class_mate/pages/HomeScreen.dart';
import 'package:class_mate/services/authentication_service.dart';
import 'package:class_mate/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameCont = TextEditingController();
  final emailCont = TextEditingController();
  final passCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var hidePass = true;
  var passIcons = const Icon(Icons.visibility_off);
  bool loading = false;
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  // Valid email domains
  final List<String> allowedDomains = ['gmail.com', 'hotmail.com', 'yahoo.com'];

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a password';
    }

    final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$');

    if (!passwordRegExp.hasMatch(value)) {
      String error = '';

      if (value.length < 8) {
        error += 'Password must be at least 8 characters long. ';
      } else if (!value.contains(RegExp(r'[A-Z]'))) {
        error += 'Password must contain at least one uppercase letter. ';
      } else if (!value.contains(RegExp(r'\d'))) {
        error += 'Password must contain at least one digit.';
      }

      return error.trim(); // Return the combined error message
    }

    return null; // Return null if the password is valid
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a Name';
    }

    // Regular expression to match alphabetic characters only
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

    if (!nameRegExp.hasMatch(value)) {
      return 'Name can only contain letters';
    }

    return null; // Return null if the name is valid
  }

  // Custom email validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter an E-mail';
    }

    final emailParts = value.split('@');
    if (emailParts.length != 2 || !allowedDomains.contains(emailParts[1])) {
      return 'Enter a valid email address';
    }

    return null; // Return null if the email is valid
  }

  Future<void> _handleSignUp() async {
    setState(() => loading = true);

    if (_formKey.currentState!.validate()) {
      // Custom password validation
      final password = passCont.text;
      final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$');

      if (!passwordRegExp.hasMatch(password)) {
        setState(() => loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: Password does not meet the criteria."),
          ),
        );
        return;
      }

      String? result = await AuthenticationService().signUp(
        emailCont.text,
        passCont.text,
        nameCont.text,
      );

      // Dismiss the loading page
      setState(() => loading = false);

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
            builder: (context) => const HomePage(),
          ),
        );
        // Remove the previous routes from the stack
        Navigator.of(context).removeRoute(
          ModalRoute.of(context)!,
        );
      }
    } else {
      setState(() => loading = false);
    }
  }

  Future<void> _handleGoogleSignUp() async {
    setState(() => loading = true);

    try {
      // Sign out from Google first (if the user is already signed in)
      await AuthenticationService().signOutGoogle();

      // Sign up with Google
      User? result = await AuthenticationService().registerWithGoogle();

      // Dismiss the loading page
      setState(() => loading = false);

      if (result != null) {
        // Navigate to the home page and replace the current route
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        // Remove the previous routes from the stack
        Navigator.of(context).removeRoute(
          ModalRoute.of(context)!,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error: Failed to register"),
          ),
        );
      }
    } catch (e) {
      // Handle any exceptions that might occur during sign-out or sign-up
      print("Error: $e");
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Sign Up"),
              centerTitle: true,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                      child: TextFormField(
                        validator: validateName,
                        controller: nameCont,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          hintText: 'Enter your name',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                      child: Text(
                        "E-mail",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                      child: TextFormField(
                        validator: validateEmail,
                        controller: emailCont,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          hintText: 'Enter your e-mail',
                        ),
                      ),
                    ),
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
                        validator: validatePassword,
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

                    const SizedBox(height: 50),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: MaterialButton(
                            onPressed: () async {
                              setState(() => loading = true);
                              await _handleSignUp();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8.0),
                              height: 1.0, // Adjust the height as needed
                              color: Colors.grey[600], // Color of the dashes
                            ),
                          ),
                          Text(
                            "or",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              height: 1.0, // Adjust the height as needed
                              color: Colors.grey[600], // Color of the dashes
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300, // Border color
                                width: 2.0, // Border width
                              ),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: MaterialButton(
                            onPressed: () async {
                              setState(() => loading = true);
                              await _handleGoogleSignUp();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  // padding: EdgeInsets.all(10.0),
                                  alignment: Alignment.center,
                                  child:
                                      Image.asset("assets/images/google.png"),
                                ),
                                const Text(
                                  "Register with Google",
                                  style: TextStyle(fontSize: 18),
                                )
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
                          "Already signed up ?",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            //pop to login page
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text("Login"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    nameCont.dispose();
    super.dispose();
  }
}
