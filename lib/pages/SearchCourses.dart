import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:class_mate/services/firestore_service.dart';
import 'package:class_mate/Classes/Course.dart';
import 'package:class_mate/widgets/CourseItem.dart';

import '../services/authentication_service.dart';

class SearchCourses extends StatefulWidget {
  const SearchCourses({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchCoursesState createState() => _SearchCoursesState();
}

class _SearchCoursesState extends State<SearchCourses> {
  bool _isCoursesSelected = true;
  final firestoreService = FirestoreService();

  void _toggleSelected(bool selected) {
    setState(() {
      _isCoursesSelected = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    final screenHeight = MediaQuery.of(context).size.height;
    final User? user = AuthenticationService().currentUser;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          16.0,
          padding.top + 32.0,
          16.0,
          16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, ${user!.displayName!}',
                  style: const TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add your notification button action here
                  },
                  child: Image.asset(
                    'assets/icon/bell.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FA),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                      color: Color(0xFF7BB4E3),
                    ),
                    onPressed: () {
                      // Handle filter button press
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _toggleSelected(true),
                  child: _buildOptionButton('Courses', _isCoursesSelected),
                ),
                const SizedBox(width: 16.0),
                GestureDetector(
                  onTap: () => _toggleSelected(false),
                  child: _buildOptionButton('Centers', !_isCoursesSelected),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            _isCoursesSelected
                ? FutureBuilder<List<Course>>(
                    future: firestoreService.getAllCourses(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child:
                                CircularProgressIndicator()); // Show a loading indicator while fetching data
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text(
                            'No courses available.'); // Handle the case when no courses are available
                      } else {
                        final courses = snapshot.data;

                        return _isCoursesSelected
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight/1.67,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: courses!.length,
                                      itemBuilder: (context, index) {
                                        final course = courses[index];
                                        return CourseItem(
                                          courseName: course.courseName,
                                          courseCode: course.courseCode,
                                        );
                                      },
                                      physics:
                                          const AlwaysScrollableScrollPhysics(), // Set this property
                                    ),
                                  ),
                                ],
                              )
                            : const Text('Centers Content');
                      }
                    },
                  )
                : const Text('Centers Content'),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String text, bool isSelected) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth > 300 ? 170 : double.infinity,
          height: 48,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: constraints.maxWidth > 300 ? 170 : double.infinity,
                height: 48,
                decoration: ShapeDecoration(
                  color: isSelected
                      ? const Color(0xFF52B6DF)
                      : const Color(0xFFE8F1FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 15,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
