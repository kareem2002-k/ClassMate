import 'package:flutter/material.dart';
import 'firestore_AdminService.dart';
import 'package:class_mate/Classes/Course.dart';
import 'package:class_mate/services/firestore_service.dart';
import 'EditSingleCoursePage.dart';

class EditCoursePage extends StatelessWidget {
  final firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Course'),
      ),
      body: Center(
        child: FutureBuilder<List<Course>>(
          future: firestoreService.getAllCourses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No courses available.');
            } else {
              final courses = snapshot.data;

              return ListView.builder(
                itemCount: courses!.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CustomCourseItem(
                    courseName: course.courseName,
                    courseCode: course.courseCode,
                    courseID: course.courseID,
                    courseDescription: course.courseDescription,
                    material: course.material,
                    // Add any other properties you want to display
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomCourseItem extends StatelessWidget {
  final String courseName;
  final String courseCode;
  final String courseID;
  final String courseDescription;
  final String material;
  final adminService = AdminService();

  CustomCourseItem({
    required this.courseName,
    required this.courseCode,
    required this.courseID,
    required this.courseDescription,
    required this.material,
  });

  @override
  Widget build(BuildContext context) {
    void _showDeleteConfirmationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Course'),
            content: const Text('Are you sure you want to delete this course?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  adminService.DeleteCourse(courseID);
                  // TODO: Handle course deletion here
                  // You can call your delete function here
                  // After deleting, close the dialog
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
    }

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Course Code: $courseCode',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Course ID: $courseID',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your edit action here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditSingleCourse(
                                courseCode: courseCode,
                                courseName: courseName,
                                courseID: courseID,
                                courseDescription: courseDescription,
                                material: material,
                              )),
                    );
                  },
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Show delete confirmation dialog
                    _showDeleteConfirmationDialog();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
