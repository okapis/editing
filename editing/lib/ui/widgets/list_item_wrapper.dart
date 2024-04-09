import 'package:flutter/material.dart';

class ListItemWrapper extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onClick;

  const ListItemWrapper({super.key, required this.child, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Card(
          borderOnForeground: false,
          margin: const EdgeInsets.only(top: 5.0),
          child: ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 70.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
