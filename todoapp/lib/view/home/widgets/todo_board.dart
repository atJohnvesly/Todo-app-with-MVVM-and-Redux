import 'package:flutter/material.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/base_color_theme.dart';

class TodoBoard extends StatefulWidget {
  const TodoBoard({super.key, required this.firstTodoTitle});
  final String firstTodoTitle;

  @override
  State<TodoBoard> createState() => _TodoBoardState();
}

class _TodoBoardState extends State<TodoBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getResponsiveHeight(
          context: context, portionHeightValue: 200),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: BaseColorTheme.white500, width: 1),
          color: BaseColorTheme.themeColor),
      child: Center(
          child: Text(
        widget.firstTodoTitle,
        style: TextStyle(
            color: BaseColorTheme.black600,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      )),
    );
  }
}
