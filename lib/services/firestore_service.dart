import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_mate/Classes/Course.dart';
import 'package:flutter/foundation.dart';
import '../Classes/Center.dart';
import 'authentication_service.dart';
import 'notifications_service.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthenticationService _authenticationService = AuthenticationService();
  final NotificationsService _notificationsService = NotificationsService();

  //current user
  String get currentUserId => _authenticationService.currentUser!.uid;

  // get all courses
  Future<List<Course>> getAllCourses() async {
    try {
      final querySnapshot = await _firestore.collection('courses').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Course(
          courseName: data['courseName'],
          courseCode: data['courseCode'],
          courseID: doc.id,
          isFollowing: false,
        );
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching courses: $e');
      }
      return [];
    }
  }

  Future<List<CenterOBJ>> getAllCenters() async {
    try {
      final querySnapshot = await _firestore.collection('centers').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        //TODO : understand this
        return CenterOBJ(
          centerName: data['centerName'] ??
              '', // Provide a default value if 'centerName' is null
          centerID: doc.id,
          contactEmail: data['contactEmail'] ??
              '', // Provide a default value if 'contactEmail' is null
          contactPhone: data['contactPhone'] ??
              '', // Provide a default value if 'contactPhone' is null
          location: data['location'] ??
              '', // Provide a default value if 'location' is null
        );
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching centers: $e');
      }
      return [];
    }
  }

  //func to check if the user is following a course or not

  Future<bool> isFollowingCourse(String courseId) async {
    try {
      final userFollowing = await getUserFollowing();

      return userFollowing.contains(courseId);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user following data: $e');
      }
      return false; // Handle the error and return false
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
      if (kDebugMode) {
        print('Error fetching user following data: $e');
      }
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
        final data = doc.data();
        return Course(
          courseName: data['courseName'],
          courseCode: data['courseCode'],
          courseID: doc.id,
          isFollowing: true,
        );
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user following data: $e');
      }
      return []; // Handle the error and return an empty list
    }
  }

  // toggle follow or unfollow a course
  Future<void> toggleFollowCourse(String courseId) async {
    try {
      final isFollowing = await isFollowingCourse(courseId);

      if (isFollowing) {
        _notificationsService.unsubscribeFromTopic(courseId);
        await _firestore.collection('users').doc(currentUserId).update({
          'followed_courses': FieldValue.arrayRemove([courseId])
        });
      } else {
        _notificationsService.subscribeToTopic(courseId);
        await _firestore.collection('users').doc(currentUserId).update({
          'followed_courses': FieldValue.arrayUnion([courseId])
        });
      }
    } catch (e) {
      print('Error toggling follow course: $e');
    }
  }
}
