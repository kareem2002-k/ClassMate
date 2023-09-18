import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCont = TextEditingController();
    final emailCont = TextEditingController();
    final passCont = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                hintText: 'Enter your name',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: Text(
              "Email",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: TextField(
              controller: nameCont,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                hintText: 'Enter your email',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: Text(
              "Password",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                hintText: 'Enter your password',
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(16.0),
                primary: Colors.blue, // Background color
                onPrimary: Colors.white, // Text color
              ),
              child: Text("Sign Up"), // Button text
            ),
          ),
          SizedBox(height: 20.0),
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
                  "or continue with",
                  style: TextStyle(color: Colors.grey[600]),
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
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(12.0)),
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset("assets/images/google.png"),
                        width: 50.0,
                        height: 50.0,
                        // padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                      ),
                      Text(
                        "Register with Google",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
