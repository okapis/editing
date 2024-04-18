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
  int? id;

  @observable
  Note? item;

  AppDb getDb() {
    assert(_appStore.openedDb != null);
    return _appStore.openedDb!;
  }

  @action
  Future<void> fetch() async {
    if (id == null) return;
    final db = getDb();
    item = await _noteService.fetchById(db, id!);
  }

  @action
  Future<void> createNote(
      NoteType type, String title, Document document) async {
    final db = getDb();
    await _noteService.createQuillNote(db, title, document, type);
    await _noteListStore.fetchByType(type);
  }
}
