import 'package:flutter/material.dart';

import '../widgets/activity.dart';
import '../widgets/task.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

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
            child: Text('Tasks'),
          ),
          const Row(
            children: [
              Expanded(
                child: Task('Today', 3, Icons.alarm_outlined),
              ),
              Expanded(
                child: Task('Scheduled', 15, Icons.calendar_month_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
