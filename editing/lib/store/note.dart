import 'package:mobx/mobx.dart';

part 'note.g.dart';

class Note = _Note with _$Note;

abstract class _Note with Store {
  _Note(
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
