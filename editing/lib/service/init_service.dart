import 'dart:convert';
import 'dart:io';

import 'package:convert/convert.dart';
import 'package:flutter/services.dart';
import '../common/protected_value.dart';

class InitializeService {
  InitializeService();

  Future<void> initialize(
    final ProtectedValue masterPassword,
    final ProtectedValue secondaryPassword,
    bool enableFingerPrint,
  ) async {}

  Future<void> _saveConfig(
    final String configData,
    final String masterHash,
    final String secondaryHash,
  ) async {}

  Future<void> _initializeDatabase(
      final String dbPath, final ProtectedValue sqlcipherKey) async {}
}
