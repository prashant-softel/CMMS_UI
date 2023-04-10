// To parse this JSON data, do
//
//     final inventoryModel = inventoryModelFromJson(jsonString);

import 'dart:convert';

List<WarrantyClaimModel> warrantyClaimModelFromJson(String str) =>
    List<WarrantyClaimModel>.from(
        json.decode(str).map((x) => WarrantyClaimModel.fromJson(x)));

String warrantyClaimModelToJson(List<WarrantyClaimModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WarrantyClaimModel {
  WarrantyClaimModel({
    this.wc_id,
    this.facility_id,
    this.facility_name,
    this.warranty_claim_title,
    this.date_of_claim,
    this.equipment_category,
    this.equipment_name,
    this.equipment_sr_no,
    this.supplier_name,
    this.good_order_id,
    this.order_reference_number,
    this.warranty_description,
    this.estimated_cost,
    this.quantity,
    this.status,

  });

  int? wc_id;
  int? facility_id;
  String? facility_name;
  String? warranty_claim_title;
  DateTime? date_of_claim;
  String? equipment_category;
  String? equipment_name;
  String? equipment_sr_no;
  String? supplier_name;
  String? good_order_id;
  String? order_reference_number;
  String? warranty_description;
  int? estimated_cost;
  int? quantity;
  String? status;

  factory WarrantyClaimModel.fromJson(Map<String, dynamic> json) => WarrantyClaimModel(
        wc_id: json["wc_id"],
        facility_id: json["facility_id"],
        facility_name: json["facility_name"],
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
        estimated_cost: json["estimated_cost"],
        quantity: json["quantity"],
        status: json["status"],
        
      );

  Map<String, dynamic> toJson() => {
        "wc_id": wc_id,
        "facility_id": facility_id,
        "facility_name": facility_name,
        "warranty_claim_title": warranty_claim_title,
        "date_of_claim": date_of_claim?.toIso8601String(),
        "equipment_category": equipment_category,
        "equipment_name": equipment_name,
        "equipment_sr_no": equipment_sr_no,
        "supplier_name": supplier_name,
        "good_order_id": good_order_id,
        "order_reference_number": order_reference_number,
        "warranty_description": warranty_description,
        "estimated_cost": estimated_cost,
        "quantity": quantity,
        "status": status,

      };
}
