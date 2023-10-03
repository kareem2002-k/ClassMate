class Course {
  final String courseName;
  final String courseCode;
  final String courseID;
  bool isFollowing; // Remove 'final' to allow changes
  final String courseDescription;
  final String material;

  Course(
      {required this.courseName,
      required this.courseCode,
      required this.courseID,
      required this.isFollowing,
      required this.courseDescription,
      required this.material // Include the boolean field
      });
}
