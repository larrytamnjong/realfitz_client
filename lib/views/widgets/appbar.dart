import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../resources/styles/text_styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  const MainAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: appBarTextStyle,
      ),
      bottom: bottom,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarWithAppName extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  const AppBarWithAppName({
    super.key,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.appName, style: appNameTextStyle),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
