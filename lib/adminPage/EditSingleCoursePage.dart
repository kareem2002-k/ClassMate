import 'package:flutter/material.dart';
import 'firestore_AdminService.dart';

class EditSingleCourse extends StatefulWidget {
  final String courseName;
  final String courseCode;
  final String courseID;
  final String courseDescription;
  final String material;

  EditSingleCourse({
    Key? key,
    required this.courseName,
    required this.courseCode,
    required this.courseID,
    required this.courseDescription,
    required this.material,
  }) : super(key: key);

  @override
  _EditSingleCourseState createState() => _EditSingleCourseState();
}

class _EditSingleCourseState extends State<EditSingleCourse> {
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final adminService = AdminService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _courseNameController.text = widget.courseName;
    _courseDescriptionController.text = widget.courseDescription;
    _materialController.text = widget.material;
  }

  Future<void> _updateCourse() async {
    setState(() {
      _isLoading = true;
    });
    await adminService.EditCourse(
      widget.courseID,
      _courseNameController.text,
      widget.courseCode,
      _courseDescriptionController.text,
      _materialController.text,
    );

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: _courseNameController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Course Name',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Course Code',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                initialValue: widget.courseCode,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _courseDescriptionController,
                maxLines: 3,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Course Description',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _materialController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Materials',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _updateCourse,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Update Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
