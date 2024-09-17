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

  ///PERMIT TYPE CHECKLIST
  static int kPermitchecklistFeatureId = 41;
  static String kFeaturePermitchecklistName = "Permit Checklist";

  ///PERMIT TYPE CHECKPOINT
  static int kPermitcheckpointFeatureId = 42;
  static String kFeaturePermitcheckpointName = "Permit Checkpoint";

  /// PERMIT ACCESS
  static int kPermitFeatureId = 3;
  static String kFeaturePermitName = "Permit";

  ///WARRANTY CLAIM ACCESS
  static int kWarrantyClaimFeatureId = 30;
  static String kFeatureWarrantyClaimName = "Warranty Claim";

  ///WARRANTY CLAIM ACCESS
  static int kWarrantyClaimcertiFeatureId = 29;
  static String kFeatureWarrantyClaimcertiName = "Warranty Claim Certificate";

  ///INCIDENT REPORT ACCESS
  static int kIncidentReportFeatureId = 34;
  static String kFeatureIncidentReportName = "Incident Report";

  //GOODS ORDER ACCESS
  static int kGoodsFeatureId = 35;
  static String kFeatureGoodsOrderName = "Goods Order";

  /// statury report list
  static int kSatutoryFeatureId = 501;
  static String kFeatureSatutoryName = "Satutory";

  //REQ Order
  static int kReqOrderFeatureId = 36;
  static String kFeatureReqOrderName = "Request Order";

// sm master
  static int kassetmasterFeatureId = 13;
  static String kFeatureassetmasterName = "SM Master";

  //MRS

  static int kMrsFeatureId = 15;
  static String kFeatureMrsName = "SM MRS";

  // return mrs
  static int kreturnMrsFeatureId = 16;
  static String kFeaturereturnMrsName = "SM MRS Return";

  //Pm plan

  static int kPmPlanFeatureId = 38;
  static String kFeaturePmPlanName = "PM Plan";
  //pm task

  static int kPmTaskFeatureId = 39;
  static String kFeaturePmTaskName = "PM Task";
  //pm execution

  static int kPmExecutionFeatureId = 10;
  static String kFeaturePmExecutionName = "PM Execution";

  ///PM CHECKLIST
  static int kPMchecklistFeatureId = 5;
  static String kFeaturePMchecklistName = "PM Checklist Number";

  ///PM CHECKPOINT
  static int kPMcheckpointFeatureId = 6;
  static String kFeaturePMcheckpointName = "PM Check Points";

  /// MODULE CLEANING ACCESS
  static int kModuleCleaningplanFeatureId = 32;
  static String kFeatureModuleCleaningplan = "MC Planning";
  // Module Cleaning execution
  static int kModuleCleaningexeFeatureId = 43;
  static String kFeatureModuleCleaningexe = "MC Execution";

  // Vegetation Control
  static int kVegetationControlFeatureId = 33;
  static String kFeatureVegetationControl = "Vegetation Planning";
  // Vegetation Control execution
  static int kVegetationControlexeFeatureId = 44;
  static String kFeatureVegetationControlexe = "Vegetation Execution";
// plant stock report
  static int kplantstockrepFeatureId = 45;
  static String kFeeatureplantstockrepName = "SM Stock Report";

  /// Grievance ACCESS
  static int kGrievanceFeatureId = 49;
  static String kFeatureGrievanceName = "Grievance";

  /// CALIBRATION ACCESS
  static int kCalibrationFeatureId = 31;
  static String kFeatureCalibrationName = "Calibration";

  /// USER ACCESS
  static int kUserFeatureId = 40;
  static String kFeatureUserName = "User Management";

  /// MASTERS
  static int kMasterFeatureId = 50;
  static String kFeatureMasterName = "Masters";

  //Audit Plan
  static int kAuditPlanFeatureId = 18;
  static String kFeatureAuditPlanName = "Audit Plan";

  //Audit Execution
  static int kAuditExecutionFeatureId = 21;
  static String kFeatureAuditExecutionName = "Audit Execution";

  //hfe Report
  static int kHfeMasterFeatureId = 65;
  static String kFeatureHfeMasterName = "Hfe Master";

  //Statutory
  static int kStatutoryFeatureId = 51;
  static String kFeatureStatutoryName = "Statutory";

  //hfe Report
  static int kObservationFeatureId = 51;
  static String kFeatureObservationName = "Observation";

  //Warranty
  static int kWarrantyFeatureId = 64;
  static String kFeatureWarrantyName = "Warranty";

  ///document manager
  static int kDocumentManagerFeatureId = 62;
  static String kFeatureDocumentManagerName = "Document  Manager";

  //Assets
  static int kAssetsFeatureId = 61;
  static String kFeatureAssetsName = "Assets";

  //General
  static int kGeneralFeatureId = 59;
  static String kFeatureGeneralName = "General";

  //Business
  static int kBusinessFeatureId = 56;
  static String kFeatureBusinessName = "Business";

  //Facility
  static int kFacilityFeatureId = 55;
  static String kFeatureFacilityName = "Facility";
  //DashBoard
  static int kDashboardFeatureId = 1;
  static String kFeatureDashBoardName = "DashBoard";

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
