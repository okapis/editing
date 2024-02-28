import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final void Function() onNext;

  const WelcomePage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text("About"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
