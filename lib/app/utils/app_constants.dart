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
  static String mixPannelId = appFlavor == AppFlavor.PROD ? '' : '';
  static String appStoreId = '';
  static String androidPackageName = 'com.cmms';
  static String kJobStatusCreated = "CREATED";
  static String kJobStatusAssigned = "ASSIGNED";
  static String kJobStatusLinkedToPermit = "LINKED TO PERMIT";
  static String kJobStatusInProgress = "IN PROGRESS";
  static String kJobStatusCaryForward = "CARRY FORWARD";
  static String kJobStatusClosed = "CLOSED";
  static String kJobStatusCancelled = "CANCELLED";
  static String kJobStatusDeleted = "DELETED";
}

AppFlavor? appFlavor;
