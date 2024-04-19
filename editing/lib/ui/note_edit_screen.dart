import 'dart:convert';

import 'package:editing/domain/note.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/store/note_edit.dart';
import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../store/app.dart';

class NoteEditScreen extends StatefulWidget {
  final int? id;
  final bool readonly;
  const NoteEditScreen({super.key, this.id, required this.readonly});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final _controller = QuillController.basic();
  final TextEditingController _titleController = TextEditingController();
  final _editorFocusNode = FocusNode();
  final _editorScrollController = ScrollController();

  late NoteEditStore _store;

  @override
  void dispose() {
    _controller.dispose();
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    AppStore appStore = Provider.of<AppStore>(context);
    NoteListStore listStore = Provider.of<NoteListStore>(context);
    NoteService service = Provider.of<NoteService>(context);
    _store = NoteEditStore(
        appStore, listStore, service, widget.id, !widget.readonly);
    _store.fetch().then((value) {
      _titleController.text = value?.title ?? "";
      _controller.document =
          Document.fromJson(jsonDecode(value?.content ?? ""));
    });
  }

  Widget _reanderEditor() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            autofocus: true,
            readOnly: !_store.isEditing,
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Note title',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        Expanded(
          child: QuillEditor.basic(
            configurations: QuillEditorConfigurations(
              controller: _controller,
              readOnly: !_store.isEditing,
            ),
          ),
        ),
        if (_store.isEditing)
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              toolbarIconAlignment: WrapAlignment.start,
              controller: _controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('en'),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            if (!_store.isEditing)
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                tooltip: 'Edit',
                onPressed: () {
                  _store.isEditing = true;
                },
              ),
            if (!_store.isEditing)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Delete',
                onPressed: () {},
              ),
            if (_store.isEditing)
              IconButton(
                icon: const Icon(Icons.cancel_outlined),
                tooltip: 'Cancel',
                onPressed: () async {
                  _store.isEditing = false;
                  if (widget.id != null) {
                    await _store.fetch();
                  } else {
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
              ),
            if (_store.isEditing)
              IconButton(
                icon: const Icon(Icons.check_outlined),
                tooltip: 'Save',
                onPressed: () async {
                  if (widget.id != null) {
                    await _store.update(
                        _titleController.text, _controller.document);
                  } else {
                    await _store.create(NoteType.journal, _titleController.text,
                        _controller.document);
                  }

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: _reanderEditor(),
        ),
      ),
    );
  }
}
