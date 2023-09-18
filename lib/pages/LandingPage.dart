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
              child: Image.asset("assets/images/classmate2.jpg", scale: 2,),
            ),
          ),
          onTap: (){
            print("you clicked me");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
      ),
    );
  }
}
