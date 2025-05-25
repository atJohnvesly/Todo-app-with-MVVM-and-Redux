import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/utility/app_size.dart';
import 'package:todoapp/utility/base_color_theme.dart';

class ButtonFilled extends StatelessWidget {
  final String title;
  final Function function;
  const ButtonFilled({super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScreenUtils.widthSpace(43, context),
        Expanded(
            child: GestureDetector(
          onTap: () {
            function();
          },
          child: Container(
            height: ScreenUtils.getResponsiveHeight(
                context: context, portionHeightValue: 60),
            width: ScreenUtils.getResponsiveWidth(
                context: context, portionWidthValue: 85),
            decoration: const BoxDecoration(
                color: BaseColorTheme.themeColor,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(
                child: Text(
              title,
              style: GoogleFonts.urbanist(
                  color: BaseColorTheme.black600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ),
        )),
        ScreenUtils.widthSpace(43, context),
      ],
    );
  }
}
