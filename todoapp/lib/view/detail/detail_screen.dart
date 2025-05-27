import 'package:flutter/material.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/base_color_theme.dart';
import 'package:todoapp/utility/button.dart';
import 'package:todoapp/utility/custom_textfield.dart';
import 'package:todoapp/view/detail/widget/edit_todo_modal_sheet.dart';
import 'package:todoapp/view/detail/widget/image_board.dart';
import 'package:todoapp/view/detail/widget/circle_button.dart';
import 'package:todoapp/view/detail/widget/todo_detail_board.dart';
import 'package:todoapp/utility/custom_appbar.dart';
import 'package:todoapp/view_model/todo_view_model.dart';

class DetailScreen extends StatefulWidget {
  final String header;
  final String title;
  final int index;

  const DetailScreen(
      {super.key,
      required this.header,
      required this.title,
      required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String _title;
  TodoViewModel _todoViewModel = TodoViewModel();

  @override
  void initState() {
    super.initState();
    _title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: widget.header, isDetail: true),
      backgroundColor: BaseColorTheme.white500,
      body: Container(
        padding: EdgeInsets.only(right: 16, left: 16),
        child: Column(
          children: [
            ScreenUtils.heightSpace(24, context),
            ImageBoard(
              imageUrl: 'assets/todoImage.png',
            ),
            ScreenUtils.heightSpace(24, context),
            TodoDetailBoard(title: _title),
            ScreenUtils.heightSpace(48, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(
                  function: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return EditTodoModalSheet(
                          initialTitle: widget.title,
                          index: widget.index,
                          onEdit: (newTitle) {
                            _todoViewModel.editTodo(
                                context, widget.index, newTitle);
                            setState(() {
                              _title = newTitle;
                            });
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 40,
                    color: BaseColorTheme.white500,
                  ),
                  color: BaseColorTheme.categoriesGreen,
                ),
                CircleButton(
                    function: () {
                      _todoViewModel.deleteTodo(context, widget.index);
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      size: 40,
                      color: BaseColorTheme.white500,
                    ),
                    color: BaseColorTheme.redColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
