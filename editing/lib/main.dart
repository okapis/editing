import 'package:editing/service/app_service.dart';
import 'package:editing/service/kdbx_service.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/store/app.dart';
import 'package:editing/store/note_list.dart';
import 'package:editing/store/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final KdbxService kdbxService = KdbxService();
  final AppService appService = AppService(kdbxService);
  final hasOnboarded = await appService.hasOnboarded();
  runApp(
    MultiProvider(
      providers: [
        Provider<KdbxService>.value(value: kdbxService),
        Provider<AppService>.value(value: appService),
        Provider<NoteService>.value(value: NoteService()),
        Provider<OnboardingStore>.value(value: OnboardingStore()),
        Provider<AppStore>.value(value: AppStore()),
        ProxyProvider2<AppStore, NoteService, NoteListStore>(
            update: (_, appStore, noteService, previous) =>
                NoteListStore(appStore, noteService)),
      ],
      child: EditingApp(
        isFirstRun: !hasOnboarded,
      ),
    ),
  );
}
