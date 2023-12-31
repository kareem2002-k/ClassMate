import 'package:flutter/material.dart';

class CenterItem extends StatelessWidget {
  final String centerName;
  final String centerID;
  final String contactEmail;
  final String contactPhone;
  final String location;

  const CenterItem({
    required this.centerName,
    required this.centerID,
    required this.contactEmail,
    required this.contactPhone,
    required this.location,
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
            'Course Time: $contactEmail',
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
