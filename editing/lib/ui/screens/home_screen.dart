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

class _KnowledgebaseScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          tooltip: 'Menu',
          onPressed: () {},
        ),
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search_outlined),
            tooltip: 'Search',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_outlined),
            tooltip: 'Create',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            tooltip: 'More options',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
        bottom: TabBar(
          tabAlignment: TabAlignment.fill,
          controller: _tabController,
          isScrollable: false,
          tabs: const [
            Tab(
              text: "Journal",
            ),
            Tab(
              text: "Notes",
            ),
          ],
        ),
      ),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
