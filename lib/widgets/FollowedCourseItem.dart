import 'package:flutter/material.dart';
import 'package:class_mate/pages/CourseInfo.dart';

class FollowedCourseItem extends StatelessWidget {
  final String courseName;
  final String courseCode;
  final String courseID;
  final bool isFollowed; // Add this property

  const FollowedCourseItem({
    required this.courseName,
    required this.courseCode,
    required this.courseID,
    required this.isFollowed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CourseInfoScreen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CourseInfo(
              courseID: this.courseID,
              courseName: this.courseName,
              courseCode: this.courseCode,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.70, -0.72),
            end: Alignment(-0.7, 0.72),
            colors: [Color(0xFF8A78FF), Color(0xFF5451D6)],
          ),
          borderRadius: BorderRadius.circular(16), // Adjusted border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      courseCode,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: Container(
                  width: 120, // Adjusted width
                  height: 40, // Adjusted height
                  decoration: BoxDecoration(
                    color: isFollowed
                        ? const Color(0xFF42A5F5) // Followed color
                        : const Color(0xFFE57373), // Unfollowed color
                    borderRadius: BorderRadius.circular(20), // Rounded button
                  ),
                  child: Center(
                    child: Text(
                      isFollowed ? 'Following' : 'Follow',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
