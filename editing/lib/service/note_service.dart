import 'package:drift/drift.dart';
import 'package:editing/database/database.dart';

import '../store/note_item.dart';

class NoteService {
  NoteItem convertToViewModel(NoteEntity x) {
    return NoteItem(
      id: x.id,
      title: x.title,
      content: x.content,
      tags: x.tags?.split(","),
      location: x.location,
      createTime: DateTime.parse(x.createTime),
      lastUpdateTime: DateTime.parse(x.lastUpdateTime),
    );
  }

  NotesCompanion convertToDbModel(NoteItem x) {
    return NotesCompanion(
      format: const Value(1),
      title: Value(x.title),
      content: Value(x.content),
      tags: Value(x.tags?.join(",")),
      location: Value(x.location),
      createTime: Value(x.createTime.toIso8601String()),
      lastUpdateTime: Value(x.lastUpdateTime.toIso8601String()),
    );
  }

  Future<List<NoteItem>> fetch(AppDb db) async {
    final items = await db.notes.select().get();
    return items.map(convertToViewModel).toList();
  }

  Future<NoteItem> insert(AppDb db, String title, String content) async {
    final now = DateTime.now().toIso8601String();
    final id = await db.into(db.notes).insert(NotesCompanion(
          title: Value(title),
          content: Value(content),
          format: Value(1),
          createTime: Value(now),
          lastUpdateTime: Value(now),
        ));
    final inserted = await (db.select(db.notes)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();

    return convertToViewModel(inserted);
  }
}
