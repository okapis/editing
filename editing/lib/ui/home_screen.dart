import 'package:editing/store/home.dart';
import 'package:editing/ui/pages/file_list.dart';
import 'package:editing/ui/pages/password_list.dart';
import 'package:editing/ui/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../domain/note.dart';
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
  "Journals": NoteType.journal,
  "Notes": NoteType.note,
  "Todos": NoteType.todo,
  "Ideas": NoteType.idea,
};

const fileTypes = {
  "Photos": FileType.photo,
  "Videos": FileType.video,
  "Documents": FileType.document,
  "Others": FileType.other,
};

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController notesTabController;
  late TabController filesTabController;

  @override
  void initState() {
    super.initState();
    notesTabController = TabController(length: noteTypes.length, vsync: this);
    filesTabController = TabController(length: fileTypes.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    notesTabController.dispose();
    filesTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Provider.of<HomeStore>(context);

    return Observer(
      builder: (ctx) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu_outlined),
            tooltip: 'Menu',
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Text(titles[homeStore.pageIndex] ?? "Curator"),
          actions: _renderActions(homeStore),
          bottom: _renderTab(homeStore),
        ),
        bottomNavigationBar: _renderNavigationBar(homeStore),
        body: _renderPage(homeStore),
        drawer: _renderDrawer(),
        floatingActionButton: _renderFloatingButton(homeStore),
      ),
    );
  }

  List<Widget> _renderActions(HomeStore homeStore) {
    if (homeStore.pageIndex == pageHome) {
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

  Widget _renderFloatingButton(HomeStore homeStore) {
    final iconData = homeStore.pageIndex == pageHome
        ? Icons.chat_outlined
        : Icons.add_outlined;
    return FloatingActionButton(
      child: Icon(iconData),
      onPressed: () {
        Navigator.of(context).pushNamed("/note/add");
      },
    );
  }

  Widget _renderPage(HomeStore homeStore) {
    switch (homeStore.pageIndex) {
      case pageHome:
        return WelcomePage();
      case pageNotes:
        return NoteListPage(type: homeStore.noteType);
      case pageFiles:
        return FileListPage(type: homeStore.fileType);
      case pagePasswords:
        return PasswordListPage();
      case pageMessages:
        return const Placeholder();
      default:
        throw Exception("Unexpected page index");
    }
  }

  TabBar? _renderTab(HomeStore homeStore) {
    if (homeStore.pageIndex == pageNotes) {
      final tabs = noteTypes.keys.toList().map((k) => Tab(text: k)).toList();
      return TabBar(
        tabs: tabs,
        controller: notesTabController,
        onTap: (index) =>
            homeStore.noteType = noteTypes.values.elementAt(index),
      );
    } else if (homeStore.pageIndex == pageFiles) {
      final tabs = fileTypes.keys.toList().map((k) => Tab(text: k)).toList();
      return TabBar(
        tabs: tabs,
        controller: filesTabController,
        onTap: (index) =>
            homeStore.fileType = fileTypes.values.elementAt(index),
      );
    }
    return null;
  }

  NavigationBar _renderNavigationBar(HomeStore homeStore) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        homeStore.changePage(index);
      },
      indicatorColor: Colors.amber,
      selectedIndex: homeStore.pageIndex,
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
