import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'history_screen.dart'; // Import the HistoryScreen
import 'profile_screen.dart'; // Import the ProfileScreen

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    HomeScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Colors.blueAccent : Colors.grey,
                  size:
                      _selectedIndex == 0 ? 30 : 24, // Size change for selected
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.history,
                  color: _selectedIndex == 1 ? Colors.blueAccent : Colors.grey,
                  size:
                      _selectedIndex == 1 ? 30 : 24, // Size change for selected
                ),
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.person,
                  color: _selectedIndex == 2 ? Colors.blueAccent : Colors.grey,
                  size:
                      _selectedIndex == 2 ? 30 : 24, // Size change for selected
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
