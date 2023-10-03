import 'package:flutter/material.dart';
import 'firestore_AdminService.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final adminService = AdminService(); // Create an instance of AdminService

  // Create controllers for the text form fields
  final _courseCodeController = TextEditingController();
  final _courseNameController = TextEditingController();
  final _courseDescriptionController = TextEditingController();
  final _facultyController = TextEditingController();
  final _universityController = TextEditingController();

  bool _isLoading = false; // Flag to track loading state

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _courseCodeController.dispose();
    _courseNameController.dispose();
    _courseDescriptionController.dispose();
    _facultyController.dispose();
    _universityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Course'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(), // Show a loading indicator
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextFormField(
                    controller: _courseCodeController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: 'Course Code',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter course code',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _courseNameController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: 'Course Name',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter course name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _courseDescriptionController,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter course description',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _facultyController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: 'Faculty',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter faculty name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _universityController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: 'University',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter university name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () async {
                      // Handle form submission here
                      final courseCode = _courseCodeController.text;
                      final courseName = _courseNameController.text;
                      final courseDescription =
                          _courseDescriptionController.text;
                      final faculty = _facultyController.text;
                      final university = _universityController.text;

                      // Check if any of the required fields are empty
                      if (courseCode.isEmpty ||
                          courseName.isEmpty ||
                          courseDescription.isEmpty) {
                        // Show an error message or handle the case where fields are empty
                        return;
                      }

                      setState(() {
                        _isLoading = true; // Set loading state to true
                      });

                      // Call the addCourse method to add the course to Firestore
                      await adminService.addCourse(
                        courseName,
                        courseCode,
                        courseDescription,
                      );

                      // Optionally, you can navigate to another page or show a success message
                      setState(() {
                        _isLoading = false; // Set loading state to false
                      });

                      // ignore: use_build_context_synchronously
                      Navigator.of(context)
                          .pop(); // Go back to the previous page
                    },
                    child: const Text('Add Course'),
                  ),
                ],
              ),
            ),
    );
  }
}
