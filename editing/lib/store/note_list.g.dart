// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteListStore on NoteListBase, Store {
  late final _$listAtom = Atom(name: 'NoteListBase.list', context: context);

  @override
  ObservableList<NoteItem> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<NoteItem> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$errorAtom = Atom(name: 'NoteListBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('NoteListBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$insertAsyncAction =
      AsyncAction('NoteListBase.insert', context: context);

  @override
  Future<void> insert() {
    return _$insertAsyncAction.run(() => super.insert());
  }

  @override
  String toString() {
    return '''
list: ${list},
error: ${error}
    ''';
  }
}
