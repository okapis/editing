import 'dart:convert';

import 'package:editing/service/note_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../store/app.dart';
import '../store/note_detail.dart';

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
  late NoteDetailStore detailStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
    AppStore appStore = Provider.of<AppStore>(context);
    NoteService service = Provider.of<NoteService>(context);
    detailStore = NoteDetailStore(appStore, service, widget.id);

    updateDocument() {
      final json = jsonDecode(detailStore.item?.content ?? "");
      _controller.document = Document.fromJson(json);
    }

    detailStore.fetch().then((value) => {updateDocument()});
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            detailStore.item?.title ?? "",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit',
            onPressed: () {},
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
