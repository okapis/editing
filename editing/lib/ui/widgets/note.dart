import 'package:flutter/material.dart';

import 'tag.dart';

class Note extends StatelessWidget {
  final String title;
  final DateTime createTime;
  final String location;
  final String content;

  const Note({
    super.key,
    required this.title,
    required this.createTime,
    required this.location,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.cloudy_snowing),
      title: Text(
        content,
      ),
      subtitle: Text("今天天气十分好"),
    );
  }
}
