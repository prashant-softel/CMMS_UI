// coverage:ignore-file

import 'package:cmms/app/navigators/navigators.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class RouteManagement {
  /// Go off all Home Screen
  static void goOffAllHomScreen() {
    Get.offAllNamed<void>(Routes.home);
  }

  /// Go to warranty tab
  static void goToWarrantyScreen() {
    Get.toNamed<void>(Routes.warranty);
  }
}
