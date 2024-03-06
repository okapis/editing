import 'package:editing/store/note_list.dart';
import 'package:editing/ui/screens/idea_list.dart';
import 'package:editing/ui/screens/home_screen.dart';
import 'package:editing/ui/screens/note_list.dart';
import 'package:editing/ui/screens/password_list.dart';
import 'package:editing/ui/screens/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class TabConfig {
  final String name;
  final Widget content;

  TabConfig(this.name, this.content);
}

class PageConfig {
  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final List<String> tabs;
  final List<Widget> content;
  final IconData floatButtonIcon;
  final String floatButtonText;

  PageConfig(
      {required this.title,
      required this.icon,
      required this.selectedIcon,
      required this.tabs,
      required this.content,
      required this.floatButtonIcon,
      required this.floatButtonText});
}

final List<PageConfig> config = [
  PageConfig(
    title: '主页',
    icon: Icons.light_outlined,
    selectedIcon: Icons.light_sharp,
    tabs: [],
    content: [HomeScreen()],
    floatButtonIcon: Icons.message_outlined,
    floatButtonText: 'AI问答',
  ),
  PageConfig(
    title: '笔记',
    icon: Icons.list_outlined,
    selectedIcon: Icons.list_sharp,
    tabs: ['日记', '笔记', '想法', '待办'],
    content: [
      NoteListScreen('journal'),
      NoteListScreen('note'),
      NoteListScreen('idea'),
      NoteListScreen('todo')
    ],
    floatButtonIcon: Icons.add_outlined,
    floatButtonText: '创建',
  ),
  PageConfig(
    title: '相册',
    icon: Icons.image_outlined,
    selectedIcon: Icons.image_sharp,
    tabs: ['照片', '视频', '相册', '录音'],
    content: [
      NoteListScreen('photo'),
      NoteListScreen('video'),
      NoteListScreen('album'),
      NoteListScreen('recoding')
    ],
    floatButtonIcon: Icons.add_outlined,
    floatButtonText: '创建',
  ),
  PageConfig(
    title: '密码',
    icon: Icons.password_outlined,
    selectedIcon: Icons.password_sharp,
    tabs: [],
    content: [PasswordListScreen()],
    floatButtonIcon: Icons.add_outlined,
    floatButtonText: '创建',
  ),
];

class _AppScaffoldState extends State<AppScaffold>
    with TickerProviderStateMixin {
  int currentPageIndex = 0;
  late List<TabController> tabControllers;

  @override
  void initState() {
    super.initState();
    tabControllers = config
        .map((e) => TabController(vsync: this, length: e.tabs.length))
        .toList();
  }

  @override
  void dispose() {
    for (var controller in tabControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _onAdd(BuildContext context) async {
    final notes = Provider.of<NoteList>(context, listen: false);
    //notes.addNote('test', 'test');
  }

  AppBar _createAppBar() {
    bool hasTab = config[currentPageIndex].tabs.isNotEmpty;
    return AppBar(
      leading: Icon(Icons.menu_outlined),
      title: Text('谛听笔记'),
      bottom: hasTab ? _createTabBar() : null,
      actions: [
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  TabBar _createTabBar() {
    final List<Tab> tabs = config[currentPageIndex]
        .tabs
        .map(
          (e) => Tab(text: e),
        )
        .toList();
    return TabBar(
      tabs: tabs,
      controller: tabControllers[currentPageIndex],
    );
  }

  Widget _createBody() {
    bool hasTab = config[currentPageIndex].tabs.isNotEmpty;
    if (!hasTab) return config[currentPageIndex].content[0];
    return TabBarView(
        controller: tabControllers[currentPageIndex],
        children: config[currentPageIndex].content);
  }

  List<NavigationDestination> _createBottomNavigation() {
    return config
        .map((e) => NavigationDestination(
              selectedIcon: Icon(e.icon),
              icon: Icon(e.selectedIcon),
              label: e.title,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _createAppBar(),
        body: _createBody(),
        floatingActionButton: FloatingActionButton(
          tooltip: config[currentPageIndex].floatButtonText,
          onPressed: () => _onAdd(context),
          child: Icon(config[currentPageIndex].floatButtonIcon),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber[800],
          selectedIndex: currentPageIndex,
          destinations: _createBottomNavigation(),
        ));
  }
}
