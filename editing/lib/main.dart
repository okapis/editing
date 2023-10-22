import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<NoteList>.value(value: NoteList()),
    ],
    child: const MaterialApp(
      title: '谛听笔记',
      home: AppScaffold(),
    ),
  ));
}
