// coverage:ignore-file
import 'package:flutter/material.dart';

/// A list of custom color used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class ColorValues {
  /// Colors
  static Color primaryColor = Color(primaryColorHex);
  static Color secondaryColor = Color(secondaryColorHex);
  static Color scaffoldBackgroundColor = Color(scaffoldBackgroundColorHex);
  static const Color blackColor = Color(blackColorHex);
  static const Color whiteColor = Color(whiteColorHex);
  static const Color greenColor = Color(greenColorHex);
  static const Color redColor = Color(redColorHex);
  static const Color redColorDark = Color(redColorDarkHex);
  static const Color orangeColor = Color(orangeColorHex);
  static const Color blueColor = Color(blueColorHex);
  static const Color navyBlueColor = Color.fromARGB(255, 7, 63, 115);
  static const Color skyBlueColor = Color(skyBlueColorHex);
  static const Color greyColor = Color(greyColorHex);
  static const Color greyDividerColor = Color(lightGreyDividerColorHex);
  static const Color lightGreyTextColor = Color(lightGreyTextColorHex);
  static const Color transparent = Colors.transparent;
  static const Color greenlightColor = Color.fromARGB(255, 86, 234, 72);
  static const Color approveColor = appGreenColor;
  static const Color rejectColor = appRedColor;
  static const Color completeColor = appRedColor;
  static const Color startColor = appYellowColor;
  static const Color viewColor = appDarkBlueColor;
  static const Color editColor = appYellowColor;
  static const Color deleteColor = appRedColor;
  static const Color addNewColor = appGreenColor;
  static const Color submitColor = appGreenColor;
  static const Color closeColor = appRedColor;
  static const Color cancelColor = appRedColor;
  static const Color printColor = appDarkBlueColor;
  static const Color updateColor = appDarkBlueColor;
  static const Color tabActionColor = apptabColor;
  static const Color linktopermitColor = appDarkBlueColor;
  static const Color pendingColor = appYellowColor;
  static const Color issueColor = appDarkBlueColor;
  static const Color executeColor = appGreenColor;
  static const Color pendingStatusColor = appYellowColor;
  static const Color approveStatusColor = appGreenColor;
  static const Color rejectedStatusColor = appRedColor;
  static const Color waitingForApproveStatusColor = appGreenColor;
  static const Color assignStatusColor = appRedColor;
  static const Color createdStatusColor = appGreenColor;
  static const Color linktopermitStatusColor = appDarkBlueColor;
  static const Color submitStatusColor = appGreenColor;
  static const Color issueStatusColor = appDarkBlueColor;

