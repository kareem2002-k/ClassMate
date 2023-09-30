import 'package:class_mate/widgets/CenterItem.dart';
import 'package:flutter/material.dart';

class AvailableCenters extends StatefulWidget {
  final String courseID;
  const AvailableCenters({super.key, required this.courseID});

  @override
  State<AvailableCenters> createState() => _AvailableCentersState();
}

class _AvailableCentersState extends State<AvailableCenters> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CenterItem(
                centerID: "centerID",
                centerName: "",
                instructorName: "instructorName",
                courseDate: "courseDate",
                courseTime: "courseTime"),
            CenterItem(
                centerID: "centerID",
                centerName: "",
                instructorName: "instructorName",
                courseDate: "courseDate",
                courseTime: "courseTime")
          ],
        ),
      ),
    );
  }
}
