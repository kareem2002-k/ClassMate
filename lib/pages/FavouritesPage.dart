import 'package:class_mate/widgets/FollowedCourseItem.dart';
import 'package:flutter/material.dart';
import 'package:class_mate/Classes/Course.dart'; // Assuming Course class is defined here
import 'package:class_mate/services/firestore_service.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Course>>(
        future: firestoreService.getFollowingCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for data
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle errors if there are any
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Display a message when there are no following courses
            return Center(child: Text('You are not following any courses.'));
          } else {
            // Display the list of following courses in a scrollable view
            final followingCourses = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: followingCourses.length,
                    itemBuilder: (context, index) {
                      final course = followingCourses[index];
                      return FollowedCourseItem(
                        courseName: course.courseName,
                        courseCode: course.courseCode,
                        courseID: course.courseID,
                        isFollowed: true,
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
