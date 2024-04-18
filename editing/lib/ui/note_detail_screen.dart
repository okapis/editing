import 'dart:convert';

import 'package:editing/service/note_service.dart';
import 'package:editing/store/note_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../store/app.dart';
import '../store/note_list.dart';

class NoteDetailScreen extends StatefulWidget {
  final int id;
  const NoteDetailScreen({super.key, required this.id});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final _controller = QuillController.basic();
  final _titleController = TextEditingController();
  final _editorFocusNode = FocusNode();
  final _editorScrollController = ScrollController();

  late NoteEditStore _store;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    AppStore appStore = Provider.of<AppStore>(context);
    NoteListStore listStore = Provider.of<NoteListStore>(context);
    NoteService service = Provider.of<NoteService>(context);
    _store = NoteEditStore(appStore, listStore, service, widget.id);
    _store.fetch().then((value) {
      _titleController.text = value?.title ?? "";
      _controller.document =
          Document.fromJson(jsonDecode(value?.content ?? ""));
    });
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
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            _store.item?.title ?? "",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit',
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("/note/edit", arguments: _store.item?.id);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Observer(
          builder: (_) => QuillEditor.basic(
            configurations: QuillEditorConfigurations(
              controller: _controller,
              readOnly: true,
            ),
          ),
        ),
      ),
    );
  }
}
