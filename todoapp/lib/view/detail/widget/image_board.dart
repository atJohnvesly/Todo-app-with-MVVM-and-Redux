import 'package:flutter/material.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/base_color_theme.dart';

class ImageBoard extends StatefulWidget {
  const ImageBoard({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<ImageBoard> createState() => _ImageBoardState();
}

class _ImageBoardState extends State<ImageBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: BaseColorTheme.white500),
          color: BaseColorTheme.yellowColor),
      height: ScreenUtils.getResponsiveHeight(
          context: context, portionHeightValue: 400),
      child: Image.asset(
        widget.imageUrl,
        fit: BoxFit.cover,
      ),
    );
    ;
  }
}
