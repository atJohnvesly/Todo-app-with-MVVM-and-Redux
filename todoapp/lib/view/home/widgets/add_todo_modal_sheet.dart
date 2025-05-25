import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/button.dart';
import 'package:todoapp/utility/custom_textfield.dart';
import 'package:todoapp/view_model/todo_view_model.dart';

class AddTodoModalSheet extends StatefulWidget {
  const AddTodoModalSheet({super.key});

  @override
  State<AddTodoModalSheet> createState() => _AddTodoModalSheetState();
}

class _AddTodoModalSheetState extends State<AddTodoModalSheet> {
  final TodoViewModel _todoViewModel = TodoViewModel();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getResponsiveHeight(
          context: context, portionHeightValue: 700),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ScreenUtils.heightSpace(30, context),
          CustomTextField(
            hintText: 'Type here...',
            controller: _controller,
          ),
          ScreenUtils.heightSpace(60, context),
          ButtonFilled(
              title: 'Add',
              function: () {
                final text = _controller.text.trim();
                if (kDebugMode) {
                  print('text --->> ${text}');
                }
                if (text.isNotEmpty) {
                  _todoViewModel.addTodo(context, 0, text);
                  Navigator.pop(context);
                }
                if (kDebugMode) {
                  print('checking');
                }
              })
        ],
      ),
    );
  }
}
