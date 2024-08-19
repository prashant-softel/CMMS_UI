import 'dart:convert';

List<GrievanceReportModel> grievanceSummaryFromJson(String str) =>
    List<GrievanceReportModel>.from(
        json.decode(str).map((x) => GrievanceReportModel.fromJson(x)));

class GrievanceReportModel {
  final int months;
  final String monthName;
  final int year;
  final int numberOfWorkForceGrievances;
  final int numberOfLocalCommunityGrievances;
  final int workforceCaseResolved;
  final int workforceCasePending;
  final int workforceInspectionOngoing;
  final int localCasesResolved;
  final int localCasesPending;
  final int localCasesInspectionOngoing;
  final int totalNumberOfGrievancesRaised;
  final int totalNumberOfGrievancesResolved;
  final int totalNumberOfGrievancesPending;
  final int resolvedAtL1;
  final int resolvedAtL2;
  final int resolvedAtL3;

  GrievanceReportModel({
    required this.months,
    required this.monthName,
    required this.year,
    required this.numberOfWorkForceGrievances,
    required this.numberOfLocalCommunityGrievances,
    required this.workforceCaseResolved,
    required this.workforceCasePending,
    required this.workforceInspectionOngoing,
    required this.localCasesResolved,
    required this.localCasesPending,
    required this.localCasesInspectionOngoing,
    required this.totalNumberOfGrievancesRaised,
    required this.totalNumberOfGrievancesResolved,
    required this.totalNumberOfGrievancesPending,
    required this.resolvedAtL1,
    required this.resolvedAtL2,
    required this.resolvedAtL3,
  });

  // Convert JSON to GrievanceReport
  factory GrievanceReportModel.fromJson(Map<String, dynamic> json) {
    return GrievanceReportModel(
      months: json['months'],
      monthName: json['month_name'],
      year: json['year'],
      numberOfWorkForceGrievances: json['number_of_work_force_grievances'],
      numberOfLocalCommunityGrievances: json['number_of_local_community_grievances'],
      workforceCaseResolved: json['workforce_case_resolved'],
      workforceCasePending: json['worforce_case_pending'],
      workforceInspectionOngoing: json['worforce_inspection_ongoing'],
      localCasesResolved: json['local_cases_resolved'],
      localCasesPending: json['local_cases_pending'],
      localCasesInspectionOngoing: json['local_cases_inspection_ongoing'],
      totalNumberOfGrievancesRaised: json['total_numer_of_grievances_raised'],
      totalNumberOfGrievancesResolved: json['total_number_of_grievances_resolved'],
      totalNumberOfGrievancesPending: json['total_number_of_grievances_pending'],
      resolvedAtL1: json['resolved_at_l1'],
      resolvedAtL2: json['resolved_at_l2'],
      resolvedAtL3: json['resolved_at_l3'],
    );
  }

  // Convert GrievanceReport to JSON
  Map<String, dynamic> toJson() {
    return {
      'months': months,
      'month_name': monthName,
      'year': year,
      'number_of_work_force_grievances': numberOfWorkForceGrievances,
      'number_of_local_community_grievances': numberOfLocalCommunityGrievances,
      'workforce_case_resolved': workforceCaseResolved,
      'worforce_case_pending': workforceCasePending,
      'worforce_inspection_ongoing': workforceInspectionOngoing,
      'local_cases_resolved': localCasesResolved,
      'local_cases_pending': localCasesPending,
      'local_cases_inspection_ongoing': localCasesInspectionOngoing,
      'total_numer_of_grievances_raised': totalNumberOfGrievancesRaised,
      'total_number_of_grievances_resolved': totalNumberOfGrievancesResolved,
      'total_number_of_grievances_pending': totalNumberOfGrievancesPending,
      'resolved_at_l1': resolvedAtL1,
      'resolved_at_l2': resolvedAtL2,
      'resolved_at_l3': resolvedAtL3,
    };
  }
}
