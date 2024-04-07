import 'package:editing/database/database.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/ui/pages/note_list.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';
import '../domain/note.dart';
import 'note_item.dart';
import 'app.dart';

part 'note_list.g.dart';

class NoteListStore = NoteListBase with _$NoteListStore;

abstract class NoteListBase with Store {
  final AppStore _appStore;
  final NoteService _noteService;

  @observable
  ObservableList<Note> list = ObservableList();

  @observable
  String? error;

  NoteListBase(this._appStore, this._noteService);

  AppDb getDb() {
    assert(_appStore.openedDb != null);
    return _appStore.openedDb!;
  }

  @action
  Future<void> fetch(NoteType type) async {
    final db = getDb();
    final notes = await _noteService.fetchByType(db, type);
    list.clear();
    list.addAll(notes);
  }
}
