import 'package:editing/service/note_service.dart';
import 'package:editing/store/note_list.dart';
import 'package:editing/ui/widgets/checklist.dart';
import 'package:editing/ui/widgets/idea.dart';
import 'package:editing/ui/widgets/list_item_wrapper.dart';
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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  Future<void> onRefresh() async {
    return Provider.of<NoteListStore>(context, listen: false)
        .fetch(NoteType.journal);
  }

  Future<void> onItemClicked(int id) async {
    Navigator.of(context).pushNamed("/note/detail", arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final noteListStore = Provider.of<NoteListStore>(context);

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: onRefresh,
      child: Row(
        children: [
          Observer(
            builder: (_) => Expanded(
              child: ListView.builder(
                itemCount: noteListStore.list.length,
                itemBuilder: (_, index) {
                  final note = noteListStore.list[index];
                  final id = note.id!;
                  return ListItemWrapper(
                      onClick: () => onItemClicked(id),
                      child: NoteListItem(
                          id: id,
                          title: note.title,
                          createTime: note.createTime,
                          location: "",
                          content: note.abstract ?? ""));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
