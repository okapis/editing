import 'package:editing/ui/widgets/image_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/responsive_util.dart';
import 'tag.dart';

class Note extends StatelessWidget {
  final String title;
  final DateTime createTime;
  final String location;
  final String content;

  const Note({
    super.key,
    required this.title,
    required this.createTime,
    required this.location,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    // if (ResponsiveUtils.isDesktop(context))
    //   return Text("desktop");
    // else if (ResponsiveUtils.isTablet(context)) return Text("tablet");
    // return Text("mobile");
    return Column(
      children: [
        ImageGrid(imageFiles: ["assets/1.jpeg"]),
        Text(title),
      ],
    );
  }
}
