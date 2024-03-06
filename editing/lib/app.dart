import 'package:editing/ui/screens/home_screen.dart';
import 'package:editing/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'store/note_list.dart';
import 'ui/app.dart';
import 'ui/screens/onboarding.dart';

class EditingApp extends StatefulWidget {
  final bool isFirstRun;

  const EditingApp({super.key, required this.isFirstRun});

  @override
  State<EditingApp> createState() => _EditingAppState();
}

class _EditingAppState extends State<EditingApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '谛听笔记',
      theme: ThemeData(useMaterial3: true),
      routes: {
        "/onboard": (context) => OnboardingScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),
      },
      initialRoute: widget.isFirstRun ? "/onboard" : "/login",
    );
  }
}
