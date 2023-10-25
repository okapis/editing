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
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                content,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            const Row(
              children: [
                Tag("旅行"),
                Tag("杂记"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  location,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                Text(
                  '${createTime.year}-${createTime.month}-${createTime.day}',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
