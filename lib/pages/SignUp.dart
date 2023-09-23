import 'package:class_mate/pages/HomePage.dart';
import 'package:class_mate/services/authentication_service.dart';
import 'package:flutter/material.dart';

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

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      String? result = await AuthenticationService().signUp(
        emailCont.text,
        passCont.text,
        nameCont.text,
      );

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  validator: (val) => val!.isEmpty ? 'Enter a Name' : null,
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
                  validator: (val) => val!.isEmpty ? 'Enter an E-mail' : null,
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
                        await _handleSignUp();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 18, color: Colors.white),
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
                        if (_formKey.currentState!.validate()) {
                          print(emailCont.text);
                          print(passCont.text);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            // padding: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: Image.asset("assets/images/google.png"),
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
}
