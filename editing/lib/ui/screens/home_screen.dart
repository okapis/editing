import 'package:drift/drift.dart' as drift;
import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import '../../database/database.dart';
import '../widgets/activity.dart';
import '../widgets/task.dart';
import 'note_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _KnowledgebaseScreenState();
}

class _KnowledgebaseScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  final List<Widget> pages = <Widget>[
    NoteListPage(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  void _onTabActivate(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.notes),
            icon: Icon(Icons.notes_outlined),
            label: 'Notes',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.image),
            icon: Icon(Icons.image_outlined),
            label: 'Images',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.security),
            icon: Icon(Icons.security_outlined),
            label: 'Passwords',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('2'),
              child: Icon(Icons.message),
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.message_outlined),
            ),
            label: 'Messages',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: pages.elementAt(currentPageIndex),
    );
  }
}
