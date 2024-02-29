import 'package:flutter/material.dart';

class ChallengeDetailPageBottomInformation extends StatelessWidget {
  final String text;
  const ChallengeDetailPageBottomInformation({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
    );
  }
}
