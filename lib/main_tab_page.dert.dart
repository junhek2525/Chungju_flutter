import 'package:chungju_lecture/chat_page.dert.dart';
import 'package:flutter/material.dart';
import 'package:chungju_lecture/todo_remote.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {

  int _selectedIndex = 0;
  final List<Widget> _pages = const[
    TodoRemotePage(),
    ChatPage()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        })
        ,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
            label: '할일'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: '할일'
          )
        ],
      ),
    );
  }
}
