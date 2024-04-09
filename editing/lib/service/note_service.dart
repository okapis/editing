import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:editing/database/database.dart';
import 'package:editing/domain/common.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../domain/note.dart';

class NoteService {
  Future<List<Note>> fetchAll(AppDb db) async {
    final items = await db.fetchNoteBasics().get();
    final categories = await db.categories.select().get();
    return items
        .map(
          (item) => Note.fromEntity(
            NoteEntity(
                id: item.id,
                type: item.type,
                format: item.format,
                title: item.title,
                content: "",
                abstract: item.abstract,
                encryptType: item.encryptType,
                createTime: item.createTime,
                lastUpdateTime: item.lastUpdateTime),
            item.categoryId == null
                ? null
                : categories.firstWhere((e) => e.id == item.categoryId),
          ),
        )
        .toList();
  }

  Future<List<Note>> fetchByType(AppDb db, NoteType type) async {
    final items = await db.fetchNoteBasicsByType(type.value).get();
    final categories = await db.categories.select().get();
    return items
        .map(
          (item) => Note.fromEntity(
            NoteEntity(
                id: item.id,
                type: item.type,
                format: item.format,
                title: item.title,
                content: "",
                abstract: item.abstract,
                encryptType: item.encryptType,
                createTime: item.createTime,
                lastUpdateTime: item.lastUpdateTime),
            item.categoryId == null
                ? null
                : categories.firstWhere((e) => e.id == item.categoryId),
          ),
        )
        .toList();
  }

  Future<Note> fetchById(AppDb db, int id) async {
    final item = await (db.notes.select()..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    CategoryEntity? category;
    if (item.categoryId != null) {
      category = await (db.categories.select()
            ..where((tbl) => tbl.id.equals(item.categoryId!)))
          .getSingle();
    }
    return Note.fromEntity(item, category);
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
