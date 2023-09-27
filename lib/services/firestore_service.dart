import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_mate/Classes/Course.dart';
import 'authentication_service.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthenticationService _authenticationService = AuthenticationService();

  //current user
  String get currentUserId => _authenticationService.currentUser!.uid;

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

  Future<Course?> getCourseById(String courseId) async {
    try {
      final doc = await _firestore.collection('courses').doc(courseId).get();

      if (doc.exists) {
        final courseData = doc.data();

        final userFollowing = await getUserFollowing();

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

  Future<List<String>> getUserFollowing() async {
    try {
      final userDoc =
          await _firestore.collection('users').doc(currentUserId).get();

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

// get the courses that the user is following
  Future<List<Course>> getFollowingCourses() async {
    try {
      final userFollowing = await getUserFollowing();

      final querySnapshot = await _firestore
          .collection('courses')
          .where(FieldPath.documentId, whereIn: userFollowing)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Course(
          courseName: data['courseName'],
          courseCode: data['courseCode'],
          courseID: doc.id,
          isFollowing: true,
        );
      }).toList();
    } catch (e) {
      print('Error fetching user following data: $e');
      return []; // Handle the error and return an empty list
    }
  }
}
