import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/responsive_util.dart';
import 'tag.dart';

class ImageGrid extends StatelessWidget {
  final List<String> imageFiles;

  const ImageGrid({
    super.key,
    required this.imageFiles,
  });

  Widget _renderSingleImage(String file) {
    return Image.asset(
      file,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (imageFiles.length == 1) return _renderSingleImage(imageFiles[0]);
    return Text("");
  }
}
