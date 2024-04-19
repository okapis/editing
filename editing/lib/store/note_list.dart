import 'package:editing/database/database.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/ui/pages/note_list.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';
import '../domain/note.dart';
import 'app.dart';

part 'note_list.g.dart';

class NoteListStore = NoteListBase with _$NoteListStore;

abstract class NoteListBase with Store {
  final AppStore _appStore;
  final NoteService _noteService;

  @observable
  ObservableMap<NoteType, ObservableList<Note>> notes = ObservableMap();

  @observable
  String? error;

  NoteListBase(this._appStore, this._noteService);

  AppDb getDb() {
    assert(_appStore.openedDb != null);
    return _appStore.openedDb!;
  }

  @action
  Future<void> fetchByType(NoteType type) async {
    final db = getDb();
    final result = await _noteService.fetchByType(db, type);
    notes.putIfAbsent(type, () => ObservableList<Note>());
    final ObservableList<Note> list = notes[type]!;
    list.clear();
    list.addAll(result);
  }

  @action
  Future<void> delete(int id) async {
    final db = getDb();
    final deleted = await _noteService.deleteNote(db, id);
    notes[deleted.type]?.removeWhere((element) => element.id == id);
  }
}
