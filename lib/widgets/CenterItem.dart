import 'package:flutter/material.dart';

class CenterItem extends StatelessWidget {
  final String centerID;
  final String centerName;
  final String instructorName;
  final String courseDate;
  final String courseTime;
  const CenterItem({
    required this.courseDate,
    Key? key,
    required this.centerID,
    required this.centerName,
    required this.instructorName,
    required this.courseTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}
