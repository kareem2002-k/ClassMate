import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBark extends StatefulWidget {
  final ValueChanged<int> onTabTapped;

  BottomNavBark({required this.onTabTapped});

  @override
  _BottomNavBarkState createState() => _BottomNavBarkState();
}

class _BottomNavBarkState extends State<BottomNavBark> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 60.0,
        items: <Widget>[
          const Icon(Icons.add, size: 30),
          const Icon(Icons.list, size: 30),
          const Icon(Icons.compare_arrows, size: 30),
          const Icon(Icons.call_split, size: 30),
          const Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });

          // Call the callback to notify the parent about the tab change
          widget.onTabTapped(index);
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              ElevatedButton(
                child: const Text('Go To Page of index 1'),
                onPressed: () {
                  widget.onTabTapped(1); // Change to tab 1
                },
              ),
              ElevatedButton(
                child: const Text('Go To Page of index 2'),
                onPressed: () {
                  widget.onTabTapped(2); // Change to tab 2
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
