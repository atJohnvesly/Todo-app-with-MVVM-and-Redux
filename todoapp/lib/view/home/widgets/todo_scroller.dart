import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/routes/app_routes.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/base_color_theme.dart';

class TodoScroller extends StatefulWidget {
  const TodoScroller({super.key, required this.todos});
  final List<Todo> todos;
  @override
  State<TodoScroller> createState() => _TodoScrollerState();
}

class _TodoScrollerState extends State<TodoScroller> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.todos[index].completed =
                            !widget.todos[index].completed;
                      });
                    },
                    child: Container(
                      height: ScreenUtils.getResponsiveHeight(
                          context: context, portionHeightValue: 40),
                      width: ScreenUtils.getResponsiveHeight(
                          context: context,
                          portionHeightValue: 40), // Make width equal to height
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Optional: Add background color
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Icon(widget.todos[index].completed
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.detail,
                        arguments: {
                          'header': 'Todo Detail Screen',
                          'title': widget.todos[index].todo,
                          'index': index,
                        },
                      );
                    },
                    child: Container(
                      height: ScreenUtils.getResponsiveHeight(
                          context: context, portionHeightValue: 60),
                      width: ScreenUtils.getResponsiveWidth(
                          context: context, portionWidthValue: 340),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black, width: 1),
                          color: !widget.todos[index].completed
                              ? Colors.white
                              : BaseColorTheme.categoriesGreen),
                      alignment:
                          Alignment.centerLeft, // Align content to the left
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12), // Optional padding
                      child: Text(
                        widget.todos[index].todo,
                        style: TextStyle(
                            color: !widget.todos[index].completed
                                ? Colors.black
                                : BaseColorTheme.white500),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
