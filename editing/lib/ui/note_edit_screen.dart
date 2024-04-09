import 'package:editing/service/note_service.dart';
import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../store/app.dart';
import '../store/note_detail.dart';

class JournalEditScreen extends StatefulWidget {
  final int? id;
  const JournalEditScreen({super.key, this.id});

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
  void dispose() {
    _controller.dispose();
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    super.dispose();
  }

  Widget _reanderEditor() {
    return Observer(
      builder: (_) => Column(
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppStore appStore = Provider.of<AppStore>(context);
    NoteService service = Provider.of<NoteService>(context);
    detailStore = NoteDetailStore(appStore, service, widget.id);
    detailStore.fetch();

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            detailStore.item?.title ?? "",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_outlined),
            tooltip: 'Save',
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: _reanderEditor(),
      ),
    );
  }
}
