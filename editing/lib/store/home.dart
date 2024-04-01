import 'package:mobx/mobx.dart';

import '../domain/note.dart';
import '../ui/pages/file_list.dart';
import '../ui/pages/note_list.dart';

part 'home.g.dart';

class HomeStore = HomeBase with _$HomeStore;

abstract class HomeBase with Store {
  HomeBase();

  @observable
  int pageIndex = 0;

  @observable
  NoteType noteType = NoteType.journal;

  @observable
  FileType fileType = FileType.photo;

  @action
  void changePage(int i) {
    pageIndex = i;
  }

  @action
  void changeNoteType(NoteType t) {
    noteType = t;
  }

  @action
  void changeFileType(FileType t) {
    fileType = t;
  }
}
