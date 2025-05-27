import 'package:flutter/material.dart';
import 'package:todoapp/routes/app_routes.dart';
import 'package:todoapp/utility/base_color_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool isDetail;

  const CustomAppBar(
      {super.key, required this.title, this.actions, required this.isDetail});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BaseColorTheme.white500,
      title: Text(
        title,
        style: TextStyle(
          color: BaseColorTheme.blueColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: InkWell(
        onTap: () {
          if (isDetail) {
            Navigator.pushNamed(
              context,
              AppRoutes.home,
            );
          }
        },
        child: Icon(
          !isDetail ? Icons.home_filled : Icons.arrow_back_ios,
          color: BaseColorTheme.blueColor,
        ),
      ),
      actions: actions ??
          [
            IconButton(
              color: BaseColorTheme.blueColor,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              color: BaseColorTheme.blueColor,
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
