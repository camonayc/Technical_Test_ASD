import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const String _poppins = 'Poppins';
  static const String _roboto = 'Roboto';

  static DisplayText get display => DisplayText(typography: _poppins);
  static HeadlineText get headline => HeadlineText(typography: _roboto);
  static TitleText get title => TitleText(typography: _poppins);
  static BodyText get body => BodyText(typography: _roboto);
  static LabelText get label => LabelText(typography: _poppins);
}

class DisplayText {
  DisplayText({this.typography = 'Poppins'});

  final String typography;

  TextStyle get large => TextStyle(
      fontFamily: typography, fontSize: 32.sp, fontWeight: FontWeight.bold);

  TextStyle get medium => TextStyle(
      fontFamily: typography, fontSize: 28.sp, fontWeight: FontWeight.bold);

  TextStyle get small => TextStyle(
      fontFamily: typography, fontSize: 24.sp, fontWeight: FontWeight.bold);
}

class HeadlineText {
  HeadlineText({this.typography = 'Roboto'});

  final String typography;

  TextStyle get large => TextStyle(
      fontFamily: typography, fontSize: 22.sp, fontWeight: FontWeight.bold);

  TextStyle get medium => TextStyle(
      fontFamily: typography, fontSize: 20.sp, fontWeight: FontWeight.w600);

  TextStyle get small => TextStyle(
      fontFamily: typography, fontSize: 18.sp, fontWeight: FontWeight.w600);
}

class BodyText {
  BodyText({this.typography = 'Roboto'});

  final String typography;

  TextStyle get large => TextStyle(
      fontFamily: typography, fontSize: 16.sp, fontWeight: FontWeight.normal);

  TextStyle get medium => TextStyle(
      fontFamily: typography, fontSize: 14.sp, fontWeight: FontWeight.normal);

  TextStyle get small => TextStyle(
      fontFamily: typography, fontSize: 12.sp, fontWeight: FontWeight.normal);
}

class TitleText {
  TitleText({this.typography = 'Poppins'});

  final String typography;

  TextStyle get large => TextStyle(
      fontFamily: typography, fontSize: 16.sp, fontWeight: FontWeight.w500);

  TextStyle get medium => TextStyle(
      fontFamily: typography, fontSize: 14.sp, fontWeight: FontWeight.w500);

  TextStyle get small => TextStyle(
      fontFamily: typography, fontSize: 12.sp, fontWeight: FontWeight.w500);
}

class LabelText {
  LabelText({this.typography = 'Poppins'});

  final String typography;

  TextStyle get large => TextStyle(
      fontFamily: typography, fontSize: 14.sp, fontWeight: FontWeight.w600);

  TextStyle get medium => TextStyle(
      fontFamily: typography, fontSize: 12.sp, fontWeight: FontWeight.w600);

  TextStyle get small => TextStyle(
      fontFamily: typography, fontSize: 10.sp, fontWeight: FontWeight.w600);
}
