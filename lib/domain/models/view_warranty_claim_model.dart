// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

ViewWarrantyClaimModel viewWarrantyClaimDetailModelFromJson(String str) =>
    ViewWarrantyClaimModel.fromJson(json.decode(str));

String viewWarrantyClaimDetailModelToJson(ViewWarrantyClaimModel data) =>
    json.encode(data.toJson());

class ViewWarrantyClaimModel {
  ViewWarrantyClaimModel({
    this.wc_id,
    this.facility_id,
    this.facility_name,
    this.site_wc_number,
    this.warranty_claim_title,
    this.date_of_claim,
    this.equipment_category_id,
    this.equipment_category,
    this.equipment_id,
    this.equipment_name,
    this.equipment_sr_no,
    this.supplier_id,
    this.severity,
    this.supplier_name,
    this.good_order_id,
    this.order_reference_number,
    this.warranty_description,
    this.affected_sr_no,
    this.manufacture_name,
    this.failure_time,
    this.estimated_cost,
    this.quantity,
    this.cost_of_replacement,
    this.approxdailyloss,
    this.currencyId,
    this.currency,
    this.corrective_action_by_buyer,
    this.request_to_supplier,
    this.created_by,
    this.approved_by,
    this.approver_name,
    this.last_updated_at,
    this.closed_at,
    this.status,
    this.log,
    this.status_short,
    this.status_long,
    this.wstart_date,
    this.wend_date,
    this.additionalEmailEmployees,
    this.externalEmails,
    this.supplierActions,
    this.affectedPartsImages,
    this.images,
    this.approverId,
    this.affectedParts,
  });

  int? wc_id;
  int? facility_id;
  String? facility_name;
  int? site_wc_number;
  String? warranty_claim_title;
  String? date_of_claim;
  int? equipment_category_id;
  String? equipment_category;
  int? equipment_id;
  String? equipment_name;
  String? equipment_sr_no;
  int? supplier_id;
  String? severity;
  String? supplier_name;
  String? good_order_id;
  String? order_reference_number;
  String? warranty_description;
  String? affected_sr_no;
  String? manufacture_name;
  String? failure_time;
  int? estimated_cost;
  int? quantity;
  String? cost_of_replacement;
  int? approxdailyloss;
  int? currencyId;
  String? currency;
  String? corrective_action_by_buyer;
  String? request_to_supplier;
  int? created_by;
  int? approved_by;
  String? approver_name;
  String? last_updated_at;
  String? closed_at;
  int? status;
  String? log;
  String? status_short;
  String? status_long;
  String? wstart_date;
  String? wend_date;
  List<AdditionalEmailsEmployeesList?>? additionalEmailEmployees;
  List<ExternalsEmailsList?>? externalEmails;
  List<SuppliersActionsList?>? supplierActions;
  List<AffectedPartImages?>? affectedPartsImages;
  List<AffectedPartImages?>? images;

  int? approverId;
  List<AffectedParts?>? affectedParts;

  factory ViewWarrantyClaimModel.fromJson(Map<String, dynamic> json) =>
      ViewWarrantyClaimModel(
        wc_id: json["wc_id"],
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
        site_wc_number: json['site_wc_number'],
        warranty_claim_title: json["warranty_claim_title"],
        date_of_claim: json["date_of_claim"] != null
            ? Utility.getFormatedyearMonthDay(json["date_of_claim"])
            : null,
        equipment_category_id: json["equipment_category_id"],
        equipment_category: json["equipment_category"],
        equipment_id: json['equipment_id'],
        equipment_name: json["equipment_name"],
        equipment_sr_no: json["equipment_sr_no"],
        supplier_id: json['supplier_id'],
        severity: json["severity"],
        supplier_name: json["supplier_name"],
        good_order_id: json["good_order_id"],
        order_reference_number: json["order_reference_number"],
        warranty_description: json["warranty_description"],
        affected_sr_no: json['affected_sr_no'],
        manufacture_name: json['manufacture_name'],
        failure_time: json['failure_time'] == null
            ? null
            : Utility.getFormattedYearMonthDayTime(json['failure_time']),
        estimated_cost: json["estimated_cost"],
        quantity: json["quantity"],
        cost_of_replacement: json['cost_of_replacement'],
        approxdailyloss: json["approxdailyloss"],
        currencyId: json['currencyId'],
        currency: json['currency'],
        corrective_action_by_buyer: json['corrective_action_by_buyer'],
        request_to_supplier: json['request_to_supplier'],
        created_by: json['created_by'],
        approved_by: json['approved_by'],
        approver_name: json['approver_name'],
        last_updated_at: json['last_updated_at'] ?? '',
        closed_at: json['closed_at'] ?? '',
        status: json["status"],
        log: json['log'] ?? '',
        status_short: json['status_short'] ?? '',
        status_long: json['status_long'] ?? '',
        wstart_date: json['warrantyStartDate'] == null
            ? null
            : Utility.getFormatedyearMonthDay(json['warrantyStartDate']),
        wend_date: json['warrantyEndDate'] == null
            ? null
            : Utility.getFormatedyearMonthDay(json['warrantyEndDate']),
        additionalEmailEmployees: json["additionalEmailEmployees"] != null
            ? List<AdditionalEmailsEmployeesList>.from(
                json["additionalEmailEmployees"]
                    .map((x) => AdditionalEmailsEmployeesList.fromJson(x)))
            : [],
        externalEmails: json["externalEmails"] != null
            ? List<ExternalsEmailsList>.from(json["externalEmails"]
                ?.map((x) => ExternalsEmailsList.fromJson(x)))
            : [],
        supplierActions: json["supplierActions"] != null
            ? List<SuppliersActionsList>.from(json["supplierActions"]
                ?.map((x) => SuppliersActionsList.fromJson(x)))
            : [],
        affectedPartsImages: json["affectedPartsImages"] != null
            ? List<AffectedPartImages>.from(json["affectedPartsImages"]
                ?.map((x) => AffectedPartImages.fromJson(x)))
            : [],
        images: json["images"] != null
            ? List<AffectedPartImages>.from(
                json["images"]?.map((x) => AffectedPartImages.fromJson(x)))
            : [],
        affectedParts: json["affectedParts"] != null
            ? List<AffectedParts>.from(
                json["affectedParts"]?.map((x) => AffectedParts.fromJson(x)))
            : [],
        approverId: json['approverId'],
      );

