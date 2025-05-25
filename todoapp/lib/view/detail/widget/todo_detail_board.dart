import 'package:flutter/material.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/base_color_theme.dart';

class TodoDetailBoard extends StatefulWidget {
  const TodoDetailBoard({super.key, required this.title});
  final String title;

  @override
  State<TodoDetailBoard> createState() => _TodoDetailBoardState();
}

class _TodoDetailBoardState extends State<TodoDetailBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: BaseColorTheme.white500),
          color: BaseColorTheme.blueColor),
      height: ScreenUtils.getResponsiveHeight(
          context: context, portionHeightValue: 200),
      alignment: Alignment.center,
      child: Text(
        widget.title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
