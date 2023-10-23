import 'package:flutter/material.dart';
import '../widgets/activity.dart';

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
        children: [
          Activity(),
          const Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Card(
                child: Text('15'),
              )),
              Expanded(
                  child: Card(
                child: Text('15'),
              )),
            ],
          ))
        ],
      ),
    );
  }
}
