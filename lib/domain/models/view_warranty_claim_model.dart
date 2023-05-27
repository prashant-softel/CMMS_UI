// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

ViewWarrantyClaimModel viewWarrantyClaimDetailModelFromJson(String str) =>
    ViewWarrantyClaimModel.fromJson(json.decode(str));

String viewWarrantyClaimDetailModelToJson(ViewWarrantyClaimModel data) => json.encode(data.toJson());


class ViewWarrantyClaimModel {
  ViewWarrantyClaimModel({
    this.wc_id,
    this.facility_id,
    this.facility_name,
    this.site_wc_number,
    this.warranty_claim_title,
    this.date_of_claim,
    this.equipment_category,
    this.equipment_name,
    this.equipment_sr_no,
    this.supplier_name,
    this.good_order_id,
    this.order_reference_number,
    this.warranty_description,
    this.affected_part,
    this.affected_sr_no,
    this.failure_time,
    this.estimated_cost,
    this.quantity,
    this.cost_of_replacement,
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

  });

  int? wc_id;
  int? facility_id;
  String? facility_name;
  int? site_wc_number;
  String? warranty_claim_title;
  DateTime? date_of_claim;
  String? equipment_category;
  String? equipment_name;
  String? equipment_sr_no;
  String? supplier_name;
  String? good_order_id;
  String? order_reference_number;
  String? warranty_description;
  String? affected_part;
  String? affected_sr_no;
  DateTime? failure_time;
  int? estimated_cost;
  int? quantity;
  String? cost_of_replacement;
  String? currency;
  String? corrective_action_by_buyer;
  String? request_to_supplier;
  int? created_by;
  int? approved_by;
  String? approver_name;
  String? last_updated_at;
  String? closed_at;
  String? status;
  String? log;

  factory ViewWarrantyClaimModel.fromJson(Map<String, dynamic> json) => ViewWarrantyClaimModel(
        wc_id: json["wc_id"],
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
        site_wc_number: json['site_wc_number'],
        warranty_claim_title: json["warranty_claim_title"],
        date_of_claim: json['date_of_claim'] == null
            ? null
            : DateTime.parse(json['date_of_claim'] as String),
        equipment_category: json["equipment_category"],
        equipment_name: json["equipment_name"],
        equipment_sr_no: json["equipment_sr_no"],
        supplier_name: json["supplier_name"],
        good_order_id: json["good_order_id"],
        order_reference_number: json["order_reference_number"],
        warranty_description: json["warranty_description"],
        affected_part: json['affected_part'],
        affected_sr_no: json['affected_sr_no'],
        failure_time: json['failure_time'] == null
            ? null
            : DateTime.parse(json['failure_time'] as String),
        estimated_cost: json["estimated_cost"],
        quantity: json["quantity"],
        cost_of_replacement: json['cost_of_replacement'],
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
        
      );

  Map<String, dynamic> toJson() => {
        "wc_id": wc_id,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "site_wc_number": site_wc_number,
        "warranty_claim_title": warranty_claim_title,
        "date_of_claim": date_of_claim?.toIso8601String(),
        "equipment_category": equipment_category,
        "equipment_name": equipment_name,
        "equipment_sr_no": equipment_sr_no,
        "supplier_name": supplier_name,
        "good_order_id": good_order_id,
        "order_reference_number": order_reference_number,
        "warranty_description": warranty_description,
        "affected_part": affected_part,
        "affected_sr_no": affected_sr_no,
        "failure_time": failure_time?.toIso8601String(),
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
        "status": status,
        "log": log,

      };
}
