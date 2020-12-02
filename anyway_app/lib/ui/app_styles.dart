import 'package:flutter/material.dart';

class AnywayColors {
  static const white = Color(0xffffffff);
  static const lightBlue = Color(0xff42AAFF);
  static const blackish = Color(0xff464a47);
  static const lightGreyBackground = Color(0xfff2f2f2);
}

const TextStyle smallBoldLightBlue = TextStyle(
  color: AnywayColors.lightBlue,
  fontSize: 17,
  fontWeight: FontWeight.w700,
);

const TextStyle darkBoldTitle = TextStyle(
    color: AnywayColors.blackish, fontSize: 20, fontWeight: FontWeight.w700);

BoxDecoration whiteRoundedContainerWithShadow = BoxDecoration(
    color: AnywayColors.white,
    border: Border.all(width: 1, color: AnywayColors.white),
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: AnywayColors.lightGreyBackground.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 3,
        offset: const Offset(0, -2),
      )
    ]);
