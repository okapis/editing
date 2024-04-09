// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteListStore on NoteListBase, Store {
  late final _$notesAtom = Atom(name: 'NoteListBase.notes', context: context);

  @override
  ObservableMap<NoteType, ObservableList<Note>> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableMap<NoteType, ObservableList<Note>> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
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

  late final _$fetchByTypeAsyncAction =
      AsyncAction('NoteListBase.fetchByType', context: context);

  @override
  Future<void> fetchByType(NoteType type) {
    return _$fetchByTypeAsyncAction.run(() => super.fetchByType(type));
  }

  @override
  String toString() {
    return '''
notes: ${notes},
error: ${error}
    ''';
  }
}
