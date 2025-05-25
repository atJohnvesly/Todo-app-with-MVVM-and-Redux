import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  CustomTextField({
    Key? key,
    TextEditingController? controller,
    TextStyle? style,
    String? hintText,
  }) : super(
          key: key,
          controller: controller,
          style: style,
          decoration: InputDecoration(
            hintText: hintText ?? '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
}
