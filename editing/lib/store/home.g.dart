// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeBase, Store {
  late final _$pageIndexAtom =
      Atom(name: 'HomeBase.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$noteTypeAtom = Atom(name: 'HomeBase.noteType', context: context);

  @override
  NoteType get noteType {
    _$noteTypeAtom.reportRead();
    return super.noteType;
  }

  @override
  set noteType(NoteType value) {
    _$noteTypeAtom.reportWrite(value, super.noteType, () {
      super.noteType = value;
    });
  }

  late final _$fileTypeAtom = Atom(name: 'HomeBase.fileType', context: context);

  @override
  FileType get fileType {
    _$fileTypeAtom.reportRead();
    return super.fileType;
  }

  @override
  set fileType(FileType value) {
    _$fileTypeAtom.reportWrite(value, super.fileType, () {
      super.fileType = value;
    });
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
noteType: ${noteType},
fileType: ${fileType}
    ''';
  }
}
