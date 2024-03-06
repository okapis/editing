import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import '../../database/database.dart';
import '../widgets/activity.dart';
import '../widgets/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _KnowledgebaseScreenState();
}

class _KnowledgebaseScreenState extends State<HomeScreen> {
  final _database = AppDb();

  @override
  Widget build(BuildContext context) {
    final count = _database.journals.count().getSingle();
    count.then((c) => print(c));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Activity(),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text('待办事项'),
            ),
            const Row(
              children: [
                Expanded(
                  child: Task('今天', 3, Icons.alarm_outlined),
                ),
                Expanded(
                  child: Task('计划中', 15, Icons.calendar_month_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
