import 'package:editing/ui/screens/onboarding/getting_started.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboarding/about.dart';
import 'onboarding/settings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  _OnboardingScreenState();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  Widget _createBackground() {
    return Opacity(
      opacity: 0.8,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/green.jpeg"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  static final tabNames = ["Welcome", "Settings", "Getting Started"];

  Widget _createTabBar() {
    return IgnorePointer(
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.red,
        tabs: tabNames.map((tabName) => Tab(text: tabName)).toList(),
      ),
    );
  }

  Widget _createTabs() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
      child: ChangeNotifierProvider<TabController>(
        create: (context) => _tabController,
        child: Column(
          children: <Widget>[
            _createTabBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: <Widget>[
                    WelcomePage(onNext: this._onNextPage),
                    SettingsPage(
                      onNext: this._onNextPage,
                      onPrevious: this._onPreviousPage,
                    ),
                    GettingStartedPage(
                      onNext: this._onNextPage,
                      onPrevious: this._onPreviousPage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPreviousPage() {
    _changeTab(-1);
  }

  void _onNextPage() {
    _changeTab(1);
  }

  void _changeTab(int movement) {
    int index = _tabController.index + movement;
    if (index >= 0 && index < tabNames.length) _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createBackground(),
          _createTabs(),
        ],
      ),
    );
  }
}
