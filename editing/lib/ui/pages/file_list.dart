import 'package:editing/domain/note.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/store/note_list.dart';
import 'package:editing/ui/widgets/checklist.dart';
import 'package:editing/ui/widgets/idea.dart';
import 'package:editing/ui/widgets/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../widgets/journal.dart';

enum FileType { photo, video, document, other }

class FileListPage extends StatefulWidget {
  final FileType type;

  const FileListPage({super.key, required this.type});

  @override
  State<FileListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<FileListPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<NoteListStore>(context, listen: false).fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    final noteListStore = Provider.of<NoteListStore>(context);

    return Row(
      children: [
        Observer(
          builder: (_) => Placeholder(),
        ),
      ],
    );
  }
}
