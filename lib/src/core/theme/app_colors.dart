import 'package:flutter/material.dart';

class AppColors {
  static const Color mistBlue = Color(0xFFCED6E3);
  static const Color steelBlue = Color(0xFF8094B3);
  static const Color blueberryBlue = Color(0xFF4F6D9C);
  static const Color midnightBlue = Color(0xFF1D2B43);
  static const Color carbonBlue = Color(0xFF161D2B);

  static List<BoxShadow> shadows = [
    BoxShadow(
      color: Color.fromRGBO(Colors.grey.r.toInt(), Colors.grey.g.toInt(),
          Colors.grey.b.toInt(), 0.5),
      spreadRadius: 5,
      blurRadius: 5,
      offset: Offset.zero,
    ),
  ];
}
