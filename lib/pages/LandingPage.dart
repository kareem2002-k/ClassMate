import 'package:class_mate/pages/SignUp.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double height = 300;
  double width = 300;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      // body:
      // InkWell(
      //     child: Container(
      //       width: width,
      //       height: height,
      //       color: const Color.fromARGB(255, 189, 217, 255),
      //       child: Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             SizedBox(height: height/3.8,),
      //             Center(
      //               child: Image.asset("assets/images/classmate2.jpg", scale: 2,),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.only(top: 20.0),
      //               child: Container(
      //                 width: 200,
      //                   height: 50,
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(40.0), // Adjust the border radius as needed
      //                     // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50),), // Adjust the border radius as needed
      //                   ),
      //                   child: const Center(child: Text("Tap anywhere!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),))),
      //             )
      //           ],
      backgroundColor: Color(0xFF7BB4E3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to \nClassmate',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Your Way to A+',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 0),
            Image.asset(
              'assets/images/classmate1.png',
              width: 450,
              height: 350,
            ),
            SizedBox(height: 0), // Adjust spacing as needed
            SizedBox(
              width: 296,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Let\'s go',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text(
                'Continue as Guest',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
