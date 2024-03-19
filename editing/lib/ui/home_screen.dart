import 'package:drift/drift.dart' as drift;
import 'package:editing/store/note_list.dart';
import 'package:editing/ui/pages/activity.dart';
import 'package:editing/ui/pages/assistant.dart';
import 'package:editing/ui/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../database/database.dart';
import 'widgets/activity.dart';
import 'widgets/task.dart';
import 'pages/note_list.dart';

class SecondaryTab {
  List<Widget> tabWidgets;
  TabController tabController;
  List<Tab> tabs;

  SecondaryTab({
    required this.tabController,
    required this.tabWidgets,
    required this.tabs,
  });
}

class PageMeta {
  String title;
  Widget? widget;
  SecondaryTab? secondaryTab;
  Widget? floatingActionButton;

  PageMeta(
      {required this.title,
      this.widget,
      this.secondaryTab,
      this.floatingActionButton});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentPageIndex = 0;

  final List<PageMeta> metas = [
    PageMeta(
        title: "Curator",
        widget: WelcomePage(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () {},
        ))
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meta = metas.elementAt(currentPageIndex);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          tooltip: 'Menu',
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(meta.title),
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
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notes),
            icon: Icon(Icons.notes_outlined),
            label: 'Notes',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.image),
            icon: Icon(Icons.image_outlined),
            label: 'Files',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.security),
            icon: Icon(Icons.security_outlined),
            label: 'Passwords',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('2'),
              child: Icon(Icons.file_open),
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.message_outlined),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: metas.elementAt(currentPageIndex).widget,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Settings'),
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: Text('Logout'),
              onTap: () {
                // Handle option 2 tap
              },
            ),
            // Add more ListTile options as needed
          ],
        ),
      ),
      floatingActionButton: meta.floatingActionButton,
    );
  }
}
