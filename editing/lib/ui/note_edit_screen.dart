import 'dart:convert';

import 'package:editing/database/database.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kdbx/kdbx.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../domain/note.dart';
import '../service/app_service.dart';
import '../store/app.dart';
import '../store/note_detail.dart';

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
  late NoteDetailStore detailStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppStore appStore = Provider.of<AppStore>(context);
    NoteService service = Provider.of<NoteService>(context);
    detailStore = NoteDetailStore(appStore, service, widget.id);
    detailStore.fetch();
  }

  @override
  void dispose() {
    _controller.dispose();
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    super.dispose();
  }

  Widget _renderTitle() {
    return widget.viewOnly
        ? Observer(
            builder: (_) => Text(
              detailStore.item?.title ?? "",
            ),
          )
        : const Text("Create Note");
  }

  List<Widget>? _renderActions() {
    void onSave() async {
      // await .createNote(
      //     NoteType.journal, _titleController.text, _controller.document);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }

    return [
      if (!widget.viewOnly)
        IconButton(
          icon: const Icon(Icons.check_outlined),
          tooltip: 'Save',
          onPressed: onSave,
        ),
    ];
  }

  Widget _reanderEditor() {
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          if (!widget.viewOnly)
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
          if (!widget.viewOnly)
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
    );
  }

  @override
  Widget build(BuildContext context) {
    AppStore _appStore = Provider.of<AppStore>(context);
    NoteListStore _noteStore = Provider.of<NoteListStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: _renderTitle(),
        actions: _renderActions(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: _reanderEditor(),
      ),
    );
  }
}
