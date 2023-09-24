import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_mate/Classes/Course.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Course>> getAllCourses() async {
    try {
      final querySnapshot = await _firestore.collection('courses').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Course(
          courseName: data['courseName'],
          courseCode: data['courseCode'],
        );
      }).toList();
    } catch (e) {
      print('Error fetching courses: $e');
      return [];
    }
  }
}
