class Course {
  final String courseName;
  final String courseCode;
  final String courseID;
  bool isFollowing; // Remove 'final' to allow changes

  Course({
    required this.courseName,
    required this.courseCode,
    required this.courseID,
    required this.isFollowing, // Include the boolean field
  });
}
