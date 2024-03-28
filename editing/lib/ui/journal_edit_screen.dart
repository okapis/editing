import 'package:editing/database/database.dart';
import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kdbx/kdbx.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../service/app_service.dart';
import '../store/app.dart';

class JournalEditScreen extends StatefulWidget {
  const JournalEditScreen({super.key});

  @override
  State<JournalEditScreen> createState() => _JournalEditScreenState();
}

class _JournalEditScreenState extends State<JournalEditScreen> {
  @override
  Widget build(BuildContext context) {
    AppStore _appStore = Provider.of<AppStore>(context);
    NoteListStore _noteStore = Provider.of<NoteListStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("New Journal"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_outlined),
            tooltip: 'Save',
            onPressed: () async {
              await _noteStore.insert();
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                expands: true,
                autofocus: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                maxLength: 1024,
                decoration: InputDecoration.collapsed(hintText: '在这里输入文字'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
