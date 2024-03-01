import 'package:mobx/mobx.dart';

part 'note.g.dart';

class Note = NoteBase with _$Note;

abstract class NoteBase with Store {
  NoteBase(
    this.id,
    this.title,
    this.content,
    this.format,
    this.tags,
    this.location,
    this.createTime,
    this.lastUpdateTime,
  );

  @observable
  int? id;

  @observable
  String title;

  @observable
  String content;

  @observable
  String format;

  @observable
  List<String> tags;

  @observable
  String location;

  @observable
  DateTime createTime;

  @observable
  DateTime lastUpdateTime;
}
