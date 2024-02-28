import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:sqlite3/open.dart';
import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';

import 'ui/app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<NoteList>.value(value: NoteList()),
    ],
    child: MaterialApp(
      title: '谛听笔记',
      theme: ThemeData(useMaterial3: true),
      home: AppScaffold(),
    ),
  ));
}
