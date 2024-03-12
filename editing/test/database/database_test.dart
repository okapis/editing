// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:drift/native.dart';
import 'package:editing/database/database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDb database;

  setUp(() {
    database = AppDb.from(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('should initialize app configuration when database is created',
      () async {
    // final list = await database.select(database.configuration).get();
    // expect(list.length, 3);
    // expect(list[0].name, "APP_VERSION");
    // expect(list[1].name, "SQLCIPHER_VERSION");
    // expect(list[2].name, "SEED");
    // expect(list[0].value, "0.1");
    // expect(list[1].value, '4.5.6 community');
    // expect(list[2].value, isNotEmpty);
  });

  test('should get all notes', () async {
    final list = await database.select(database.journals).get();
    expect(list.length, 0);
  });
}
