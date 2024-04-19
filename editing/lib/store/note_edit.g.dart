// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_edit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteEditStore on NoteEditBase, Store {
  late final _$isEditingAtom =
      Atom(name: 'NoteEditBase.isEditing', context: context);

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  late final _$idAtom = Atom(name: 'NoteEditBase.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$itemAtom = Atom(name: 'NoteEditBase.item', context: context);

  @override
  Note? get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(Note? value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('NoteEditBase.fetch', context: context);

  @override
  Future<Note?> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$createAsyncAction =
      AsyncAction('NoteEditBase.create', context: context);

  @override
  Future<void> create(NoteType type, String title, Document document) {
    return _$createAsyncAction.run(() => super.create(type, title, document));
  }

  late final _$updateAsyncAction =
      AsyncAction('NoteEditBase.update', context: context);

  @override
  Future<void> update(String title, Document document) {
    return _$updateAsyncAction.run(() => super.update(title, document));
  }

  late final _$deleteAsyncAction =
      AsyncAction('NoteEditBase.delete', context: context);

  @override
  Future<void> delete() {
    return _$deleteAsyncAction.run(() => super.delete());
  }

  @override
  String toString() {
    return '''
isEditing: ${isEditing},
id: ${id},
item: ${item}
    ''';
  }
}
