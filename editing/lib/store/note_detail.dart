import 'package:mobx/mobx.dart';

import '../database/database.dart';
import '../domain/note.dart';
import '../service/note_service.dart';
import 'app.dart';

part 'note_detail.g.dart';

class NoteDetailStore = NoteDetailBase with _$NoteDetailStore;

abstract class NoteDetailBase with Store {
  NoteDetailBase(this._appStore, this._noteService, this.id);

  final AppStore _appStore;
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
}
