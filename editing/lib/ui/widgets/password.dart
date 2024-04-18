import 'package:editing/ui/widgets/image_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/responsive_util.dart';
import 'tag.dart';

class PasswordListItem extends StatelessWidget {
  final int id;
  final String title;
  final DateTime createTime;
  final String? remark;

  const PasswordListItem({
    super.key,
    required this.id,
    required this.title,
    required this.createTime,
    this.remark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black87),
        )
      ],
    );
  }
}
