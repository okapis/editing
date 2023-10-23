import 'package:flutter/material.dart';

class KnowledgebaseScreen extends StatefulWidget {
  const KnowledgebaseScreen({super.key});

  @override
  State<KnowledgebaseScreen> createState() => _KnowledgebaseScreenState();
}

class _KnowledgebaseScreenState extends State<KnowledgebaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Notes'),
    );
  }
}
