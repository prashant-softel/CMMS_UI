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
  static String androidPackageName = 'com.softel.cmms';

  /// JOB STATUSES
  static String kJobStatusCreated = "CREATED";
  static String kJobStatusAssigned = "ASSIGNED";
  static String kJobStatusLinkedToPermit = "LINKED TO PERMIT";
  static String kJobStatusInProgress = "IN PROGRESS";
  static String kJobStatusCaryForward = "CARRY FORWARD";
  static String kJobStatusClosed = "CLOSED";
  static String kJobStatusCancelled = "CANCELLED";
  static String kJobStatusDeleted = "DELETED";

  /// PERMIT STATUSES
  static const String kPermitStatusCreated = "CREATED";
  static const String kPermitStatusRejectedByIssuer = "REJECTED_BY_ISSUER";
  static const String kPermitStatusIssued = "ISSUED";
  static const String kPermitStatusRejectedByApprover = "REJECTED_BY_APPROVER";
  static const String kPermitStatusApproved = "APPROVED";
  static const String kPermitStatusClosed = "CLOSED";
  static const String kPermitStatusCancelledByIssuer = "CANCELLED_BY_ISSUER";
  static const String kPermitStatusCancelledByHSE = "CANCELLED_BY_HSE";
  static const String kPermitStatusCancelledByApprover =
      "CANCELLED_BY_APPROVER";
  static const String kPermitStatusCancelRequested = "CANCEL_REQUESTED";
  static const String kPermitStatusCancelRequestRejected =
      "CANCEL_REQUEST_REJECTED";
  static const String kPermitStatusCancelRequestApproved =
      "PTW_CANCEL_REQUEST_APPROVED";
  static const String kPermitStatusEdit = "EDIT";
  static const String kPermitStatusExtendRequested = "EXTEND_REQUESTED";
  static const String kPermitStatusExtendRequestApproved =
      "EXTEND_REQUEST_APPROVED";
  static const String kPermitStatusExtendRequestRejected =
      "EXTEND_REQUEST_REJECTED";
  static const String kPermitStatusLinkedToJob = "LINKED_TO_JOB";
  static const String kPermitStatusLinkedToPM = "LINKED_TO_PM";
  static const String kPermitStatusLinkedToAudit = "LINKED_TO_AUDIT";
  static const String kPermitStatusLinkedToHOTO = "LINKED_TO_HOTO";
  static const String kPermitStatusExpired = "EXPIRED";
  static const int kVendor = 1;
  static const int kStore = 2;
  static const int kTask = 3;
  static const int kJobCard = 4;
  static const int kEngineer = 5;
  static const int kInventory = 6;
  static const int kScrap = 7;
  static const int kImportChecklist = 1;
  static const int kImportUser = 2;
  static const int kImportMaterial = 3;
  static const int kImportAsset = 4;
  static const int kImportPMPlan = 5;
  static const int kImportMCPlan = 6;
  static const int kImportBussiness = 7;
  static const int kImportDSMReport = 8;
  static const int kPM = 1;
  static const int kHoto = 2;
  static const int kAudit = 3;
  static const int kMis = 4;
  static const int kEvaluation = 5;
}

AppFlavor? appFlavor;
