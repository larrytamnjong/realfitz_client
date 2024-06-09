import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xFFF7941D);
  static Color palePrimary = const Color(0xFFFFEFDC);
  static Color grey = const Color(0xFFBDBDBD);
  static Color white = const Color(0xFFFFFFFF);
  static Color brightBlue = const Color(0xFF2196F3);
  static Color green = const Color(0xFF2AB13F);
  static Color red = const Color(0xFFF70000);
  static Color lightGreen = const Color(0xFFA5D6A7);
  static Color black = const Color(0xFF000000);
  static Color paleTeal = const Color(0xFFE0F2F1);
  static Color brightTeal = const Color(0xFF26A69A);
  static Color palePink = const Color(0xFFF8BBD0);
  static Color paleLime = const Color(0xFFF9FBE7);
  static Color purple = const Color(0xFF7B1FA2);
  static Color yellow = const Color(0xFFFFEB3B);
  static Color indigo = const Color(0xFF7986CB);
  static Color pink = const Color(0xFFF06292);
  static Color blue = const Color(0xFF1E88E5);
  static Color lightOrange = const Color(0xFFEFBC9B);
  static Color lightCream = const Color(0xFFFBF3D5);
  static Color lightGrass= const Color(0xFFD6DAC8);
  static Color darkGrass = const Color(0xFF9CAFAA);
  static Color darkWhite = const Color(0xFFDFE0FA);

  static Color getRandomColor() {
    List<Color> colors = [
       Color(0xFFEFBC9B),
       Color(0xFFFBF3D5),
       Color(0xFFD6DAC8),
       Color(0xFF9CAFAA)
    ];
    final Random random = Random();
    return colors[random.nextInt(colors.length)];
  }
}
