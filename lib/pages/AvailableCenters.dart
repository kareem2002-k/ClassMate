import 'package:flutter/material.dart';
import 'package:class_mate/widgets/ScheduleItem.dart';

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
            ScheduleItem(
                centerID: "centerID",
                centerName: "",
                instructorName: "instructorName",
                courseDate: "courseDate",
                courseTime: "courseTime"),
            ScheduleItem(
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
