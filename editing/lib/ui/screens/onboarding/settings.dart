import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final void Function() onNext;
  final void Function() onPrevious;

  const SettingsPage(
      {super.key, required this.onNext, required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text("Settings"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: this.onPrevious,
                  child: Text("Back"),
                ),
                TextButton(
                  onPressed: this.onNext,
                  child: Text("Next"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
