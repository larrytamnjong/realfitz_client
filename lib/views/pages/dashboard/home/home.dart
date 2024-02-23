import 'package:flutter/material.dart';

import '../../../../constants/strings.dart';
import '../../../styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName, style: appNameTextStyle),
      ),
    );
  }
}
