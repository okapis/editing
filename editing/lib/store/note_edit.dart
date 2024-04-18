import 'package:editing/store/note_list.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';

import '../database/database.dart';
import '../domain/note.dart';
import '../service/note_service.dart';
import 'app.dart';

part 'note_edit.g.dart';

class NoteEditStore = NoteEditBase with _$NoteEditStore;

abstract class NoteEditBase with Store {
  NoteEditBase(this._appStore, this._noteListStore, this._noteService, this.id);

  final AppStore _appStore;
  final NoteListStore _noteListStore;
  final NoteService _noteService;

  @observable
  bool isEditing = false;

  @observable
  int? id;

  @observable
  Note? item;

  AppDb getDb() {
    assert(_appStore.openedDb != null);
    return _appStore.openedDb!;
  }

  @action
  Future<Note?> fetch() async {
    if (id == null) return null;
    final db = getDb();
    final detail = await _noteService.fetchById(db, id!);
    item = detail;
    return detail;
  }

  @action
  Future<void> create(NoteType type, String title, Document document) async {
    final db = getDb();
    item = await _noteService.createQuillNote(db, title, document, type);
    await _noteListStore.fetchByType(type);
  }

  @action
  Future<void> update(String title, Document document) async {
    assert(id != null);
    assert(item != null);

    final db = getDb();
    item = await _noteService.updateNote(db, id!, title, document);
    await _noteListStore.fetchByType(item!.type);
  }
}
