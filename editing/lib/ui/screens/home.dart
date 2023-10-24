import 'package:flutter/material.dart';
import '../widgets/activity.dart';
import '../widgets/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _KnowledgebaseScreenState();
}

class _KnowledgebaseScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
