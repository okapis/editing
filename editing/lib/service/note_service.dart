import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:editing/database/database.dart';
import 'package:editing/domain/common.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../domain/note.dart';
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

  Future<List<Note>> fetchByType(AppDb db, NoteType type) async {
    final items = await db.fetchNotesByType(type.value).get();
    final categories = await db.categories.select().get();
    return items
        .map(
          (item) => Note.fromEntity(
            item,
            item.categoryId == null
                ? null
                : categories.firstWhere((e) => e.id == item.categoryId),
          ),
        )
        .toList();
  }

  Future<Note> insertNote(AppDb db, Note item) async {
    assert(item.id == null);
    final id = await db.into(db.notes).insert(item.toCompanion());
    item.id = id;
    return item;
  }

  Future<Note> createQuillNote(
      AppDb db, String title, Document document, NoteType type) async {
    final content = jsonEncode(document.toDelta().toJson());
    final abstract = document.toPlainText().substring(0, 100);
    return createNote(db, title, content, abstract, type);
  }

  Future<Note> createNote(AppDb db, String title, String content,
      String? abstract, NoteType type) async {
    final now = DateTime.now();
    final item = Note(
      type: type,
      format: NoteFormat.quill,
      title: title,
      content: content,
      abstract: abstract,
      encryptType: EncryptType.none,
      createTime: now,
      lastUpdateTime: now,
    );
    return insertNote(db, item);
  }
}
