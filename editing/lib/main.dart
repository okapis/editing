import 'package:editing/service/app_service.dart';
import 'package:editing/store/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppService appService = AppService();
  final hasOnboarded = await appService.hasOnboarded();
  runApp(
    MultiProvider(
      providers: [
        Provider<AppService>.value(value: appService),
        Provider<OnboardingStore>.value(value: OnboardingStore()),
      ],
      child: EditingApp(
        isFirstRun: !hasOnboarded,
      ),
    ),
  );
}
