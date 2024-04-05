import 'dart:convert';

import 'package:editing/database/database.dart';
import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kdbx/kdbx.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../domain/note.dart';
import '../service/app_service.dart';
import '../store/app.dart';

class JournalEditScreen extends StatefulWidget {
  final bool viewOnly;
  final int? id;
  const JournalEditScreen({super.key, this.id, this.viewOnly = true});

  @override
  State<JournalEditScreen> createState() => _JournalEditScreenState();
}

class _JournalEditScreenState extends State<JournalEditScreen> {
  final _controller = QuillController.basic();
  final _titleController = TextEditingController();
  final _editorFocusNode = FocusNode();
  final _editorScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppStore _appStore = Provider.of<AppStore>(context);
    NoteListStore _noteStore = Provider.of<NoteListStore>(context);

    void onSave() async {
      final data = _controller.document.toDelta().toJson();
      print(data);
      await _noteStore.createNote(
          NoteType.journal, _titleController.text, _controller.document);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_outlined),
            tooltip: 'Save',
            onPressed: onSave,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Note title',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                toolbarIconAlignment: WrapAlignment.start,
                controller: _controller,
                sharedConfigurations: const QuillSharedConfigurations(
                  locale: Locale('en'),
                ),
              ),
            ),
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: _controller,
                  readOnly: widget.viewOnly,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