  Map<String, dynamic> toJson() => {
        "wc_id": wc_id,
        "approxdailyloss": approxdailyloss,
        "severity": severity,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "site_wc_number": site_wc_number,
        "warranty_claim_title": warranty_claim_title,
        "warrantyStartDate": wstart_date,
        "warrantyEndDate": wend_date,
        "equipment_category": equipment_category,
        "equipment_name": equipment_name,
        "equipment_sr_no": equipment_sr_no,
        "supplier_name": supplier_name,
        "good_order_id": good_order_id,
        "order_reference_number": order_reference_number,
        "warranty_description": warranty_description,

        "affected_sr_no": affected_sr_no,
        "manufacture_name": manufacture_name,
        "failure_time": failure_time,
        "estimated_cost": estimated_cost,
        "quantity": quantity,
        "cost_of_replacement": cost_of_replacement,
        "currency": currency,
        "corrective_action_by_buyer": corrective_action_by_buyer,
        "request_to_supplier": request_to_supplier,
        "created_by": created_by,
        "approved_by": approved_by,
        "approver_name": approver_name,
        "last_updated_at": last_updated_at,
        "closed_at": closed_at,
        // "affectedParts": List<dynamic>.from(affectedParts!.map((x) => x)),
        "status": status,
        "log": log,
        "equipment_id": equipment_id,
        "currencyId": currencyId,
        // "approverId": approverId,
        "additionalEmailEmployees":
            List<dynamic>.from(additionalEmailEmployees!.map((x) => x)),
        "externalEmails": List<dynamic>.from(externalEmails!.map((x) => x)),
        "supplierActions": List<dynamic>.from(supplierActions!.map((x) => x)),
      };
}

class ExternalsEmailsList {
  ExternalsEmailsList({
    this.name,
    this.email,
    this.role,
    this.mobile,
  });

  String? name;
  String? email;
  String? role;
  int? mobile;

  factory ExternalsEmailsList.fromJson(Map<String, dynamic> json) =>
      ExternalsEmailsList(
        name: json["name"],
        email: json["email"],
        role: json["role"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "role": role,
        "mobile": mobile,
      };
}

class AdditionalEmailsEmployeesList {
  AdditionalEmailsEmployeesList({
    this.name,
    this.email,
    this.user_id,
  });
  int? user_id;
  String? name;
  String? email;

  factory AdditionalEmailsEmployeesList.fromJson(Map<String, dynamic> json) =>
      AdditionalEmailsEmployeesList(
        user_id: json['user_id'],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "name": name,
        "email": email,
      };
}

class AffectedParts {
  AffectedParts({
    this.name,
  });

  String? name;

  factory AffectedParts.fromJson(Map<String, dynamic> json) => AffectedParts(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class SuppliersActionsList {
  SuppliersActionsList({
    this.srNumber,
    this.name,
    this.is_required,
    this.required_by_date,
  });

  String? srNumber;
  String? name;
  int? is_required;
  String? required_by_date;

  factory SuppliersActionsList.fromJson(Map<String, dynamic> json) =>
      SuppliersActionsList(
        srNumber: json["srNumber"],
        name: json["name"],
        is_required: json["is_required"],
        required_by_date: json["required_by_date"],
      );

  Map<String, dynamic> toJson() => {
        "srNumber": srNumber,
        "name": name,
        "is_required": is_required,
        "required_by_date": required_by_date,
      };
}

class AffectedPartImages {
  int? file_id;
  String? description;
  String? fileName;

  AffectedPartImages({this.file_id, this.description, this.fileName});
  factory AffectedPartImages.fromJson(Map<String, dynamic> json) =>
      AffectedPartImages(
        file_id: json["file_id"],
        description: json["description"],
        fileName: json["fileName"],
      );
}

String addExternalsEmailsListToJson(ExternalsEmailsList data) =>
    json.encode(data.toJson());
String additionalEmailEmployeesListToJson(AdditionalEmailsEmployeesList data) =>
    json.encode(data.toJson());
String addSuppliersActionsListToJson(SuppliersActionsList data) =>
    json.encode(data.toJson());
