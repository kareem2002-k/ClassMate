import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/classmate1.png",
                width: 67,
                height: 63,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8, 20, 0),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1.0,
                        color: Colors.grey.shade300,
                      ), // Top border
                      bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey.shade300,
                      ), // Bottom border
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Name of student",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[350],
                        child: IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Profile Tab
                      InkWell(
                        onTap: () {
                          // Handle the row tap action here
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Icon(Icons.person_outline),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Profile"),
                            SizedBox(
                              width: 200,
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),

                      // Settings Tab
                      InkWell(
                        onTap: () {
                          // Handle the row tap action here
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Icon(Icons.settings),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Settings"),
                            SizedBox(
                              width: 200,
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                      // About Tab
                      InkWell(
                        onTap: () {
                          // Handle the row tap action here
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Icon(Icons.info),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("About Us"),
                            SizedBox(
                              width: 200,
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
