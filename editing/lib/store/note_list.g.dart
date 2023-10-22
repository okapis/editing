// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteList on _NoteList, Store {
  late final _$listAtom = Atom(name: '_NoteList.list', context: context);

  @override
  ObservableList<Note> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Note> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_NoteListActionController =
      ActionController(name: '_NoteList', context: context);

  @override
  void addNote(String title, String content) {
    final _$actionInfo =
        _$_NoteListActionController.startAction(name: '_NoteList.addNote');
    try {
      return super.addNote(title, content);
    } finally {
      _$_NoteListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
