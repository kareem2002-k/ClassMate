import 'package:class_mate/pages/AvailableCenters.dart';
import 'package:class_mate/services/firestore_service.dart';
import 'package:flutter/material.dart';

class CourseInfo extends StatefulWidget {
  final String courseID;
  final String courseName;
  final String courseCode;

  const CourseInfo({
    required this.courseID,
    required this.courseName,
    required this.courseCode,
    Key? key,
  }) : super(key: key);

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  bool isCourseFollowed = false;
  final FirestoreService firestoreService =
      FirestoreService(); // Initialize your FirestoreService

  Future<bool> fetchCourseData() async {
    try {
      return await firestoreService.isFollowingCourse(widget.courseID);
    } catch (e) {
      print('Error fetching course data: $e');
      return false; // Return false in case of an error
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch the course data using courseId from Firestore
    fetchCourseData().then((isFollowing) {
      setState(() {
        isCourseFollowed = isFollowing;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text(
            widget.courseName,
            style: const TextStyle(color: Colors.black, fontFamily: 'Poppins'),
          ), // * fetch course name
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0, // Set the elevation to 0 to remove any shadow
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.menu_book_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  width: width - 50,
                  height: 250,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Text(
                            widget.courseName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                        Text(
                          widget.courseCode,
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FutureBuilder<bool>(
                          future: fetchCourseData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // Loading indicator
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError || !snapshot.data!) {
                              // Error message or Follow button (assuming false indicates not following)
                              return Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 211, 220, 230),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: const Color.fromARGB(
                                        255, 233, 240, 255),
                                    foregroundColor: Colors.black,
                                  ),
                                  onPressed: () async {
                                    // * Prevent button click while fetching
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return;
                                    }

                                    // * Toggle follow or unfollow
                                    final isFollowing = snapshot.data ?? false;
                                    setState(() {
                                      isCourseFollowed = !isFollowing;
                                    });

                                    // * Update the Firestore and handle errors
                                    try {
                                      await firestoreService
                                          .toggleFollowCourse(widget.courseID);
                                    } catch (e) {
                                      print('Error toggling follow status: $e');
                                      // Handle the error (e.g., show an error message)
                                      setState(() {
                                        isCourseFollowed =
                                            !isFollowing; // Revert the state
                                      });
                                    }
                                  },
                                  child: Text(
                                    isCourseFollowed ? 'Unfollow' : 'Follow',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              // Follow button (assuming true indicates following)
                              return Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 211, 220, 230),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: const Color.fromARGB(
                                        255, 233, 240, 255),
                                    foregroundColor: Colors.black,
                                  ),
                                  onPressed: () async {
                                    // * Prevent button click while fetching
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return;
                                    }

                                    // * Toggle follow or unfollow
                                    final isFollowing = snapshot.data ?? false;
                                    setState(() {
                                      isCourseFollowed = !isFollowing;
                                    });

                                    // * Update the Firestore and handle errors
                                    try {
                                      await firestoreService
                                          .toggleFollowCourse(widget.courseID);
                                    } catch (e) {
                                      print('Error toggling follow status: $e');
                                      // Handle the error (e.g., show an error message)
                                      setState(() {
                                        isCourseFollowed =
                                            !isFollowing; // Revert the state
                                      });
                                    }
                                  },
                                  child: Text(
                                    isCourseFollowed ? 'Unfollow' : 'Follow',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Study Material Option
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            width: 118.50713348388672,
                            height: 120.6663818359375,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xff316d86),
                            ),
                            child: const Icon(
                              Icons.book,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Study Material"),
                      ],
                    ),
                    // Instructors
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AvailableCenters(
                                  courseID: '',
                                ), // Replace with your CourseInfoScreen widget
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            width: 118.50713348388672,
                            height: 120.6663818359375,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xff79bca4),
                            ),
                            child: const Icon(
                              Icons.apartment,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Available Centers"),
                      ],
                    ),
                    // Third Option
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
