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

  late final _$HomeBaseActionController =
      ActionController(name: 'HomeBase', context: context);

  @override
  void changePage(int i) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.changePage');
    try {
      return super.changePage(i);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNoteType(NoteType t) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.changeNoteType');
    try {
      return super.changeNoteType(t);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFileType(FileType t) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.changeFileType');
    try {
      return super.changeFileType(t);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
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
