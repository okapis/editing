import 'package:editing/ui/home_screen.dart';
import 'package:editing/ui/note_detail_screen.dart';
import 'package:editing/ui/note_edit_screen.dart';
import 'package:editing/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'ui/pages/onboarding.dart';

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
      title: 'Curator',
      theme: ThemeData(useMaterial3: true),
      routes: {
        "/onboard": (context) => OnboardingScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),
      },
      initialRoute: widget.isFirstRun ? "/onboard" : "/login",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/note/detail":
            {
              int id = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (context) => NoteDetailScreen(id: id));
            }
          case "/note/add":
          case "/note/edit":
            {
              int? id = settings.arguments as int?;
              return MaterialPageRoute(
                  builder: (context) => NoteEditScreen(id: id));
            }
          default:
            break;
        }
      },
    );
  }
}
