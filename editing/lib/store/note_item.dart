import 'package:mobx/mobx.dart';

part 'note_item.g.dart';

class NoteItem = NoteBase with _$NoteItem;

abstract class NoteBase with Store {
  NoteBase(
      {this.id,
      required this.title,
      required this.content,
      this.tags,
      this.location,
      required this.createTime,
      required this.lastUpdateTime});

  @observable
  int? id;

  @observable
  String title;

  @observable
  String content;

  @observable
  List<String>? tags;

  @observable
  String? location;

  @observable
  DateTime createTime;

  @observable
  DateTime lastUpdateTime;
}
