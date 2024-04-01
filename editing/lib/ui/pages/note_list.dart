import 'package:editing/service/note_service.dart';
import 'package:editing/store/note_list.dart';
import 'package:editing/ui/widgets/checklist.dart';
import 'package:editing/ui/widgets/idea.dart';
import 'package:editing/ui/widgets/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/note.dart';
import '../widgets/journal.dart';

class NoteListPage extends StatefulWidget {
  final NoteType type;

  const NoteListPage({super.key, required this.type});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteListStore>(context, listen: false).fetch(NoteType.journal);
  }

  @override
  Widget build(BuildContext context) {
    final noteListStore = Provider.of<NoteListStore>(context);

    return Row(
      children: [
        Observer(
          builder: (_) => Expanded(
            child: ListView.builder(
              itemCount: noteListStore.list.length,
              itemBuilder: (_, index) {
                final note = noteListStore.list[index];
                return NoteListItem(
                    title: note.title,
                    createTime: note.createTime,
                    location: "",
                    content: note.abstract ?? "");
              },
            ),
          ),
        ),
      ],
    );
  }
}
