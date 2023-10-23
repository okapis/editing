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
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
            controller: controller,
            leading: const Icon(Icons.search_outlined),
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            trailing: <Widget>[
              Tooltip(
                message: 'Change brightness mode',
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic_outlined),
                  selectedIcon: const Icon(Icons.mic_sharp),
                ),
              )
            ]);
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
