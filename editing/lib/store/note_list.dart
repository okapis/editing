import 'package:mobx/mobx.dart';
import './note.dart';

part 'note_list.g.dart';

class NoteList = _NoteList with _$NoteList;

abstract class _NoteList with Store {
  @observable
  ObservableList<Note> list = ObservableList();

  // @action
  // void createNote(String title, String content) {
  //   final note = Note(1, title, content);
  //   list.add(note);
  // }
}
