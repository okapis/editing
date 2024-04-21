import 'package:editing/ui/home_screen.dart';
import 'package:editing/ui/note_edit_screen.dart';
import 'package:editing/ui/login_screen.dart';
import 'package:editing/ui/password_edit_screen.dart';
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
          case "/note/add":
          case "/note/edit":
            {
              final readonly = settings.name == "/note/detail";
              int? id = settings.arguments as int?;
              return MaterialPageRoute(
                  builder: (context) => NoteEditScreen(
                        id: id,
                        readonly: readonly,
                      ));
            }
          case "/password/detail":
          case "/password/add":
          case "/password/edit":
            {
              final readonly = settings.name == "/password/detail";
              int? id = settings.arguments as int?;
              return MaterialPageRoute(
                  builder: (context) => PasswordEditScreen(
                        id: id,
                        readonly: readonly,
                      ));
            }
          default:
            break;
        }
      },
    );
  }
}
