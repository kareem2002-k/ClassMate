import 'package:flutter/material.dart';

class EditSingleCourse extends StatefulWidget {
  final String courseName;
  final String courseCode;
  final String courseID;

  EditSingleCourse({
    Key? key,
    required this.courseName,
    required this.courseCode,
    required this.courseID,
  }) : super(key: key);

  @override
  _EditSingleCourseState createState() => _EditSingleCourseState();
}

class _EditSingleCourseState extends State<EditSingleCourse> {
  // Define TextEditingController for each field
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseCodeController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
  final TextEditingController _facultyController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Set initial values for form fields
    _courseNameController.text = widget.courseName;
    _courseCodeController.text = widget.courseCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: _courseNameController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Course Name',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _courseCodeController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Course Code',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _courseDescriptionController,
                maxLines: 3,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Course Description',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _facultyController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Faculty',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _universityController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'University',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission here
                },
                child: Text('Update Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
