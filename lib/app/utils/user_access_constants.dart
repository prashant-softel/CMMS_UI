import 'package:cmms/domain/domain.dart';

/// An asset constant class which will hold all the
/// assets path which are used in the application.
/// Will be ignored for test since all are static values and would not change.

// coverage:ignore-file
abstract class UserAccessConstants {
  /// JOB ACCESS
  static int kJobFeatureId = 2;
  static String kFeatureJobName = "Job";

  ///JOB CARD ACCESS
  static int kJobCardFeatureId = 4;
  static String kFeatureJobCardName = "Job Card";

  /// PERMIT ACCESS
  static int kPermitFeatureId = 3;
  static String kFeaturePermitName = "Permit";

  ///WARRANTY CLAIM ACCESS
  static int kWarrantyClaimFeatureId = 30;
  static String kFeatureWarrantyClaimName = "Warranty Claim";

  ///INCIDENT REPORT ACCESS
  static int kIncidentReportFeatureId = 34;
  static String kFeatureIncidentReportName = "Incident Report";

  ///MODULE CLEANING ACCESS
  static int kModuleCleaningExecutionFeatureId = 32;
  static String kFeatureModuleCleaningExecutionName = "Module Cleaning";

  //GOODS ORDER ACCESS
  static int kGoodsFeatureId = 35;
  static String kFeatureGoodsOrderName = "Goods Order";

  ///USER ACCESS
  static int kHaveAddAccess = 1;
  static int kNotHaveAddAccess = 0;

  static int kHaveViewAccess = 1;
  static int kNotHaveViewAccess = 0;

  static int kHaveEditAccess = 1;
  static int kNotHaveEditAccess = 0;

  static int kHaveDeleteAccess = 1;
  static int kNotHaveDeleteAccess = 0;

  static int kHaveIssueAccess = 1;
  static int kNotHaveIssueAccess = 0;

  static int kHaveApproveAccess = 1;
  static int kNotHaveApproveAccess = 0;

  static int kHaveSelfViewAccess = 1;
  static int kNotHaveSelfViewAccess = 0;
}

AppFlavor? appFlavor;
