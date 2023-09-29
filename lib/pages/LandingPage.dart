import 'package:flutter/foundation.dart';
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
      body:
      InkWell(
          child: Container(
            width: width,
            height: height,
            color: const Color.fromARGB(255, 189, 217, 255),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height/3.8,),
                  Center(
                    child: Image.asset("assets/images/classmate2.jpg", scale: 2,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0), // Adjust the border radius as needed
                          // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50),), // Adjust the border radius as needed
                        ),
                        child: const Center(child: Text("Tap anywhere!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),))),
                  )
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            // TODO: see of you can add animation in the transition
          },
      ),
    );
  }
}
