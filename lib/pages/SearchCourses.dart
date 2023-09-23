import 'package:flutter/material.dart';

class SearchCourses extends StatefulWidget {
  const SearchCourses({Key? key}) : super(key: key);

  @override
  _SearchCoursesState createState() => _SearchCoursesState();
}

class _SearchCoursesState extends State<SearchCourses> {
  bool _isCoursesSelected = true;

  void _toggleSelected(bool selected) {
    setState(() {
      _isCoursesSelected = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                  const Text(
                    'Hi, Kareem',
                    style: TextStyle(
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
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter_list,
                        color: Colors.grey,
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
                  ? const Text('Courses Content')
                  : const Text('Centers Content'),
            ],
          ),
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
          decoration: BoxDecoration(),
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
