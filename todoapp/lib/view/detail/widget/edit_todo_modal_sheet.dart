import 'package:flutter/material.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/button.dart';
import 'package:todoapp/utility/custom_textfield.dart';

class EditTodoModalSheet extends StatefulWidget {
  final String initialTitle;
  final int index;
  final Function(String newTitle) onEdit;

  const EditTodoModalSheet({
    super.key,
    required this.initialTitle,
    required this.index,
    required this.onEdit,
  });

  @override
  State<EditTodoModalSheet> createState() => _EditTodoModalSheetState();
}

class _EditTodoModalSheetState extends State<EditTodoModalSheet> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialTitle);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            controller: _controller,
          ),
          ScreenUtils.heightSpace(60, context),
          ButtonFilled(
            title: 'Edit',
            function: () {
              widget.onEdit(_controller.text);
              setState(() {});
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
