import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/strings.dart';
import '../resources/styles/text_styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool? isLeading;
  final bool? isCenter;
  const MainAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.actions,
    this.isLeading,
    this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(

      automaticallyImplyLeading: isLeading??true,
      title: Text(
        title,
        style: appBarTextStyle,
      ),
      bottom: bottom,
      actions: actions,
      centerTitle:true,
      leading:isLeading==false?Container(): InkWell(onTap: (){
        Get.back();
      },
      child: const Icon(Icons.arrow_back_ios_new_rounded),),
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
