import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_batch_9/view/calender/calneder_screen.dart';
import 'package:todo_app_batch_9/view/createtodo/create_todo_screen.dart';
import 'package:todo_app_batch_9/view/home/home_screen,.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _currentPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          CreateToDoScreen(),
          CalenderScreen(),
        ],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.add_circle),
            title: Text('Create'),
            inactiveColor: Colors.red,
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Calneder'),
            activeColor: Colors.greenAccent.shade700,
          ),
        ],
      ),
    );
  }
}
