import 'package:editing/database/database.dart';
import 'package:editing/service/note_service.dart';
import 'package:mobx/mobx.dart';
import 'note_item.dart';
import 'app.dart';

part 'note_list.g.dart';

class NoteListStore = NoteListBase with _$NoteListStore;

abstract class NoteListBase with Store {
  final AppStore _appStore;
  final NoteService _noteService;

  @observable
  ObservableList<NoteItem> list = ObservableList();

  @observable
  String? error;

  NoteListBase(this._appStore, this._noteService);

  AppDb getDb() {
    return _appStore.openedDb!;
  }

  @action
  Future<void> fetch() async {
    final db = getDb();
    final notes = await _noteService.fetch(db);
    list.clear();
    list.addAll(notes);
  }

  @action
  Future<void> insert() async {
    final db = getDb();
    final inserted = await _noteService.insert(db, "hello", "world");
    list.add(inserted);
  }
}
