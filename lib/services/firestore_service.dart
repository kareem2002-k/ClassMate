import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_mate/Classes/Course.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get all courses
  Future<List<Course>> getAllCourses() async {
    try {
      final querySnapshot = await _firestore.collection('courses').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Course(
          courseName: data['courseName'],
          courseCode: data['courseCode'],
          courseID: doc.id,
          isFollowing: false,
        );
      }).toList();
    } catch (e) {
      print('Error fetching courses: $e');
      return [];
    }
  }

  //get a single course by ID

  Future<Course?> getCourseById(String courseId, String userId) async {
    try {
      final doc = await _firestore.collection('courses').doc(courseId).get();

      if (doc.exists) {
        final courseData = doc.data();

        final userFollowing = await getUserFollowing(userId);

        final isFollowing = userFollowing.contains(courseId);

        final course = Course(
          courseName: courseData!['courseName'],
          courseCode: courseData!['courseCode'],
          courseID: doc.id,
          isFollowing: isFollowing,
        );

        return course;
      }

      return null; // Course not found
    } catch (e) {
      print('Error fetching course data: $e');
      return null;
    }
  }

  Future<List<String>> getUserFollowing(String userId) async {
    try {
      final userDoc = await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        final userData = userDoc.data();

        if (userData != null && userData['followed_courses'] is List) {
          final List<dynamic> userFollowing = userData['followed_courses'];
          return userFollowing.map((item) => item.toString()).toList();
        }
      }
      return []; // Return an empty list if user data doesn't exist or no following courses
    } catch (e) {
      print('Error fetching user following data: $e');
      return []; // Handle the error and return an empty list
    }
  }
}
