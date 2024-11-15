import 'package:flutter/material.dart';
import 'package:myapp/views/userlistscreen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  final List<Widget> _pages = [
    const UserListScreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavCurrentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _bottomNavCurrentIndex = index;
        });
      },
      currentIndex: _bottomNavCurrentIndex,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.person,
            color: Colors.blueAccent,
          ),
          label: 'Halaman User',
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home,
            color: Colors.blueAccent,
          ),
          label: 'Home',
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home,
            color: Colors.blueAccent,
          ),
          label: 'Home',
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home,
            color: Colors.blueAccent,
          ),
          label: 'Home',
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
