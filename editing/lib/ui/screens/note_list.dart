import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NoteListScreen extends StatelessWidget {
  final String type;
  NoteListScreen(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NoteList>(context);
    return Row(
      children: [
        Observer(
          builder: (_) => Expanded(
              child: ListView.builder(
                  itemCount: notes.list.length,
                  itemBuilder: (_, index) {
                    final note = notes.list[index];
                    return Observer(
                      builder: (_) => Center(
                        child: Text(note.title),
                      ),
                    );
                  })),
        )
      ],
    );
  }
}
