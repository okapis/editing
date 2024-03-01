// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Note on NoteBase, Store {
  late final _$idAtom = Atom(name: 'NoteBase.id', context: context);

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

  late final _$titleAtom = Atom(name: 'NoteBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$contentAtom = Atom(name: 'NoteBase.content', context: context);

  @override
  String get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$formatAtom = Atom(name: 'NoteBase.format', context: context);

  @override
  String get format {
    _$formatAtom.reportRead();
    return super.format;
  }

  @override
  set format(String value) {
    _$formatAtom.reportWrite(value, super.format, () {
      super.format = value;
    });
  }

  late final _$tagsAtom = Atom(name: 'NoteBase.tags', context: context);

  @override
  List<String> get tags {
    _$tagsAtom.reportRead();
    return super.tags;
  }

  @override
  set tags(List<String> value) {
    _$tagsAtom.reportWrite(value, super.tags, () {
      super.tags = value;
    });
  }

  late final _$locationAtom = Atom(name: 'NoteBase.location', context: context);

  @override
  String get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(String value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  late final _$createTimeAtom =
      Atom(name: 'NoteBase.createTime', context: context);

  @override
  DateTime get createTime {
    _$createTimeAtom.reportRead();
    return super.createTime;
  }

  @override
  set createTime(DateTime value) {
    _$createTimeAtom.reportWrite(value, super.createTime, () {
      super.createTime = value;
    });
  }

  late final _$lastUpdateTimeAtom =
      Atom(name: 'NoteBase.lastUpdateTime', context: context);

  @override
  DateTime get lastUpdateTime {
    _$lastUpdateTimeAtom.reportRead();
    return super.lastUpdateTime;
  }

  @override
  set lastUpdateTime(DateTime value) {
    _$lastUpdateTimeAtom.reportWrite(value, super.lastUpdateTime, () {
      super.lastUpdateTime = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
content: ${content},
format: ${format},
tags: ${tags},
location: ${location},
createTime: ${createTime},
lastUpdateTime: ${lastUpdateTime}
    ''';
  }
}
