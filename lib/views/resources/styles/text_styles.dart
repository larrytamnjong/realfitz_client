import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

const String montserrat = 'Montserrat';
const String signikaNegative = 'SignikaNegative';

const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;

TextStyle lightTextStyle = const TextStyle(
  fontSize: FontSizes.f12,
  fontFamily: montserrat,
  fontWeight: light,
);

TextStyle regularTextStyle = const TextStyle(
  fontSize: FontSizes.f12,
  fontFamily: montserrat,
  fontWeight: regular,
);

TextStyle mediumTextStyle = const TextStyle(
  fontSize: FontSizes.f12,
  fontFamily: montserrat,
  fontWeight: medium,
);

TextStyle semiBoldTextStyle = const TextStyle(
  fontWeight: semiBold,
  fontSize: FontSizes.f12,
  fontFamily: montserrat,
);

TextStyle boldTextStyle = const TextStyle(
  fontSize: FontSizes.f12,
  fontFamily: montserrat,
  fontWeight: bold,
);

TextStyle extraBoldTextStyle = const TextStyle(
  fontSize: FontSizes.f12,
  fontFamily: montserrat,
  fontWeight: extraBold,
);

TextStyle appBarTextStyle = const TextStyle(
  fontSize: FontSizes.f20,
  fontFamily: montserrat,
  fontWeight: semiBold,
);

TextStyle appNameTextStyle = const TextStyle(
  fontSize: FontSizes.f25,
  fontFamily: signikaNegative,
  fontWeight: bold,
);

TextStyle hintTextStyle =  TextStyle(
  fontSize: FontSizes.f15,
  fontFamily: montserrat,
  color: AppColors.grey,
  fontWeight: regular,
);
