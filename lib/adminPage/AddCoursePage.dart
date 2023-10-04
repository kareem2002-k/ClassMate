import 'package:flutter/material.dart';
import 'firestore_AdminService.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final adminService = AdminService();

  final _courseCodeController = TextEditingController();
  final _courseNameController = TextEditingController();
  final _courseDescriptionController = TextEditingController();
  final _facultyController = TextEditingController();
  final _universityController = TextEditingController();
  final _materialsController =
      TextEditingController(); // Add materials controller

  bool _isLoading = false;

  @override
  void dispose() {
    _courseCodeController.dispose();
    _courseNameController.dispose();
    _courseDescriptionController.dispose();
    _facultyController.dispose();
    _universityController.dispose();
    _materialsController.dispose(); // Dispose of materials controller
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
              child: CircularProgressIndicator(),
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
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _materialsController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: 'Materials',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter materials',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () async {
                      final courseCode = _courseCodeController.text;
                      final courseName = _courseNameController.text;
                      final courseDescription =
                          _courseDescriptionController.text;
                      final faculty = _facultyController.text;
                      final university = _universityController.text;
                      final materials =
                          _materialsController.text; // Get materials

                      if (courseCode.isEmpty ||
                          courseName.isEmpty ||
                          courseDescription.isEmpty) {
                        return;
                      }

                      setState(() {
                        _isLoading = true;
                      });

                      await adminService.addCourse(
                        courseName,
                        courseCode,
                        courseDescription,

                        materials, // Pass materials to the addCourse method
                      );

                      setState(() {
                        _isLoading = false;
                      });

                      Navigator.of(context).pop();
                    },
                    child: const Text('Add Course'),
                  ),
                ],
              ),
            ),
    );
  }
}
