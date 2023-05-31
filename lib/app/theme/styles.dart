// coverage:ignore-file

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  // static String? fontFamily =
  //     appFlavor == AppFlavor.PROD ? 'Product-Sans' : 'Avenir';

  static TextStyle black10 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.ten,
  );

  static TextStyle blackBold10 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.ten,
  );

  static TextStyle blue11 = TextStyle(
    color: ColorValues.blueColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle black12 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackBold12 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle black13 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle blackBold13 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.thirteen,
  );

  static TextStyle black14 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackBold14 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackBold14w400 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackBold14w500 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle semiBoldBlueDark14 = TextStyle(
      color: ColorValues.blueDarkColor,
      fontSize: Dimens.fourteen,
      fontWeight: FontWeight.w500);

  static TextStyle black15 = TextStyle(
    color: ColorValues.blackColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle blackBold15 = TextStyle(
    color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fifteen,
  );
  static TextStyle black15W400 = TextStyle(
    color: ColorValues.blackColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fifteen,
  );
  static TextStyle black15W600 = TextStyle(
    color: ColorValues.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fifteen,
  );

  static TextStyle black16 = TextStyle(
    color: ColorValues.blackColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle black16W400 = TextStyle(
    color: ColorValues.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black16W500 = TextStyle(
    color: ColorValues.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackBold16 = TextStyle(
    color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );
  static TextStyle blackMediumBold16 = TextStyle(
    color: ColorValues.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sixteen,
  );
  static TextStyle blueBold16 = const TextStyle(
    color: ColorValues.blueDarkColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle blue16 = TextStyle(
    color: ColorValues.blueColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blueDark16 = TextStyle(
    color: ColorValues.blueDarkColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blueDark14 = TextStyle(
    color: ColorValues.blueDarkColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black17 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.seventeen,
  );

  static TextStyle blackBold17 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.seventeen,
  );

  static TextStyle black18 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle blackBold18 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.eighteen,
  );

  static TextStyle black20 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle blackBold20 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twenty,
  );

  static TextStyle blackBold22 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle blackBold24 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyFour,
  );

  static TextStyle black26 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.twentySix,
  );

  static TextStyle blackBold26 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentySix,
  );

  static TextStyle blackBold30 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.thirty,
  );

  static TextStyle blackBold34 = TextStyle(
    // color: ColorValues.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.thirtyFour,
  );

  // static TextStyle blue16 = TextStyle(
  //   color: ColorValues.bluedarkColor,
  //   fontSize: Dimens.sixteen,
  // );

  static TextStyle white8 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.eight,
  );

  static TextStyle white10 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.ten,
  );

  static TextStyle whiteBold10 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.ten,
  );

  static TextStyle white11 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle whiteBold11 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.eleven,
  );

  static TextStyle white12 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle whiteBold12 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle whiteBold12w600 = TextStyle(
    color: ColorValues.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle white13 = TextStyle(
    color: ColorValues.whiteColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle whiteBold13 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.thirteen,
  );

  static TextStyle white13Underlined = TextStyle(
    // color: ColorValues.whiteColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.thirteen,
  );

  static TextStyle white14 = TextStyle(
    color: ColorValues.whiteColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle whiteBold14 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fourteen,
  );

  static TextStyle white15 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle whiteBold15 = TextStyle(
    color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fifteen,
  );

  static TextStyle white16 = TextStyle(
    color: ColorValues.whiteColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle whiteColor16 = TextStyle(
    color: ColorValues.whiteColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle whiteColor16w400 = TextStyle(
    color: ColorValues.whiteColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.sixteen,
  );

  static TextStyle whitecolor16 = TextStyle(
    color: ColorValues.whiteColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle whiteBold16 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle white17 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.seventeen,
  );

  static TextStyle whiteBold17 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.seventeen,
  );

  static TextStyle white18 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle whiteBold18 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.eighteen,
  );

  static TextStyle white20 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle whiteBold20 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twenty,
  );

  static TextStyle white22 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle whiteBold22 = TextStyle(
    fontWeight: FontWeight.bold,
    // color: ColorValues.whiteColor,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle white23 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle whiteBold23 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle white24 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.twentyFour,
  );

  static TextStyle whiteBold24 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyFour,
  );

  static TextStyle whiteBold25 = TextStyle(
    color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentyFour,
  );

  // static TextStyle whiteBold25 = TextStyle(
  //   color: ColorValues.whiteColor,
  //   fontWeight: FontWeight.bold,
  //   fontSize: Dimens.twentyFive,
  // );

  static TextStyle whiteBold26 = TextStyle(
    // color: ColorValues.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twentySix,
  );

  static TextStyle whiteBold35Oswald = TextStyle(
    fontFamily: 'Oswald',
    fontWeight: FontWeight.bold,
    // color: ColorValues.whiteColor,
    fontSize: Dimens.thirtyFive,
  );

  static TextStyle white30 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.thirty,
  );

  static TextStyle whiteBold30 = TextStyle(
    // color: ColorValues.whiteColor,
    fontSize: Dimens.thirty,
    fontWeight: FontWeight.bold,
  );

  static TextStyle primary10 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.ten,
  );

  static TextStyle primaryBold10 = TextStyle(
    // color: ColorValues.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.ten,
  );

  static TextStyle primary11 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle primaryBold11 = TextStyle(
    fontWeight: FontWeight.bold,
    // color: ColorValues.primaryColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle primary12 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle primaryBold12 = TextStyle(
    // color: ColorValues.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle primary12Underlinded = TextStyle(
    // color: ColorValues.primaryColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.twelve,
  );

  static TextStyle primary13 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle primaryBold13 = TextStyle(
    // color: ColorValues.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.thirteen,
  );

  static TextStyle primary14 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle primary14Underline = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.fourteen,
    decoration: TextDecoration.underline,
  );

  static TextStyle primaryBold14 = TextStyle(
    // color: ColorValues.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fourteen,
  );

  static TextStyle primary15 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primaryBold15 = TextStyle(
    // color: ColorValues.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primary15Underlined = TextStyle(
    // color: ColorValues.primaryColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primary16 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle primaryBold16 = TextStyle(
    // color: ColorValues.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle primary18 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle primary20 = TextStyle(
    // color: ColorValues.primaryColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle primaryBold20 = TextStyle(
    // color: ColorValues.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twenty,
  );

  static TextStyle grey10 = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.ten,
  );
  static TextStyle appDarkGrey10 = TextStyle(
    color: ColorValues.appDarkGreyColor,
    fontSize: Dimens.ten,
  );
  static TextStyle appDarkGrey12 = TextStyle(
    color: ColorValues.appDarkGreyColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle greyBold10 = TextStyle(
    // color: ColorValues.greyColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.ten,
  );

  static TextStyle grey11 = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle grey12 = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle mediumGrey12 = TextStyle(
    color: ColorValues.greyColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle greyBold12 = TextStyle(
    // color: ColorValues.greyColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle grey12LineThrough = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.twelve,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle grey13 = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle grey13LineThrough = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.thirteen,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle grey14 = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle grey15 = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle grey16 = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle grey18 = TextStyle(
      // color: ColorValues.greyColor,
      fontSize: Dimens.eighteen);

  static TextStyle grey20 = TextStyle(
    // color: ColorValues.greyColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle greyLight15 = TextStyle(
    // color: ColorValues.greyColor.withOpacity(Dimens.pointFiveStatic),
    fontSize: Dimens.fifteen,
  );

  static TextStyle greyLight12 = TextStyle(
    // color: ColorValues.greyColor.withOpacity(Dimens.pointFiveStatic),
    fontSize: Dimens.twelve,
  );

  static TextStyle greyMediumLight12 = TextStyle(
    color: ColorValues.lightGreyTextColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w400,
  );

  static TextStyle greyLight14 = TextStyle(
    color: ColorValues.lightGreyTextColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle greyLight16 = TextStyle(
    color: ColorValues.greyColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle red12 = TextStyle(
    // color: ColorValues.redColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle redBold12 = TextStyle(
    // color: ColorValues.redColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.bold,
  );

  static TextStyle red15 = TextStyle(
    // color: ColorValues.redColor,
    fontSize: Dimens.fifteen,
  );
  static TextStyle appDarkBlue12 = TextStyle(
    color: ColorValues.appDarkBlueColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.twelve,
  );
  static TextStyle appDarkBlue13 = TextStyle(
    color: ColorValues.appDarkBlueColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.thirteen,
  );
  static TextStyle appDarkBlue15 = TextStyle(
    color: ColorValues.appDarkBlueColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.fifteen,
  );
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /// non common styles
  static TextStyle blackMedium16 = TextStyle(
    // color: ColorValues.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle heavyGrey13 = TextStyle(
    // color: ColorValues.heavyGreyColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle redNormal14 = TextStyle(
    // color: ColorValues.redColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackNormal10 = TextStyle(
    // color: ColorValues.redColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.ten,
  );

  static TextStyle greyNormal10 = TextStyle(
    // color: ColorValues.redColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.ten,
  );

  static TextStyle blackNormal14 = TextStyle(
    // color: ColorValues.redColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackNormal12 = TextStyle(
    // // // color: ColorValues.blackColor,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackMedium12 = TextStyle(
    // // // color: ColorValues.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackNormal15 = TextStyle(
    // // color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: Dimens.fifteen,
  );

  static TextStyle blackMedium14 = TextStyle(
    // // // color: ColorValues.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle pinkBold16w700 = TextStyle(
    color: ColorValues.pinkColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle pinkBold12w400 = TextStyle(
    color: ColorValues.pinkColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w400,
  );
  static TextStyle blue700 = TextStyle(
    color: ColorValues.appDarkBlueColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fifteen,
  );
  static TextStyle green700 = TextStyle(
    color: ColorValues.greenColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fifteen,
  );

  static ButtonStyle greenElevatedButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Color.fromARGB(255, 96, 205, 76),
  );
  static ButtonStyle yellowElevatedButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Color.fromARGB(255, 237, 219, 51),
  );
  static ButtonStyle redElevatedButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Color.fromARGB(255, 233, 164, 143),
  );
  static ButtonStyle darkRedElevatedButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Colors.red,
  );
  static ButtonStyle blueElevatedButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Color.fromARGB(255, 143, 223, 233),
  );
  static ButtonStyle darkBlueElevatedButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Color.fromARGB(255, 9, 115, 156),
  );
  static TextStyle redBold15 = TextStyle(
    color: ColorValues.appRedColor,
    fontSize: Dimens.fifteen,
    fontWeight: FontWeight.bold,
  );
  static ButtonStyle navyBlueElevatedButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Color.fromARGB(255, 7, 63, 115),
  );
  static TextStyle blue17 = TextStyle(
    color: ColorValues.appDarkBlueColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.seventeen,
  );
  static BoxDecoration cardLikeDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: ColorValues.primaryColor.withOpacity(0.15),
          offset: const Offset(1, 1),
          blurRadius: 16.0)
    ],
    border: Border.all(width: Dimens.one, color: Colors.transparent),
    color: ColorValues.whiteColor,
    borderRadius: BorderRadius.circular(10),
  );

  ///
}
