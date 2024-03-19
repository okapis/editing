import 'package:editing/ui/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'pages/note_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const pageHome = 0;
const pageNotes = 1;
const pageFiles = 2;
const pagePasswords = 3;
const pageMessages = 4;

const titles = {
  pageHome: "Curator",
  pageNotes: "Notes",
  pageFiles: "Files",
  pagePasswords: "Passwords",
  pageMessages: "Messages"
};

const noteTypes = {
  "Journals": NoteType.jounral,
  "Notes": NoteType.note,
  "Todos": NoteType.checklist,
  "Ideas": NoteType.idea,
};

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentPageIndex = 0;
  late TabController notesTabController;

  @override
  void initState() {
    super.initState();
    notesTabController = TabController(length: noteTypes.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    notesTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(titles[currentPageIndex] ?? "Curator"),
        actions: _renderActions(),
        bottom: _renderTab(),
      ),
      bottomNavigationBar: _renderNavigationBar(),
      body: _renderPage(),
      drawer: _renderDrawer(),
      floatingActionButton: _renderFloatingButton(),
    );
  }

  List<Widget> _renderActions() {
    if (currentPageIndex == pageHome) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: 'About',
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          tooltip: 'More options',
          onPressed: () {},
        ),
      ];
    } else {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.search_outlined),
          tooltip: 'Search',
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          tooltip: 'More options',
          onPressed: () {},
        ),
      ];
    }
  }

  Widget _renderFloatingButton() {
    final iconData =
        currentPageIndex == pageHome ? Icons.chat_outlined : Icons.add_outlined;
    return FloatingActionButton(
      child: Icon(iconData),
      onPressed: () {},
    );
  }

  Widget _renderPage() {
    switch (currentPageIndex) {
      case pageHome:
        return WelcomePage();
      case pageNotes:
      case pageFiles:
      case pagePasswords:
      case pageMessages:
        return const Placeholder();
      default:
        throw Exception("Unexpected page index");
    }
  }

  TabBar? _renderTab() {
    if (currentPageIndex == pageNotes) {
      final tabs = noteTypes.keys.toList().map((k) => Tab(text: k)).toList();
      return TabBar(
        tabs: tabs,
        controller: notesTabController,
      );
    }
    return null;
  }

  NavigationBar _renderNavigationBar() {
    return NavigationBar(
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
    );
  }

  Drawer _renderDrawer() {
    return Drawer(
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
    );
  }
}
