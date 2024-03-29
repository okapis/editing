import 'package:editing/database/database.dart';
import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
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
  final _controller = QuillController.basic();
  final _editorFocusNode = FocusNode();
  final _editorScrollController = ScrollController();
  var _isReadOnly = false;

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
    return Scaffold(
      appBar: AppBar(
        title: Text("New Journal"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_outlined),
            tooltip: 'Save',
            onPressed: () async {
              final data = _controller.document.toDelta().toJson();
              print(data);
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
                readOnly: _isReadOnly,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