//,export,in progress

  // ============================================

  /// Non-common Colors
  ///
  static const Color facebookButtonColor = Color(facebookButtonColorHex);
  static const Color iconColor = Color(iconColorHex);
  static const Color greyLightColor = Color(greyLightColorHex);
  static const Color purpleColor = Color(purpleColorHex);
  static const Color lightGreyColorWithOpacity35 =
      Color(lightGreyColorWithOpacityHex35);
  static const Color lightGreyColor = Color(lightGreyColorHex);
  static const Color heavyGreyColor = Color(heavyGreyColorHex);
  static const Color lightGreyColorWithOpacity50 =
      Color(lightGreyColorWithOpacityHex50);
  static const Color lightRedColor = Color(lightRedColorHex);
  static const Color blackColorWithOpacity59 =
      Color(blackColorHexWithOpacity59);
  static const Color primaryColorWithOpacity =
      Color(primaryColorHexWithOpacity);
  static const Color textFieldColor = Color(textFieldColorHex);
  static const Color subTitleColor = Color(subTitlecolorHex);
  static const Color originalGreyColor = Color(originalGreyColorHex);
  static const Color textfieldHintColor = Color(textfieldHintColorHex);
  static const Color bottomNavBgColor = Color(bottomNavBgColorHex);
  static const Color blueMediumColor = Color(blueMediumColorHex);
  static const Color blueDarkColor = Color(darkBlueColorHex);
  static const Color lightBlueColor = Color(lightBlueColorHex);
  static const Color lightBlueishColor = Color(lightBlueishColorHex);
  static const Color lightGreenColor = Color(lightGreenColorHex);
  static const Color yellowColor = Color(yellowColorHex);
  static const Color greyLightColour = Color(greyLightColourHex);
  static const Color loginPlaceholderFontColor =
      Color(loginPlaceholderFontColorHex);
  static const Color pinkColor = Color(pinkColorHex);
  static const Color greyBorderColor = Color(greyBorderColorHex);
  static const Color shadowColor = Color(shadowColorHex);
  static const Color checkBoxColor = Color(checkBoxColorHex);

  ///
  // APP COLORS ============================================================================
  static const Color appDarkBlueColor = Color(appDarkBlueColorHex);
  static const Color appLightBlueColor = Color(appLightBlueColorHex);
  static const Color appRedColor = Color(appRedColorHex);
  static const Color appYellowColor = Color(appYellowColorHex);
  static const Color appGreenColor = Color(appGreenColorHex);
  static const Color appLightGreyColor = Color(appLightGreyColorHex);
  static const Color appPurpleColor = Color(appPurpleColorHex);
  static const Color apptabColor = Color(appTabsColorHex);

  static Color appBackgroundColor = appLightBlueColor.withOpacity(0.1);
  static const Color appDarkGreyColor = Color(appDarkGreyColorHex);
  static Color appBlueBackgroundColor = Colors.blue.shade50;

  // ===========================================================================

  /// Hex Values
  ///
  static int primaryColorHex = 0xffF09C38;
  static int secondaryColorHex = 0xffB000F0;
  static int scaffoldBackgroundColorHex = 0xffffffff;
  static const int blackColorHex = 0xff000000;
  static const int whiteColorHex = 0xffffffff;
  static const int greenColorHex = 0xff009944;
  static const int redColorHex = 0xffcf000f;
  static const int orangeColorHex = 0xfff0541e;
  static const int blueColorHex = 0xff2196f3;
  static const int navyBlueColorHex = 0xff073763;
  static const int darkBlueColorHex = 0xff1B53F4;
  static const int skyBlueColorHex = 0xff63c0df;
  static const int greyColorHex = 0xff363636;
  static const int blueMediumColorHex = 0xffd9e5f6;
  static const int lightBlueColorHex = 0xffd1ddfd;
  static const int lightGreenColorHex = 0xff6fdf2e;
  static const int yellowColorHex = 0xfffedf5c;

  // ============================================

  /// Hex Values for Non-Common Colors
  ///
  static const int facebookButtonColorHex = 0xff3B5998;
  static const int iconColorHex = 0xff606060;
  static const int greyLightColorHex = 0xffB3B3B3;
  static const int purpleColorHex = 0xffB000F0;
  static const int lightGreyColorWithOpacityHex35 = 0x59C9CCD1;
  static const int lightGreyColorHex = 0xffC9CCD1;
  static const int heavyGreyColorHex = 0xff666666;
  static const int lightGreyColorWithOpacityHex50 = 0x80C9CCD1;
  static const int lightRedColorHex = 0xffFF4A49;
  static const int blackColorHexWithOpacity59 = 0x59000000;
  static const int primaryColorHexWithOpacity = 0x596730EC;
  static const int textFieldColorHex = 0xffF1F2F6;
  static const int subTitlecolorHex = 0xfe666666;
  static const int originalGreyColorHex = 0xff535353;
  static const int textfieldHintColorHex = 0xffBFBFBF;
  static const int bottomNavBgColorHex = 0xff171717;
  static const int loginPlaceholderFontColorHex = 0xffD4D5D7;
  static const int lightGreyDividerColorHex = 0xffF6F6F6;
  static const int lightGreyTextColorHex = 0xff808080;
  static const int pinkColorHex = 0xffF31B82;
  static const int greyBorderColorHex = 0xffF2F2F2;
  static const int greyLightColourHex = 0xffCFCFCF;
  static const int redColorDarkHex = 0xffEB5757;
  static const int lightBlueishColorHex = 0xffEFF3FB;
  static const int shadowColorHex = 0xffDDE3F8;
  static const int checkBoxColorHex = 0xffD4D7D9;

  ///
  // APP COLOR HEX============================================================================
  static const int appDarkBlueColorHex = 0xff3B5670;
  static const int appLightBlueColorHex = 0xff89C6D2;
  static const int appRedColorHex = 0xffDC4F46;
  static const int appYellowColorHex = 0xffF7CE6D;
  static const int appGreenColorHex = 0xff86C466;
  static const int appLightGreyColorHex = 0xffEEEEEE;
  static const int appPurpleColorHex = 0xffDA70D6;
  static const int appDarkGreyColorHex = 0xffAFAFAF;
  static const int appTabsColorHex = 0xff89C6D2;
}
