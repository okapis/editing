import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;

  const Task(this.title, this.count, this.icon, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          '$count',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(title),
        trailing: Icon(this.icon),
      ),
    );
  }
}
