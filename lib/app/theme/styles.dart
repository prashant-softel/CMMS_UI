// coverage:ignore-file

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  // static String? fontFamily =
  //     appFlavor == AppFlavor.PROD ? 'Product-Sans' : 'Avenir';

  static TextStyle black10 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.ten,
  );

  static TextStyle blackBold10 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.ten,
  );

  static TextStyle blue11 = TextStyle(
    color: ColorsValue.blueColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle black12 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackBold12 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle black13 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle blackBold13 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.thirteen,
  );

  static TextStyle black14 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackBold14 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackBold14w400 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackBold14w500 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle semiBoldBlueDark14 = TextStyle(
      color: ColorsValue.blueDarkColor,
      fontSize: Dimens.fourteen,
      fontWeight: FontWeight.w500);

  static TextStyle black15 = TextStyle(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle blackBold15 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fifteen,
  );

  static TextStyle black16 = TextStyle(
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle black16W400 = TextStyle(
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black16W500 = TextStyle(
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackBold16 = TextStyle(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blueBold16 = const TextStyle(
    color: ColorsValue.blueDarkColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle blackMediumBold16 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blue16 = TextStyle(
    color: ColorsValue.blueColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blueDark16 = TextStyle(
    color: ColorsValue.blueDarkColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blueDark14 = TextStyle(
    color: ColorsValue.blueDarkColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black17 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.seventeen,
  );

  static TextStyle blackBold17 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.seventeen,
  );

  static TextStyle black18 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle blackBold18 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.eighteen,
  );

  static TextStyle black20 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle blackBold20 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twenty,
  );
  static TextStyle blackBold22 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyTwo,
  );
  static TextStyle blackBold24 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyFour,
  );

  static TextStyle black26 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.twentySix,
  );

  static TextStyle blackBold26 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentySix,
  );

  static TextStyle blackBold30 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.thirty,
  );

  static TextStyle blackBold34 = TextStyle(
    // color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.thirtyFour,
  );

  // static TextStyle blue16 = TextStyle(
  //   color: ColorsValue.bluedarkColor,
  //   fontSize: Dimens.sixteen,
  // );

  static TextStyle white8 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.eight,
  );

  static TextStyle white10 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.ten,
  );

  static TextStyle whiteBold10 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.ten,
  );

  static TextStyle white11 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle whiteBold11 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.eleven,
  );

  static TextStyle white12 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle white12TextAlignCenter = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle whiteBold12 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle whiteBold12w600 = TextStyle(
    color: ColorsValue.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle white13 = TextStyle(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle whiteBold13 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.thirteen,
  );

  static TextStyle white13Underlined = TextStyle(
    // color: ColorsValue.whiteColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.thirteen,
  );

  static TextStyle white14 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle whiteBold14 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fourteen,
  );

  static TextStyle white15 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle whiteBold15 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fifteen,
  );

  static TextStyle white16 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle whiteColor16 = TextStyle(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle whiteColor16w400 = TextStyle(
    color: ColorsValue.whiteColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.sixteen,
  );

  static TextStyle whitecolor16 = TextStyle(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle whiteBold16 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle white17 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.seventeen,
  );

  static TextStyle whiteBold17 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.seventeen,
  );

  static TextStyle white18 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle whiteBold18 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.eighteen,
  );

  static TextStyle white20 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle whiteBold20 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twenty,
  );

  static TextStyle white22 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle whiteBold22 = TextStyle(
    fontWeight: FontWeight.bold,
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle white23 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle whiteBold23 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle white24 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.twentyFour,
  );

  static TextStyle whiteBold24 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyFour,
  );

  static TextStyle whiteBold25 = TextStyle(
    color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyFour,
  );

  // static TextStyle whiteBold25 = TextStyle(
  //   color: ColorsValue.whiteColor,
  //   fontWeight: FontWeight.bold,
  //   fontSize: Dimens.twentyFive,
  // );

  static TextStyle whiteBold26 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentySix,
  );

  static TextStyle whiteBold35Oswald = TextStyle(
    fontFamily: 'Oswald',
    fontWeight: FontWeight.bold,
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.thirtyFive,
  );

  static TextStyle white30 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.thirty,
  );

  static TextStyle whiteBold30 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontSize: Dimens.thirty,
    fontWeight: FontWeight.bold,
  );

  static TextStyle primary10 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.ten,
  );

  static TextStyle primaryBold10 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.ten,
  );

  static TextStyle primary11 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle primaryBold11 = TextStyle(
    fontWeight: FontWeight.bold,
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle primary12 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle primaryBold12 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle primary12Underlinded = TextStyle(
    // color: ColorsValue.primaryColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.twelve,
  );

  static TextStyle primary13 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle primaryBold13 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.thirteen,
  );

  static TextStyle primary14 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle primary14Underline = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.fourteen,
    decoration: TextDecoration.underline,
  );

  static TextStyle primaryBold14 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fourteen,
  );

  static TextStyle primary15 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primaryBold15 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primary15Underlined = TextStyle(
    // color: ColorsValue.primaryColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primary16 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle primaryBold16 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle primary18 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle primary20 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle primaryBold20 = TextStyle(
    // color: ColorsValue.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twenty,
  );

  static TextStyle grey10 = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.ten,
  );
  static TextStyle greyLight10 = TextStyle(
    color: ColorsValue.greyLightColor,
    fontSize: Dimens.ten,
  );

  static TextStyle greyBold10 = TextStyle(
    // color: ColorsValue.greyColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.ten,
  );

  static TextStyle grey11 = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle grey12 = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle mediumGrey12 = TextStyle(
    color: ColorsValue.greyColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle greyBold12 = TextStyle(
    // color: ColorsValue.greyColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle grey12LineThrough = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.twelve,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle grey13 = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle grey13LineThrough = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.thirteen,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle grey14 = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle grey15 = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle grey16 = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle grey18 = TextStyle(
      // color: ColorsValue.greyColor,
      fontSize: Dimens.eighteen);

  static TextStyle grey20 = TextStyle(
    // color: ColorsValue.greyColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle greyLight15 = TextStyle(
    // color: ColorsValue.greyColor.withOpacity(Dimens.pointFiveStatic),
    fontSize: Dimens.fifteen,
  );

  static TextStyle greyLight12 = TextStyle(
    // color: ColorsValue.greyColor.withOpacity(Dimens.pointFiveStatic),
    fontSize: Dimens.twelve,
  );

  static TextStyle greyMediumLight12 = TextStyle(
    color: ColorsValue.lightGreyTextColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w400,
  );

  static TextStyle greyLight14 = TextStyle(
    color: ColorsValue.lightGreyTextColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle greyLight16 = TextStyle(
    color: ColorsValue.greyColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle red12 = TextStyle(
    // color: ColorsValue.redColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle redBold12 = TextStyle(
    // color: ColorsValue.redColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.bold,
  );

  static TextStyle red15 = TextStyle(
    // color: ColorsValue.redColor,
    fontSize: Dimens.fifteen,
  );
  static TextStyle navyBlue12 = TextStyle(
    color: ColorsValue.navyBlueColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.twelve,
  );
  static TextStyle navyBlue13 = TextStyle(
    color: ColorsValue.navyBlueColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.thirteen,
  );

  static TextStyle snackBarTitleStyle = TextStyle(
    fontWeight: FontWeight.normal,
    color: ColorsValue.whiteColor,
    fontSize: 0.1,
  );

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /// non common styles
  static TextStyle blackMedium16 = TextStyle(
    // color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle heavyGrey13 = TextStyle(
    // color: ColorsValue.heavyGreyColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle redNormal14 = TextStyle(
    // color: ColorsValue.redColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackNormal10 = TextStyle(
    // color: ColorsValue.redColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.ten,
  );

  static TextStyle greyNormal10 = TextStyle(
    // color: ColorsValue.redColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.ten,
  );

  static TextStyle blackNormal14 = TextStyle(
    // color: ColorsValue.redColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackNormal12 = TextStyle(
    // // // color: ColorsValue.blackColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackMedium12 = TextStyle(
    // // // color: ColorsValue.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackNormal15 = TextStyle(
    // // color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.fifteen,
  );

  static TextStyle blackMedium14 = TextStyle(
    // // // color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle pinkBold16w700 = TextStyle(
    color: ColorsValue.pinkColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle pinkBold12w400 = TextStyle(
    color: ColorsValue.pinkColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textDark14 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: Dimens.fourteen,
    color: ColorsValue.whiteColor,
  );

  static BoxDecoration cardLikeDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: ColorsValue.primaryColor.withOpacity(0.15),
          offset: const Offset(1, 1),
          blurRadius: 16.0)
    ],
    border: Border.all(width: Dimens.one, color: Colors.transparent),
    color: ColorsValue.whiteColor,
    borderRadius: BorderRadius.circular(10),
  );
}
