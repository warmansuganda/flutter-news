import 'package:flutter/material.dart';
import 'package:flutter_news/screens/account_screen.dart';
import 'package:flutter_news/screens/home_screen.dart';
import 'package:flutter_news/screens/library_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> screens = <Widget>[
    HomeScreen(),
    LibraryScreen(),
    AccountScreen(),
  ];

  final List<BottomNavigationBarItem> navigations = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_library),
      label: 'Library',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Account',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        items: navigations,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
