import 'package:mobx/mobx.dart';

part 'note.g.dart';

class Note = _Note with _$Note;

abstract class _Note with Store {
  _Note(this.title, this.content);

  @observable
  String title;

  @observable
  String content;
}
