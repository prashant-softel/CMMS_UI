// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Contains the dimensions and padding used
/// all over the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Dimens {
  static double zero = 0.0;
  static double one = 1.0;
  static double two = 2.0;
  static double three = 3.0;
  static double four = 4.0;
  static double five = 5.0;
  static double six = 6.0;
  static double seven = 7.0;
  static double eight = 8.0;
  static double nine = 9.0;
  static double ten = 10.0;
  static double eleven = 11.0;
  static double twelve = 12.0;
  static double thirteen = 13.0;
  static double fourteen = 14.0;
  static double fifteen = 15.0;

  static double sixteen = 16.0;
  static double seventeen = 17.0;
  static double eighteen = 18.0;
  static double nineteen = 19.0;
  static double twenty = 20.0;
  static double twentyTwo = 22.0;
  static double twentyThree = 23.0;
  static double twentyFour = 24.0;
  static double twentyFive = 25.0;
  static double twentySix = 26.0;
  static double twentySeven = 27.0;
  static double twentyEight = 28.0;
  static double twentyNine = 29.0;
  static double thirty = 30.0;
  static double thirtyOne = 31.0;
  static double thirtyTwo = 32.0;
  static double thirtyFour = 34.0;
  static double thirtyFive = 35.0;
  static double thirtySeven = 37.0;

  static double thirtySix = 36.0;
  static double thirtyEight = 38.0;
  static double thirtyNine = 39.0;
  static double fourty = 40.0;
  static double fourtyTwo = 42.0;
  static double fourtyFour = 44.0;
  static double fourtyFive = 45.0;
  static double fourtySix = 46.0;
  static double fourtyEight = 48.0;
  static double fourtyNine = 49.0;
  static double fifty = 50.0;
  static double fortySeven = 47.0;
  static double fiftyTwo = 52.0;
  static double fiftyFour = 54.0;
  static double fiftyFive = 55.0;
  static double fiftySix = 56.0;
  static double sixty = 60.0;
  static double sixtyOne = 61.0;
  static double sixtyFour = 64.0;
  static double sixtyNine = 69.0;
  static double seventy = 70.0;
  static double seventyFour = 74.0;
  static double seventyFive = 75.0;
  static double eighty = 80.0;
  static double eightyFive = 85.0;
  static double eightySix = 86.0;
  static double ninty = 90.0;
  static double nintyFour = 94.0;
  static double nintyFive = 95.0;
  static double hundred = 100.0;
  static double hundredFour = 104.0;
  static double hundredFive = 105.0;
  static double hundredSix = 106.0;
  static double hundredEight = 108.0;
  static double hundredTen = 110.0;
  static double hundredFifteen = 115.0;
  static double hundredTwenty = 120.0;
  static double hundredTwentyFive = 125.0;
  static double hundredTwentyTwo = 122.0;
  static double hundredThirty = 130.0;
  static double hundredThirtyTwo = 132.0;
  static double hundredThirtyFour = 134.0;
  static double hundredThirtyFive = 135.0;
  static double hundredThirtySix = 136.0;
  static double hundredThirtySeven = 137.0;
  static double hundredFourty = 140.0;
  static double hundredFourtyFour = 144.0;
  static double hundredFourtyEight = 148.0;
  static double hundredFifty = 150.0;
  static double hundredFiftyOne = 151.0;
  static double hundredFiftyFive = 155.0;
  static double hundredSixty = 160.0;
  static double hundredSixtyTwo = 162.0;
  static double hundredSixtyFour = 164.0;
  static double hundredSixtySeven = 167.0;
  static double hundredSixtyFive = 165.0;
  static double hundredSeventy = 170.0;
  static double hundredSeventyTwo = 172.0;
  static double hundredEighty = 180.0;
  static double hundredEightyEight = 188.0;
  static double hundredNinty = 190.0;
  static double hundredNintyThree = 193.0;
  static double twoHundred = 200.0;
  static double twoHundredThirty = 230.0;

  static double oneHundredEighty = 180.0;
  static double oneHundredSeventy = 170.0;
  static double oneHundredSeventyFive = 175.0;
  static double oneHundredSixty = 160.0;
  static double twoHundredFive = 205.0;
  static double twoHundredTen = 210.0;
  static double twoHundredTwentyTwo = 222.0;
  static double twoHundredThirtySix = 236.0;
  static double twoHundredFourty = 240.0;
  static double twoHundredFifty = 250.0;
  static double twoHundredFiftyFive = 255.0;
  static double twoHundredEighty = 280.0;
  static double twoHundredNintyOne = 291.0;
  static double twoHundredNintyTwo = 292.0;
  static double threeHundred = 300.0;
  static double threeHundredFifty = 350.0;
  static double threeHundredSeventy = 370.0;
  static double threeHundredTwentySix = 326.0;
  static double threeHundredTwentyEight = 328.0;
  static double threeHundredTwentyNine = 329.0;
  static double threeHundredTwentyTwo = 332.0;
  static double threeHundredFourty = 340.0;
  static double threeHundredFourtyThree = 343.0;
  static double threeHundredSeventyTwo = 372.0;
  static double threeHundredSeventyFive = 375.0;
  static double fourHundred = 400.0;
  static double fourHundredFifty = 450.0;
  static double fiveHundred = 500.0;
  static double fiveHundredThirtyEight = 538.0;
  static double fiveHundredFifty = 550.0;
  static double sixHundred = 600.0;
  static double sixHundredFifty = 650.0;
  static double fifteenStatic = 15;
  static double twentyStatic = 20;
  static double hundredStatic = 100;
  static double hundredFiftyStatic = 150;
  static double twoHundredStatic = 200;
  static double twoHundredFifteen = 215;
  static double twoHundredSeventy = 270;
  static double twoHundredNinty = 290;
  static double twoHundredNintyFive = 295;
  static double twoHundredNintyEight = 298;

  static double pointZeroZeroEight = 0.08;
  static double pointZeroZeroNine = 0.09;
  static double pointOne = 0.1;
  static double pointOneStatic = 0.1;
  static double pointOneSeven = 0.17;
  static double pointOneEight = 0.18;
  static double pointTwo = 0.2;
  static double pointThree = 0.3;
  static double pointThreeTwo = 0.32;
  static double pointThreeThree = 0.33;
  static double pointThreeFour = 0.34;
  static double pointThreeFive = 0.35;
  static double pointFour = 0.4;
  static double pointFourFive = 0.45;
  static double pointFive = 0.5;
  static double pointFiveFive = 0.55;
  static double pointSix = 0.6;
  static double pointSixFive = 0.65;
  static double pointSeven = 0.7;
  static double pointEight = 0.8;
  static double pointNine = 0.9;
  static double pointNineFour = 0.94;
  static double pointNineSix = 0.96;
  static double onePointFive = 1.5;

  static double pointZeroStatic = 0.0;
  static double pointZeroZeroNineStatic = 0.09;
  static double pointOneSevenStatic = 0.17;
  static double pointOneFiveStatic = 0.15;
  static double pointTwoStatic = 0.2;
  static double pointTwoFiveStatic = 0.25;
  static double pointThreeStatic = 0.3;
  static double pointThreeThreeStatic = 0.33;
  static double pointThreeFourStatic = 0.34;
  static double pointThreeFiveStatic = 0.35;
  static double pointThreeSixStatic = 0.36;
  static double pointThreeSevenStatic = 0.37;
  static double pointFourStatic = 0.4;
  static double pointFiveStatic = 0.5;
  static double pointFiveFiveStatic = 0.55;
  static double pointSixStatic = 0.6;
  static double pointSixFiveStatic = 0.65;
  static double pointSevenStatic = 0.7;
  static double pointEightStatic = 0.8;
  static double oneStatic = 1.0;
  static double hundredFourtyFive = 145.sp;

  /// Get the height with the percent value of the screen height.
  static double percentHeight(double percentValue) => percentValue.sh;

  /// Get the width with the percent value of the screen width.
  static double percentWidth(double percentValue) => percentValue.sw;

  /// Get height percent [value].
  static double getHeightPercent(double value) => Get.height * value;

  /// Get width percent [value].
  static double getWidthPercent(double value) => Get.width * value;

  static SizedBox getBoxWidth(double value) => SizedBox(
        width: getWidthPercent(value),
      );
  static SizedBox getBoxHeight(double value) => SizedBox(
        height: getHeightPercent(value),
      );

  /// Paddings
  static EdgeInsets edgeInsets0 = EdgeInsets.all(zero.h);
  static EdgeInsets edgeInsets2 = EdgeInsets.all(two.h);
  static EdgeInsets edgeInsets3 = EdgeInsets.all(three.h);
  static EdgeInsets edgeInsets5 = EdgeInsets.all(five.h);
  static EdgeInsets edgeInsets6 = EdgeInsets.all(six.h);
  static EdgeInsets edgeInsets8 = EdgeInsets.all(eight.h);
  static EdgeInsets edgeInsets10 = EdgeInsets.all(ten.h);
  static EdgeInsets edgeInsets11 = EdgeInsets.all(eleven.h);
  static EdgeInsets edgeInsets12 = EdgeInsets.all(twelve.h);
  static EdgeInsets edgeInsets13 = EdgeInsets.all(thirteen.h);
  static EdgeInsets edgeInsets14 = EdgeInsets.all(fourteen.h);
  static EdgeInsets edgeInsets15 = EdgeInsets.all(fifteen.h);
  static EdgeInsets edgeInsets16 = EdgeInsets.all(sixteen.h);
  static EdgeInsets edgeInsets18 = EdgeInsets.all(eighteen.h);
  static EdgeInsets edgeInsets20 = EdgeInsets.all(twenty.h);
  static EdgeInsets edgeInsets25 = EdgeInsets.all(twentyFive.h);
  static EdgeInsets edgeInsets30 = EdgeInsets.all(thirty.h);
  static EdgeInsets edgeInsets35 = EdgeInsets.all(thirtyFive.h);
  static EdgeInsets edgeInsets40 = EdgeInsets.all(fourty.h);
  static EdgeInsets edgeInsets50 = EdgeInsets.all(fifty.h);
  static EdgeInsets edgeInsets60 = EdgeInsets.all(sixty.h);

  static EdgeInsets edgeInsets0_0_0_15 = EdgeInsets.only(
    bottom: fifteen.h,
  );
  static EdgeInsets edgeInsets0_0_0_4 = EdgeInsets.only(
    bottom: four.h,
  );
  static EdgeInsets edgeInsets0_0_0_5 = EdgeInsets.only(
    bottom: five.h,
  );
  static EdgeInsets edgeInsets0_0_0_10 = EdgeInsets.only(
    bottom: ten.h,
  );

  static EdgeInsets edgeInsetsLeft15 = EdgeInsets.only(left: fifteen.w);

  static EdgeInsets edgeInsetsLeft10 = EdgeInsets.only(left: ten.w);

  static EdgeInsets edgeInsetsTopt10 = EdgeInsets.only(top: ten.h);

  static EdgeInsets edgeInsetsTop20 = EdgeInsets.only(top: twenty.h);

  static EdgeInsets edgeInsetsBottom30 = EdgeInsets.only(bottom: thirty.h);

  static EdgeInsets edgeInsetsLeft2 = EdgeInsets.only(left: two.w);

  static EdgeInsets edgeInsetsRight24 = EdgeInsets.only(right: twentyFour.w);

  static EdgeInsets edgeInsetsRight16 = EdgeInsets.only(right: sixteen.w);

  static EdgeInsets edgeInsetsRight20 = EdgeInsets.only(right: twenty.w);

  static EdgeInsets edgeInsetsRight6 = EdgeInsets.only(right: six.w);

  static EdgeInsets edgeInsetsRight10 = EdgeInsets.only(right: ten.w);

  static EdgeInsets edgeInsets25_14 = EdgeInsets.symmetric(
    horizontal: Dimens.twentyFive.w,
    vertical: Dimens.fourteen.h,
  );

  static EdgeInsets edgeInsets20_40 = EdgeInsets.symmetric(
    horizontal: Dimens.twenty.w,
    vertical: Dimens.fourty.h,
  );

  static EdgeInsets edgeInsets05_10 = EdgeInsets.symmetric(
    horizontal: Dimens.five.w,
    vertical: Dimens.ten.h,
  );
  static EdgeInsets edgeInsets16_0_16_10 = EdgeInsets.fromLTRB(
    sixteen.w,
    zero.h,
    sixteen.w,
    ten.h,
  );

  static EdgeInsets edgeInsets15_15_15_0 = EdgeInsets.fromLTRB(
    fifteen.w,
    fifteen.h,
    fifteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_20_16_20 = EdgeInsets.fromLTRB(
    sixteen.w,
    twenty.h,
    sixteen.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets16_25_16_25 = EdgeInsets.fromLTRB(
    sixteen.w,
    twentyFive.h,
    sixteen.w,
    twentyFive.h,
  );

  static EdgeInsets edgeInsets11_10_0_5 = EdgeInsets.fromLTRB(
    eleven.w,
    ten.h,
    zero.w,
    five.h,
  );

  static EdgeInsets edgeInsets16_34_16_30 = EdgeInsets.fromLTRB(
    sixteen.w,
    thirtyFour.h,
    sixteen.w,
    thirty.h,
  );

  static EdgeInsets edgeInsets16_50_16_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    fifty.h,
    sixteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets10_25_15_10 = EdgeInsets.fromLTRB(
    ten.w,
    twentyFive.h,
    fifteen.w,
    ten.h,
  );

  static EdgeInsets edgeInsets16_20_0_20 = EdgeInsets.fromLTRB(
    sixteen.w,
    twenty.h,
    zero.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets20_20_20_0 = EdgeInsets.fromLTRB(
    twenty.w,
    twenty.h,
    twenty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_0_16_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    zero.h,
    sixteen.w,
    zero.h,
  );
  static EdgeInsets edgeInsets16_4_16_4 = EdgeInsets.fromLTRB(
    sixteen.w,
    zero.h,
    sixteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_10_16_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    ten.h,
    sixteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_10_16_10 = EdgeInsets.fromLTRB(
    sixteen.w,
    ten.h,
    sixteen.w,
    ten.h,
  );

  static EdgeInsets edgeInsets16_10_16_20 = EdgeInsets.fromLTRB(
    sixteen.w,
    ten.h,
    sixteen.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets15_20_24_20 = EdgeInsets.fromLTRB(
    fifteen.w,
    twenty.h,
    twentyFour.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets16_16_22_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    sixteen.h,
    twentyTwo.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_0_10_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    zero.h,
    ten.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_5_16_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    five.h,
    sixteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_3_0_3 = EdgeInsets.fromLTRB(
    zero.w,
    three.h,
    zero.w,
    three.h,
  );
  static EdgeInsets edgeInsets16_16_16_25 = EdgeInsets.fromLTRB(
    sixteen.w,
    sixteen.h,
    sixteen.w,
    twentyFive.h,
  );

  static EdgeInsets edgeInsets24_10_15_10 = EdgeInsets.fromLTRB(
    twentyFour.w,
    ten.h,
    fifteen.w,
    ten.h,
  );

  static EdgeInsets edgeInsets80_10_80_0 = EdgeInsets.fromLTRB(
    eighty.w,
    ten.h,
    eighty.w,
    ten.h,
  );

  static EdgeInsets edgeInsets20_0_0_0 = EdgeInsets.fromLTRB(
    twenty.w,
    zero.h,
    zero.w,
    five.h,
  );

  static EdgeInsets edgeInsets16_10 = EdgeInsets.symmetric(
    horizontal: Dimens.sixteen.w,
    vertical: Dimens.ten.h,
  );

  static EdgeInsets edgeInsets0_16_0_0 = EdgeInsets.fromLTRB(
    zero.w,
    sixteen.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets12_8_12_8 = EdgeInsets.fromLTRB(
    twelve.w,
    eight.h,
    twelve.w,
    eight.h,
  );

  static EdgeInsets edgeInsets16_16_0_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    sixteen.h,
    zero.w,
    zero.h,
  );
  static EdgeInsets edgeInsets16_16_16_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    sixteen.h,
    sixteen.w,
    zero.h,
  );
  static EdgeInsets edgeInsets16_16_0_16 = EdgeInsets.fromLTRB(
    sixteen.w,
    sixteen.h,
    zero.w,
    sixteen.h,
  );
  static EdgeInsets edgeInsets0_16_16_0 = EdgeInsets.fromLTRB(
    zero.w,
    sixteen.h,
    sixteen.w,
    zero.h,
  );
  static EdgeInsets edgeInsets0_8_0_0 = EdgeInsets.fromLTRB(
    zero.w,
    eight.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_5_0_0 = EdgeInsets.fromLTRB(
    zero.w,
    five.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_8_16_8 = EdgeInsets.fromLTRB(
    sixteen.w,
    eight.h,
    sixteen.w,
    eight.h,
  );

  static EdgeInsets edgeInsets5_8_16_8 = EdgeInsets.fromLTRB(
    five.w,
    eight.h,
    sixteen.w,
    eight.h,
  );

  static EdgeInsets edgeInsets16_8_50_8 = EdgeInsets.fromLTRB(
    sixteen.w,
    eight.h,
    fifty.w,
    eight.h,
  );

  static EdgeInsets edgeInsets50_8_50_8 = EdgeInsets.fromLTRB(
    fifty.w,
    eight.h,
    fifty.w,
    eight.h,
  );

  static EdgeInsets edgeInsets20_0_30_0 = EdgeInsets.fromLTRB(
    twenty.w,
    zero.h,
    thirty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets40_0_40_0 = EdgeInsets.fromLTRB(
    fourty.w,
    zero.h,
    fourty.w,
    eight.h,
  );

  static EdgeInsets x = EdgeInsets.fromLTRB(
    sixteen.w,
    twentyFive.h,
    sixteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_35_16_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    thirtyFive.h,
    sixteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_20_16_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    twenty.h,
    sixteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_16_0_16 = EdgeInsets.fromLTRB(
    zero.w,
    sixteen.h,
    zero.w,
    sixteen.h,
  );

  static EdgeInsets edgeInsets0_6_0_6 = EdgeInsets.fromLTRB(
    zero.w,
    six.h,
    zero.w,
    six.h,
  );

  static EdgeInsets edgeInsets4_0_4_0 = EdgeInsets.fromLTRB(
    four.w,
    zero.h,
    four.w,
    zero.h,
  );
  static EdgeInsets edgeInsets4_0_0_0 = EdgeInsets.fromLTRB(
    four.w,
    zero.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_0_0_0 = EdgeInsets.fromLTRB(
    sixteen.w,
    zero.h,
    four.w,
    zero.h,
  );
  static EdgeInsets edgeInsets16_0_0_16 = EdgeInsets.fromLTRB(
    sixteen.w,
    zero.h,
    zero.w,
    sixteen.h,
  );
  static EdgeInsets edgeInsets0_0_16_16 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    sixteen.w,
    sixteen.h,
  );
  static EdgeInsets edgeInsets0_0_16_0 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    sixteen.w,
    zero.h,
  );
  static EdgeInsets edgeInsets0_0_7_0 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    seven.w,
    zero.h,
  );

  static EdgeInsets edgeInsets56_336_56_336 = EdgeInsets.fromLTRB(
    fiftySix.w,
    hundredThirtyFour.h,
    fiftySix.w,
    hundredThirtyFour.h,
  );

  static EdgeInsets edgeInsets2_0_0_0 = EdgeInsets.fromLTRB(
    two.w,
    zero.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets56_0_56_0 = EdgeInsets.fromLTRB(
    fiftySix.w,
    zero.h,
    fiftySix.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_5_0_5 = EdgeInsets.fromLTRB(
    zero.w,
    five.h,
    zero.w,
    five.h,
  );

  static EdgeInsets edgeInsets0_0_0_20 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    zero.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets10_15_10_15 = EdgeInsets.fromLTRB(
    ten.w,
    fifteen.h,
    ten.w,
    fifteen.h,
  );

  static EdgeInsets edgeInsets0_0_4_0 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    four.w,
    zero.h,
  );

  static EdgeInsets edgeInsets14_0_0_0 = EdgeInsets.fromLTRB(
    fourteen.w,
    zero.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_15_0_0 = EdgeInsets.fromLTRB(
    fifteen.w,
    fifteen.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_0_0_0 = EdgeInsets.fromLTRB(
    fifteen.w,
    zero.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_20_15_20 = EdgeInsets.fromLTRB(
    fifteen.w,
    twenty.h,
    fifteen.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets15_0_5_0 = EdgeInsets.fromLTRB(
    fifteen.w,
    zero.h,
    five.w,
    zero.h,
  );
  static EdgeInsets edgeInsets10_0_0_0 = EdgeInsets.fromLTRB(
    ten.w,
    zero.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets10_0_0_10 = EdgeInsets.fromLTRB(
    ten.w,
    zero.h,
    zero.w,
    ten.h,
  );

  static EdgeInsets edgeInsets5_0_5_0 = EdgeInsets.fromLTRB(
    five.w,
    zero.h,
    five.w,
    zero.h,
  );

  static EdgeInsets edgeInsets150_0_150_0 = EdgeInsets.fromLTRB(
    hundredFifty.w,
    zero.h,
    hundredFifty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets250_0_250_0 = EdgeInsets.fromLTRB(
    twoHundredFifty.w,
    zero.h,
    twoHundredFifty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets100_0_100_0 = EdgeInsets.fromLTRB(
    hundred.w,
    zero.h,
    hundred.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_10_0_10 = EdgeInsets.fromLTRB(
    zero.w,
    ten.h,
    zero.w,
    ten.h,
  );

  static EdgeInsets edgeInsets0_11_0_11 = EdgeInsets.fromLTRB(
    zero.w,
    eleven.h,
    zero.w,
    eleven.h,
  );

  static EdgeInsets edgeInsets0_10_10_0 = EdgeInsets.fromLTRB(
    zero.w,
    ten.h,
    ten.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_0_10_0 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    ten.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_0_05_0 = EdgeInsets.fromLTRB(
    zero,
    zero,
    five,
    zero,
  );
  static EdgeInsets edgeInsets0_0_05_5 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    five.w,
    five.h,
  );
  static EdgeInsets edgeInsets0_0_05_8 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    five.w,
    eight.h,
  );

  static EdgeInsets edgeInsets0_20_0_0 = EdgeInsets.fromLTRB(
    zero.w,
    twenty.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_0_15_0 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    fifteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_0_19_0 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    nineteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_6_16_20 = EdgeInsets.fromLTRB(
    sixteen.w,
    six.h,
    sixteen.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets5_0_0_0 = EdgeInsets.fromLTRB(
    five.w,
    zero.h,
    zero.w,
    zero.h,
  );
  static EdgeInsets edgeInsets0_0_52_0 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    fiftyTwo.w,
    zero.h,
  );

  static EdgeInsets edgeInsets10_0_10_0 = EdgeInsets.fromLTRB(
    ten.w,
    zero.h,
    ten.w,
    zero.h,
  );

  static EdgeInsets edgeInsets20_30_0_0 = EdgeInsets.fromLTRB(
    twenty.w,
    thirty.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets8_10_0_0 = EdgeInsets.fromLTRB(
    eight.w,
    ten.h,
    zero.w,
    zero.h,
  );

  // static EdgeInsets edgeInsets16_6_16_6 = EdgeInsets.fromLTRB(
  //   sixteen,
  //   six,
  //   sixteen,
  //   six,
  // );

  static EdgeInsets edgeInsets16_6_16_6 = EdgeInsets.fromLTRB(
    sixteen.w,
    six.h,
    sixteen.w,
    six.h,
  );

  static EdgeInsets edgeInsets12_0_12_0 = EdgeInsets.fromLTRB(
    twelve.w,
    zero.h,
    twelve.w,
    zero.h,
  );

  static EdgeInsets edgeInsets12_20_12_0 = EdgeInsets.fromLTRB(
    twelve.w,
    twenty.h,
    twelve.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_7_15_7 = EdgeInsets.fromLTRB(
    fifteen.w,
    seven.h,
    fifteen.w,
    seven.h,
  );
  static EdgeInsets edgeInsets15_0_15_0 = EdgeInsets.fromLTRB(
    fifteen.w,
    zero.h,
    fifteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_0_15_20 = EdgeInsets.fromLTRB(
    fifteen.w,
    zero.h,
    fifteen.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets15_6_15_6 = EdgeInsets.fromLTRB(
    fifteen.w,
    six.h,
    fifteen.w,
    six.h,
  );

  static EdgeInsets edgeInsets15_10_15_6 = EdgeInsets.fromLTRB(
    fifteen.w,
    ten.h,
    fifteen.w,
    six.h,
  );

  static EdgeInsets edgeInsets24_0_24_0 = EdgeInsets.fromLTRB(
    twentyFour.w,
    zero.h,
    twentyFour.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_11_15_11 = EdgeInsets.fromLTRB(
    fifteen.w,
    eleven.h,
    fifteen.w,
    eleven.h,
  );

  static EdgeInsets edgeInsets35_11_15_11 = EdgeInsets.fromLTRB(
    thirtyFive.w,
    eleven.h,
    fifteen.w,
    eleven.h,
  );

  static EdgeInsets edgeInsets35_0_15_0 = EdgeInsets.fromLTRB(
    thirtyFive.w,
    zero.h,
    fifteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets35_0_15_0Minus12 = EdgeInsets.fromLTRB(
    thirtyFive.w - twelve.w,
    zero.h,
    fifteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets20_0_15_0 = EdgeInsets.fromLTRB(
    twenty.w,
    zero.h,
    fifteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_20_15_0 = EdgeInsets.fromLTRB(
    fifteen.w,
    twenty.h,
    fifteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_20_10_0 = EdgeInsets.fromLTRB(
    fifteen.w,
    twenty.h,
    ten.w,
    zero.h,
  );

  static EdgeInsets edgeInsets22_10_22_10 = EdgeInsets.fromLTRB(
    twentyTwo.w,
    ten.h,
    twentyTwo.w,
    ten.h,
  );

  static EdgeInsets edgeInsets22_0_22_0 = EdgeInsets.fromLTRB(
    twentyTwo.w,
    zero.h,
    twentyTwo.w,
    zero.h,
  );

  static EdgeInsets edgeInsets20_0_20_0 = EdgeInsets.fromLTRB(
    twenty.w,
    zero.h,
    twenty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets8_0_4_0 = EdgeInsets.fromLTRB(
    eight.w,
    zero.h,
    four.w,
    zero.h,
  );

  static EdgeInsets edgeInsets6_0_6_0 = EdgeInsets.fromLTRB(
    six.w,
    zero.h,
    six.w,
    zero.h,
  );

  static EdgeInsets edgeInsets7_9 = EdgeInsets.fromLTRB(
    seven.w,
    nine.h,
    seven.w,
    nine.h,
  );

  static EdgeInsets edgeInsets8_0_8_0 = EdgeInsets.fromLTRB(
    eight.w,
    zero.h,
    eight.w,
    zero.h,
  );

  static EdgeInsets edgeInsets10_10_10_0 = EdgeInsets.fromLTRB(
    ten.w,
    ten.h,
    ten.w,
    zero.h,
  );

  static EdgeInsets edgeInsets10_10_10_5 = EdgeInsets.fromLTRB(
    ten.w,
    ten.h,
    ten.w,
    five.h,
  );

  static EdgeInsets edgeInsets15_0_0_5 = EdgeInsets.fromLTRB(
    fifteen.w,
    zero.h,
    zero.w,
    five.h,
  );

  static EdgeInsets edgeInsets6_4_6_4 = EdgeInsets.fromLTRB(
    six.w,
    four.h,
    six.w,
    four.h,
  );

  static EdgeInsets edgeInsets30_10_30_10 = EdgeInsets.fromLTRB(
    thirty.w,
    ten.h,
    thirty.w,
    ten.h,
  );

  static EdgeInsets edgeInsets30_0_30_0 = EdgeInsets.fromLTRB(
    thirty.w,
    zero.h,
    thirty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_4_4_4 = EdgeInsets.fromLTRB(
    zero.w,
    four.h,
    four.w,
    four.h,
  );
  static EdgeInsets edgeInsets0_4_0_4 = EdgeInsets.fromLTRB(
    zero.w,
    four.h,
    four.w,
    four.h,
  );

  static EdgeInsets edgeInsets30_40_30_0 = EdgeInsets.fromLTRB(
    thirty.w,
    fourty.h,
    thirty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets8_2_8_2 = EdgeInsets.fromLTRB(
    eight.w,
    two.h,
    eight.w,
    two.h,
  );
  static EdgeInsets edgeInsets10_2_10_2 = EdgeInsets.fromLTRB(
    ten.w,
    two.h,
    ten.w,
    two.h,
  );

  static EdgeInsets edgeInsets15_2_15_2 = EdgeInsets.fromLTRB(
    fifteen.w,
    two.h,
    fifteen.w,
    two.h,
  );

  static EdgeInsets edgeInsets26_0_26_0 = EdgeInsets.fromLTRB(
    twentySix.w,
    zero.h,
    twentySix.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_0_20_0 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    twenty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets4 = EdgeInsets.fromLTRB(
    four.w,
    four.h,
    four.w,
    four.h,
  );

  static EdgeInsets edgeInsets00_04_04_04 = EdgeInsets.fromLTRB(
    zero.w,
    four.h,
    four.w,
    four.h,
  );

  static EdgeInsets edgeInsets00_06_00_00 = EdgeInsets.fromLTRB(
    zero.w,
    six.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets15_05_15_05 = EdgeInsets.fromLTRB(
    fifteen.w,
    five.h,
    fifteen.w,
    five.h,
  );

  static EdgeInsets edgeInsets15_10_15_10 = EdgeInsets.fromLTRB(
    fifteen.w,
    ten.h,
    fifteen.w,
    ten.h,
  );

  static EdgeInsets edgeInsets50_05_50_05 = EdgeInsets.fromLTRB(
    fifty.w,
    five.h,
    fifty.w,
    five.h,
  );

  static EdgeInsets edgeInsets26_50_26_15 = EdgeInsets.fromLTRB(
    twentySix.w,
    fifty.h,
    twentySix.w,
    fifteen.h,
  );

  static EdgeInsets edgeInsets10_14_10_0 = EdgeInsets.fromLTRB(
    ten.w,
    fourteen.h,
    ten.w,
    zero.h,
  );

  static EdgeInsets edgeInsets13_0_11_16 = EdgeInsets.fromLTRB(
    thirteen.w,
    zero.h,
    eleven.w,
    sixteen.h,
  );

  static EdgeInsets edgeInsets0_20_0_20 = EdgeInsets.fromLTRB(
    zero.w,
    twenty.h,
    zero.w,
    twenty.h,
  );

  static EdgeInsets edgeInsets18_0_18_0 = EdgeInsets.fromLTRB(
    eighteen.w,
    zero.h,
    eighteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_35_0_0 = EdgeInsets.fromLTRB(
    zero.w,
    thirtyFive.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_16_16_16 = EdgeInsets.fromLTRB(
    zero.w,
    sixteen.h,
    sixteen.w,
    sixteen.h,
  );

  static EdgeInsets edgeInsets18_8_18_7 = EdgeInsets.fromLTRB(
    eighteen.w,
    eight.h,
    eighteen.w,
    seven.h,
  );

  static EdgeInsets edgeInsets05_0_5_0 = EdgeInsets.fromLTRB(
    five.w,
    zero.h,
    five.w,
    zero.h,
  );

  static EdgeInsets edgeInsets30_0_30_15 = EdgeInsets.fromLTRB(
    thirty.w,
    zero.h,
    thirty.w,
    fifteen.h,
  );

  static EdgeInsets edgeInsets8_0_0_0 = EdgeInsets.fromLTRB(
    eight.w,
    zero.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_13_10_0 = EdgeInsets.fromLTRB(
    zero.w,
    thirteen.h,
    ten.w,
    zero.h,
  );

  static EdgeInsets edgeInsets25_20_20_0 = EdgeInsets.fromLTRB(
    twentyFive.w,
    twenty.h,
    twenty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_8_0_8 = EdgeInsets.symmetric(
    horizontal: zero.w,
    vertical: eight.h,
  );

  static EdgeInsets edgeInsets16_25_16_0 = EdgeInsets.only(
    bottom: zero.w,
    left: sixteen.h,
    right: sixteen.w,
    top: twentyFive.h,
  );

  static EdgeInsets edgeInsets16_15_16_0 = EdgeInsets.only(
    bottom: zero.w,
    left: sixteen.h,
    right: sixteen.w,
    top: fifteen.h,
  );

  static EdgeInsets edgeInsets45_0_30_0 = EdgeInsets.fromLTRB(
    fourtyFive.w,
    zero.h,
    thirty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_0_0_30 = EdgeInsets.fromLTRB(
    zero.w,
    zero.h,
    zero.w,
    thirty.h,
  );

  static EdgeInsets edgeInsets0_25_15_0 = EdgeInsets.fromLTRB(
    zero.w,
    twentyFive.h,
    fifteen.w,
    zero.h,
  );

  static EdgeInsets edgeInsets5_0_20_0 = EdgeInsets.fromLTRB(
    five.w,
    zero.h,
    twenty.w,
    zero.h,
  );

  static EdgeInsets edgeInsets10_70_0_0 = EdgeInsets.fromLTRB(
    ten.w,
    seventy.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets30_0_0_0 = EdgeInsets.fromLTRB(
    thirty.w,
    zero.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_25_5_0 = EdgeInsets.fromLTRB(
    zero.w,
    twentyFive.h,
    five.w,
    zero.h,
  );

  static EdgeInsets edgeInsets0_5_20_5 = EdgeInsets.fromLTRB(
    zero.w,
    five.h,
    twenty.w,
    five.h,
  );

  static EdgeInsets edgeInsets0_13_0_0 = EdgeInsets.fromLTRB(
    zero.w,
    thirteen.h,
    zero.w,
    zero.h,
  );

  static EdgeInsets edgeInsets16_0 = EdgeInsets.symmetric(
    horizontal: sixteen.w,
    vertical: zero.h,
  );

  /// Box widths
  static SizedBox boxWidth0 = SizedBox(width: 0.w);
  static SizedBox boxWidth2 = SizedBox(width: 2.w);
  static SizedBox boxWidth3 = SizedBox(width: 3.w);
  static SizedBox boxWidth4 = SizedBox(width: 4.w);
  static SizedBox boxWidth5 = SizedBox(width: 5.w);
  static SizedBox boxWidth6 = SizedBox(width: 6.w);
  static SizedBox boxWidth7 = SizedBox(width: 7.w);
  static SizedBox boxWidth8 = SizedBox(width: 8.w);
  static SizedBox boxWidth10 = SizedBox(width: 10.w);
  static SizedBox boxWidth12 = SizedBox(width: 12.w);
  static SizedBox boxWidth14 = SizedBox(width: 14.w);
  static SizedBox boxWidth15 = SizedBox(width: 15.w);
  static SizedBox boxWidth16 = SizedBox(width: 16.w);
  static SizedBox boxWidth20 = SizedBox(width: 20.w);
  static SizedBox boxWidth30 = SizedBox(width: 30.w);
  static SizedBox boxWidth40 = SizedBox(width: 40.w);
  static SizedBox boxWidth35 = SizedBox(width: 35.w);
  static SizedBox boxWidth37 = SizedBox(width: 37.w);

  static SizedBox boxWidth50 = SizedBox(width: 50.w);
  static SizedBox boxWidth47 = SizedBox(width: 47.w);
  static SizedBox boxWidth60 = SizedBox(width: 60.w);
  static SizedBox boxWidth70 = SizedBox(width: 70.w);
  static SizedBox boxWidth80 = SizedBox(width: 80.w);
  static SizedBox boxWidth85 = SizedBox(width: 85.w);
  static SizedBox boxWidth100 = SizedBox(width: 100.w);
  static SizedBox boxWidth90 = SizedBox(width: 90.w);
  static SizedBox boxWidth130 = SizedBox(width: 130.w);
  static SizedBox boxWidth120 = SizedBox(width: 120.w);
  static SizedBox boxWidth150 = SizedBox(width: 150.w);
  static SizedBox boxWidth140 = SizedBox(width: 140.w);
  static SizedBox boxWidth200 = SizedBox(width: 200.w);
  static SizedBox boxWidth230 = SizedBox(width: 230.w);
  static SizedBox boxWidth270 = SizedBox(width: 270.w);
  static SizedBox boxWidth290 = SizedBox(width: 290.w);
  static SizedBox boxWidth295 = SizedBox(width: 295.w);
  static SizedBox boxWidth298 = SizedBox(width: 298.w);

  static SizedBox boxWidth300 = SizedBox(width: 300.w);
  static SizedBox boxWidth180 = SizedBox(width: 180.w);
  static SizedBox boxWidth170 = SizedBox(width: 170.w);
  static SizedBox boxWidth175 = SizedBox(width: 175.w);
  static SizedBox boxWidth160 = SizedBox(width: 160.w);

  /// Box heights
  static SizedBox boxHeight0 = SizedBox(height: 0.h);
  static SizedBox boxHeight2 = SizedBox(height: 2.h);
  static SizedBox boxHeight3 = SizedBox(height: 3.h);
  static SizedBox boxHeight4 = SizedBox(height: 4.h);
  static SizedBox boxHeight5 = SizedBox(height: 5.h);
  static SizedBox boxHeight75 = SizedBox(height: 75.h);
  static SizedBox boxHeight8 = SizedBox(height: 8.h);
  static SizedBox boxHeight9 = SizedBox(height: 9.h);
  static SizedBox boxHeight10 = SizedBox(height: 10.h);
  static SizedBox boxHeight11 = SizedBox(height: 11.h);
  static SizedBox boxHeight12 = SizedBox(height: 12.h);
  static SizedBox boxHeight14 = SizedBox(height: 14.h);
  static SizedBox boxHeight15 = SizedBox(height: 15.h);
  static SizedBox boxHeight16 = SizedBox(height: 16.h);
  static SizedBox boxHeight18 = SizedBox(height: 18.h);
  static SizedBox boxHeight20 = SizedBox(height: 20.h);
  static SizedBox boxHeight22 = SizedBox(height: 22.h);
  static SizedBox boxHeight24 = SizedBox(height: 24.h);
  static SizedBox boxHeight25 = SizedBox(height: 25.h);
  static SizedBox boxHeight27 = SizedBox(height: 27.h);
  static SizedBox boxHeight30 = SizedBox(height: 30.h);
  static SizedBox boxHeight40 = SizedBox(height: 40.h);
  static SizedBox boxHeight35 = SizedBox(height: 35.h);
  static SizedBox boxHeight44 = SizedBox(height: 44.h);
  static SizedBox boxHeight45 = SizedBox(height: 45.h);
  static SizedBox boxHeight50 = SizedBox(height: 50.h);
  static SizedBox boxHeight60 = SizedBox(height: 60.h);
  static SizedBox boxHeight80 = SizedBox(height: 80.h);
  static SizedBox boxHeight90 = SizedBox(height: 90.h);
  static SizedBox boxHeight134 = SizedBox(height: 134.h);
  static SizedBox boxHeight136 = SizedBox(height: 136.h);
  static SizedBox boxHeight137 = SizedBox(height: 137.h);
  static SizedBox boxHeight150 = SizedBox(height: 150.h);
  static SizedBox boxHeight120 = SizedBox(height: 120.h);
  static SizedBox boxHeight125 = SizedBox(height: 125.h);
  static SizedBox boxHeight170 = SizedBox(height: 170.h);
  static SizedBox boxHeight190 = SizedBox(height: 190.h);
  static SizedBox boxHeight100 = SizedBox(height: 100.h);
  static SizedBox boxHeight200 = SizedBox(height: 200.h);
  static SizedBox boxHeight250 = SizedBox(height: 250.h);
  static SizedBox boxHeight255 = SizedBox(height: 255.h);
  static SizedBox boxHeight300 = SizedBox(height: 300.h);
  static SizedBox boxHeight350 = SizedBox(height: 350.h);
  static SizedBox boxHeight370 = SizedBox(height: 370.h);

  static SizedBox box0 = const SizedBox.shrink();
}
