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
  final List<String>? images;

  const Note({
    super.key,
    required this.title,
    required this.createTime,
    required this.location,
    required this.content,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    // if (ResponsiveUtils.isDesktop(context))
    //   return Text("desktop");
    // else if (ResponsiveUtils.isTablet(context)) return Text("tablet");
    // return Text("mobile");
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (images != null) ImageGrid(imageFiles: images!),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("25th Jan"),
            Text(
              "Today was a day filled with unexpected surprises and a whirlwind of emotions. As I woke up to the sound of raindrops gently tapping on my window, I couldn't help but feel a sense of tranquility and coziness. It was the perfect setting to start my day.",
            )
          ],
        ),
      ),
    );
  }
}
