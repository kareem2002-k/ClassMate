import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class CourseInfo extends StatefulWidget {
  final String courseName;
  final String courseCode;
  const CourseInfo({super.key, required this.courseName, required this.courseCode});

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  bool isCourseFollowed = false;
  final firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text(widget.courseName, style: const TextStyle(color: Colors.black, fontFamily: 'Poppins'),), // * fetch course name
          centerTitle: true,
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.white,
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
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0), // Adjust the border radius as needed
                  // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50),), // Adjust the border radius as needed
                ),
                width: width - 50,
                height: 250,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(widget.courseName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),), // * fetch course name
                      ),
                      Text('${widget.courseCode} - CESS', style: TextStyle(fontSize: 15, color: Colors.grey[700]),),
                      const SizedBox(height: 25,),
                      Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 211,220,230), // Specify your desired border color here
                            width: 1.5, // Specify your desired border width here
                          ),
                          borderRadius: BorderRadius.circular(32.0), // Adjust the border radius as needed
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: const Color.fromARGB(255, 233,240,255),
                            foregroundColor: Colors.black,
                          ),
                            onPressed: (){
                              // * toggle follow or unfollow
                              setState(() {
                                isCourseFollowed = !isCourseFollowed;
                              });
                            },
                            child: Text(isCourseFollowed? 'Unfollow' : 'Follow', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        ),
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
