import 'package:editing/store/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../widgets/journal.dart';

class NoteListScreen extends StatelessWidget {
  final String type;
  NoteListScreen(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NoteList>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Observer(
            builder: (_) => Expanded(
              child: ListView.builder(
                itemCount: notes.list.length,
                itemBuilder: (_, index) {
                  final note = notes.list[index];
                  return Observer(
                    builder: (_) => Journal(
                      title: '2023/9/19',
                      createTime: DateTime.now(),
                      weather: 'Sunny',
                      mood: 'Happy',
                      location: 'Wuhan, Hubei',
                      content: '新开这本日记，也为了督促自己下个学期多下些苦功。先要读完手边的莎士比亚的《亨利八世》。',
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
