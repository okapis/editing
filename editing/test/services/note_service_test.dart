// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:drift/native.dart';
import 'package:editing/database/database.dart';
import 'package:editing/domain/note.dart';
import 'package:editing/service/note_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_util/database_helper.dart';

void main() {
  late AppDb database;
  final service = NoteService();

  setUp(() async {
    database = AppDb.from(NativeDatabase.memory());
    await database.select(database.notes).get(); // ensure drift is initiallized

    final helper = DatabaseHelper(database);
    await helper.createCategory(1, "test1");
    await helper.createCategory(2, "test2");
    await helper.createNote(1, "hello", "hello, this is my first note");
    await helper.createNote(2, "2022/3/5", "Today is really a good day!");
    await helper.createNote(3, "New idea", "I want to create a new flutter app",
        type: NoteType.idea.value);
  });

  tearDown(() async {
    await database.close();
  });

  test('should get all notes', () async {
    final list = await service.fetchAll(database);
    expect(list.length, 3);
  });
}
