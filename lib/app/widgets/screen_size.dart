import 'dart:math';

import '../../main.dart';

double? screenHeight;
double? screenWidth;
dynamic shortestSide;

extension ScreenSizeVal on num {
  double get h {
    const height = 926;
    final heightVal = (this / height) * 100;
    final res = heightVal / 100;
    log(res);
    final resData = screenHeight! * res;
    return resData * (shortestSide < 600 ? 1 : 0.9);

    //.convertedSize(navigatorKey.currentContext!);
  }

  double get w {
    const width = 428;
    final widthVal = (this / width) * 100;
    log(widthVal / 100);
    final res = widthVal / 100;

    final resData = screenWidth! * res;
    return resData * (shortestSide < 600 ? 1 : 0.6);
    // (shortestSide < 600 ? 0 : 1.5)
    //.convertedSize(navigatorKey.currentContext!);
  }
}
