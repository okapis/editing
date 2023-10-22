import 'package:editing/ui/screens/idea_list.dart';
import 'package:editing/ui/screens/knowledgebase.dart';
import 'package:editing/ui/screens/note_list.dart';
import 'package:editing/ui/screens/password_list.dart';
import 'package:editing/ui/screens/tools.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: const Text('谛听笔记'),
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        body: const <Widget>[
          IdeaListScreen(),
          NoteListScreen(),
          KnowledgebaseScreen(),
          PasswordListScreen(),
          ToolsScreen(),
        ][currentPageIndex],
        floatingActionButton: const FloatingActionButton(
          tooltip: 'Add',
          onPressed: null,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber[800],
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.light_sharp),
              icon: Icon(Icons.light_outlined),
              label: '想法',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.list_sharp),
              icon: Icon(Icons.list_outlined),
              label: '笔记',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.image_sharp),
              icon: Icon(Icons.image_outlined),
              label: '相册',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.password_sharp),
              icon: Icon(Icons.password_outlined),
              label: '密码',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings_sharp),
              icon: Icon(Icons.settings_outlined),
              label: '工具',
            ),
          ],
        ));
  }
}
