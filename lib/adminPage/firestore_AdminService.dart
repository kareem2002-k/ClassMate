import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AdminService {
  final CollectionReference _adminCollection =
      FirebaseFirestore.instance.collection('admin');

  Future<void> addCourse(
      String courseName, String courseCode, String courseDescription) async {
    try {
      final CollectionReference coursesCollection =
          FirebaseFirestore.instance.collection('courses');
      await coursesCollection.add({
        'courseName': courseName,
        'courseCode': courseCode,
        'courseDescription': courseDescription,
        'faculty': 'Engineering',
        'university': 'Ain Shams',
        'materials': [],
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> DeleteCourse(String courseID) async {
    try {
      final CollectionReference coursesCollection =
          FirebaseFirestore.instance.collection('courses');
      await coursesCollection.doc(courseID).delete();
    } catch (e) {
      print(e);
    }
  }
}
