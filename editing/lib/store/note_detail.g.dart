// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_detail.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteDetailStore on NoteDetailBase, Store {
  late final _$idAtom = Atom(name: 'NoteDetailBase.id', context: context);

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

  late final _$itemAtom = Atom(name: 'NoteDetailBase.item', context: context);

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
      AsyncAction('NoteDetailBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
id: ${id},
item: ${item}
    ''';
  }
}
