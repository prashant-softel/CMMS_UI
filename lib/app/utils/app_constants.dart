import 'package:cmms/domain/domain.dart';

/// An asset constant class which will hold all the
/// assets path which are used in the application.
/// Will be ignored for test since all are static values and would not change.

// coverage:ignore-file
abstract class AppConstants {
  static String isUserLoggedIn = 'isUserLoggedIn';
  static String userIdLocal = 'userIdLocal';
  static String userEmailLocal = 'userEmailLocal';
  static String userCookieSession = 'userCookieSession';
  static String userFNameLocal = 'userFNameLocal';
  static String userLNameLocal = 'userLNameLocal';
  static String userGenderLocal = 'userGenderLocal';
  static String mixPannelId = appFlavor == AppFlavor.PROD
      ? '9937d9981e7c0dada35cdadeebb1c337'
      : 'effe55d665fe14e98b787e303715ec5c';
  static String appStoreId = '1632440837';
  static String androidPackageName = 'com.cmms';
}

AppFlavor? appFlavor;
