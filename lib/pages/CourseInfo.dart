import 'package:flutter/material.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({super.key});

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  bool isCourseFollowed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OOP Course', style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),), // * fetch course name
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0, // Set the elevation to 0 to remove any shadow
            actions: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.menu_book_outlined, color: Colors.black,),
              )
            ]
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.red,
                child: Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Text('OOP Course', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),), // * fetch course name
                      ),
                      const Text('CSE111 - Computer', style: TextStyle(fontSize: 15),),
                      const SizedBox(height: 25,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: const Color.fromARGB(255, 233,240,255)
                        ),
                          onPressed: (){
                            // * toggle follow or unfollow
                            setState(() {
                              isCourseFollowed = !isCourseFollowed;
                            });
                          },
                          child: Text(isCourseFollowed? 'Unfollow' : 'Follow'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
