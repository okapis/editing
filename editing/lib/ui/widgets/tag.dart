import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String name;

  const Tag(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        color: Colors.purple,
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
          child: Text(
            name,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
