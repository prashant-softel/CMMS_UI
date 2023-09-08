import 'dart:convert';

List<PmPlanListModel> MrsModelFromJson(String str) =>
    List<PmPlanListModel>.from(
        json.decode(str).map((x) => PmPlanListModel.fromJson(x)));

class PmPlanListModel {
  int? plan_id;
  String? plan_name;
  int? status_id;
  String? status_name;
  String? plan_date;
  int? facility_id;
  String? facility_name;
  int? category_id;
  String? category_name;
  int? plan_freq_id;
  String? plan_freq_name;
  int? created_by_id;
  String? created_by_name;
  String? created_at;
  int? updated_by_id;
  String? updated_by_name;
  String? updated_at;

  PmPlanListModel(
      {this.category_id,
      this.category_name,
      this.created_at,
      this.created_by_id,
      this.created_by_name,
      this.facility_id,
      this.facility_name,
      this.plan_date,
      this.plan_freq_id,
      this.plan_freq_name,
      this.plan_id,
      this.plan_name,
      this.status_id,
      this.status_name,
      this.updated_at,
      this.updated_by_id,
      this.updated_by_name});

  factory PmPlanListModel.fromJson(Map<String, dynamic> parsedJson) {
    return PmPlanListModel(
      category_id: parsedJson['category_id'],
      category_name: parsedJson['category_name'],
      created_at: parsedJson['created_at'],
      created_by_id: parsedJson['created_by_id'],
      created_by_name: parsedJson['created_by_name'],
      facility_id: parsedJson['facility_id'],
      facility_name: parsedJson['facility_name'],
      plan_date: parsedJson['plan_date'],
      plan_freq_id: parsedJson['plan_freq_id'],
      plan_freq_name: parsedJson['plan_freq_name'],
      plan_id: parsedJson['plan_id'],
      plan_name: parsedJson['plan_name'],
      status_id: parsedJson['status_id'],
      status_name: parsedJson['status_name'],
      updated_at: parsedJson['updated_at'],
      updated_by_id: parsedJson['updated_by_id'],
      updated_by_name: parsedJson['updated_by_name'],
    );
  }
  Map<String, dynamic> toJson() => {
        "category_id": category_id,
        "category_name": category_name,
        "created_at": created_at,
        "created_by_id": created_by_id,
        "created_by_name": created_by_name,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "plan_date": plan_date,
        "plan_freq_id": plan_freq_id,
        "plan_freq_name": plan_freq_name,
        "plan_id": plan_id,
        "plan_name": plan_name,
        "status_id": status_id,
        "status_name": status_name,
        "updated_at": updated_at,
        "updated_by_id": updated_by_id,
        "updated_by_name": updated_by_name,
      };
}
