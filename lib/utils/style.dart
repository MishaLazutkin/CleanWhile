import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color.fromRGBO(36, 87, 198, 1);
  static const Color presentSelected = Color.fromRGBO(93, 182, 140, 1);
  static const Color presentUnSelected = Color.fromRGBO(255, 234, 132, 1);
  static const Color secondary = Color.fromRGBO(217, 217, 217, 1);
  static const Color checkBoxBorder = Color.fromRGBO(191, 191, 191, 1);
  static const Color calendarCustomBorder = backgroundPage;
  static const Color timeTableBorder = backgroundPage;
  static const Color cell = Color.fromRGBO(255, 199, 59, 1);
  static const Color tabSelectedBackgroundColor =
      Color.fromRGBO(255, 199, 59, 1);
  static const Color profileTabSelectedBackgroundColor =
      Color.fromRGBO(247, 247, 247, 1);


  static const Color containersBackgroundColor =
      Color.fromRGBO(250, 250, 250, 1);
  static Color orangeRectangleColor = const Color.fromRGBO(255, 162, 101, 1);
  static const Color textFieldFill = Color.fromRGBO(248, 248, 248, 1);
  static const Color fillErrorColor = Color.fromRGBO(255, 230, 232, 1);
  static const Color disabledButton = Color.fromRGBO(250, 250, 250, 1);
  static const Color expansionTile = Color.fromRGBO(228, 228, 228, 1);
  static const Color backgroundPage =Colors.white;// Color.fromRGBO(245, 245, 245, 1);
  static const Color backgroundBottomBar = Color.fromRGBO(255, 255, 255, 1);
  static const Color backgroundGridViewItem = Color.fromRGBO(248, 248, 248, 1);
  static const Color backgroundSection = Color.fromRGBO(248, 248, 248, 1);
  static const Color errorBorderColor = Color.fromRGBO(225, 66, 31, 1);
  static const Color errorTextColor = Color.fromRGBO(225, 66, 31, 1);
}

class AppFont {
  static const heavy = "FuturaPT-Heavy";
}

class AppDecoration {
  static Decoration container = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: AppColor.backgroundSection,
  );
}

class AppTextStyle {
  static TextStyle labelTab = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontFamily: AppFont.heavy,
      color: Colors.black);

 static TextStyle labelProfileTabs = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: AppFont.heavy,
      color: Color.fromRGBO(43, 43, 43, 1));

  static TextStyle checkBoxTitle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: AppFont.heavy,
      color: Color.fromRGBO(43, 43, 43, 1));

  static TextStyle cellText = const TextStyle(
      fontSize: 14,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w700,
      color: Colors.black);

  static TextStyle titlePrimary = const TextStyle(
      fontSize: 23,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w700,
      color: AppColor.secondary);

  static TextStyle titleSecondary = const TextStyle(
      fontSize: 20,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w700,
      color: AppColor.secondary);

  static TextStyle titleBlackBig = const TextStyle(
      fontSize: 19,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(43, 43, 43, 1));

  static TextStyle titleBlackMedium = const TextStyle(
      fontSize: 16,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(43, 43, 43, 1));

  static TextStyle titleBlackSmall = const TextStyle(
      fontSize: 13,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(43, 43, 43, 1));

  static TextStyle titleWhiteSmall = const TextStyle(
      fontSize: 13,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(255, 255, 255, 1));

  static TextStyle titleDividerRegular = const TextStyle(
      fontSize: 13,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w300,
      color: Color.fromRGBO(133, 133, 133, 1));

  static const TextStyle textFieldText = TextStyle(
      fontSize: 16,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w300,
      color: Color.fromRGBO(133, 133, 133, 1));

  static const TextStyle textFieldLabel = TextStyle(
      fontSize: 13,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(43, 43, 43, 0.94));

  static const TextStyle buttonTextStyleEnabled = TextStyle(
      fontSize: 17,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w500,
      color: Colors.white);

  static const TextStyle buttonTextStyleDisabled = TextStyle(
      fontSize: 17,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(64, 64, 64, 1));

  static const TextStyle profileLabelStyle = TextStyle(
      fontSize: 16,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w300,
      color: Color.fromRGBO(0, 0, 0, 1));

  static const TextStyle profileHintStyle = TextStyle(
      fontSize: 16,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w300,
      color: Color.fromRGBO(119, 119, 119, 1));

  static const TextStyle drawerInfoList = TextStyle(
      fontSize: 16,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(43, 43, 43, 1));


  static const TextStyle primaryTitleInfoPages = TextStyle(
      fontSize: 25,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(43, 43, 43, 1));

  static const TextStyle primarySubtitleInfoPages = TextStyle(
      fontSize: 20,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(43, 43, 43, 1));

  static const TextStyle secondaryTitleInfoPages = TextStyle(
      fontSize: 15,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(43, 43, 43, 1));

  static const TextStyle authorComment = TextStyle(
      fontSize: 18,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(43, 43, 43, 1));

  static const TextStyle comment = TextStyle(
      fontSize: 16,
      fontFamily: AppFont.heavy,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(43, 43, 43, 1));




}

class AppValues {
  static double regularCornerRadius = 4;
  static const double textFieldHeight = 40;
  static const double bottomBarHeight = 70;
  static const double headerMarginTop = 30;

}
