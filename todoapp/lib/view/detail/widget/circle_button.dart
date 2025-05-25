import 'package:flutter/material.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/base_color_theme.dart';

class CircleButton extends StatefulWidget {
  const CircleButton(
      {super.key,
      required this.function,
      required this.icon,
      required this.color});
  final Function function;
  final Icon icon;
  final Color color;

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
      },
      child: Container(
        width: ScreenUtils.getResponsiveHeight(
            context: context,
            portionHeightValue: 120), // same as height for circle
        height: ScreenUtils.getResponsiveHeight(
            context: context, portionHeightValue: 120),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: BaseColorTheme.white500),
          color: widget.color,
        ),
        child: widget.icon,
      ),
    );
  }
}
