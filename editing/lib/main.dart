import 'dart:io';

import 'package:editing/service/app_service.dart';
import 'package:editing/service/kdbx_service.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/service/password_service.dart';
import 'package:editing/store/app.dart';
import 'package:editing/store/note_list.dart';
import 'package:editing/store/onboarding.dart';
import 'package:editing/store/password_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'store/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    await windowManager.setTitle("Curator");
    await windowManager.setMinimumSize(Size(400, 600));
    await windowManager.setMaximumSize(Size(600, 800));
  }
  final KdbxService kdbxService = KdbxService();
  final AppService appService = AppService(kdbxService);
  final hasOnboarded = await appService.hasOnboarded();
  runApp(
    MultiProvider(
      providers: [
        Provider<KdbxService>.value(value: kdbxService),
        Provider<AppService>.value(value: appService),
        Provider<NoteService>.value(value: NoteService()),
        Provider<PasswordService>.value(value: PasswordService()),
        Provider<OnboardingStore>.value(value: OnboardingStore()),
        Provider<AppStore>.value(value: AppStore()),
        Provider<HomeStore>.value(value: HomeStore()),
        ProxyProvider2<AppStore, NoteService, NoteListStore>(
            update: (_, appStore, noteService, previous) =>
                NoteListStore(appStore, noteService)),
        ProxyProvider2<AppStore, PasswordService, PasswordListStore>(
            update: (_, appStore, passwordService, previous) =>
                PasswordListStore(appStore, passwordService)),
      ],
      child: EditingApp(
        isFirstRun: !hasOnboarded,
      ),
    ),
  );
}
