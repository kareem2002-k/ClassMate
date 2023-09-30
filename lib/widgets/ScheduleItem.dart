import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  final String centerID;
  final String centerName;
  final String instructorName;
  final String courseDate;
  final String courseTime;

  const ScheduleItem({
    required this.centerID,
    required this.centerName,
    required this.instructorName,
    required this.courseDate,
    required this.courseTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFFC2EBEE),
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Center: $centerName',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            'Instructor: $instructorName',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            'Course Date: $courseDate',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            'Course Time: $courseTime',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
