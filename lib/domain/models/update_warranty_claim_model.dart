import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

UpdateWarrantyClaimModel updateWarrantyClaimModelFromJson(String str) =>
    UpdateWarrantyClaimModel.fromJson(json.decode(str));

String updateWarrantyClaimModelToJson(UpdateWarrantyClaimModel data) =>
    json.encode(data.toJson());

class UpdateWarrantyClaimModel {
  int? id;
  int? facilityId;
  int? equipmentId;
  int? goodsOrderId;
  String? affectedPart;
  String? orderReference;
  String? affectedSrNo;
  int? costOfReplacement;
  int? currencyId;
  String? requestToSupplier;
  String? warrantyStartAt;
  String? warrantyEndAt;
  String? warrantyClaimTitle;
  String? warrantyDescription;
  String? correctiveActionByBuyer;
  int? approverId;
  String? failureTime;
  List<int?>? additionalEmailEmployees;
  List<ExternalsEmails?>? externalEmails;
  List<SuppliersActions?>? supplierActions;

  UpdateWarrantyClaimModel({
    this.id,
    this.facilityId,
    this.equipmentId,
    this.goodsOrderId,
    this.affectedPart,
    this.orderReference,
    this.affectedSrNo,
    this.costOfReplacement,
    this.currencyId,
    this.requestToSupplier,
    this.warrantyStartAt,
    this.warrantyEndAt,
    this.warrantyClaimTitle,
    this.warrantyDescription,
    this.correctiveActionByBuyer,
    this.approverId,
    this.failureTime,
    this.additionalEmailEmployees,
    this.externalEmails,
    this.supplierActions,
  });

  factory UpdateWarrantyClaimModel.fromJson(Map<String, dynamic> json) =>
      UpdateWarrantyClaimModel(
        id: json['id'],
        facilityId: json["facilityId"],
        equipmentId: json["equipmentId"],
        goodsOrderId: json["goodsOrderId"],
        affectedPart: json['affectedPart'],
        orderReference: json['orderReference'],
        affectedSrNo: json['affectedSrNo'],
        costOfReplacement: json['costOfReplacement'],
        currencyId: json['currencyId'],
        requestToSupplier: json['requestToSupplier'],
        warrantyStartAt: json['warrantyStartAt'],
        warrantyEndAt: json['warrantyEndAt'],
        warrantyClaimTitle: json['warrantyClaimTitle'],
        warrantyDescription: json['warrantyDescription'],
        correctiveActionByBuyer: json['correctiveActionByBuyer'],
        approverId: json['approverId'],
        failureTime: json['failureTime'],
        additionalEmailEmployees:json["additionalEmailEmployees"]!=null?
            List<int>.from(json["additionalEmailEmployees"].map((x) => x)):[],

        externalEmails: json["externalEmails"]!=null? List<ExternalsEmails>.from(
            json["externalEmails"]?.map((x) => ExternalsEmails.fromJson(x))):[],

        supplierActions: json["supplierActions"]!=null? List<SuppliersActions>.from(
            json["supplierActions"]?.map((x) => SuppliersActions.fromJson(x))):[],

        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityId": facilityId,
        "equipmentId": equipmentId,
        "goodsOrderId": goodsOrderId,
        "affectedPart": affectedPart,
        "orderReference": orderReference,
        "affectedSrNo": affectedSrNo,
        "costOfReplacement": costOfReplacement,
        "currencyId": currencyId,
        "requestToSupplier": requestToSupplier,
        "warrantyStartAt": warrantyStartAt,
        "warrantyEndAt": warrantyEndAt,
        "warrantyClaimTitle": warrantyClaimTitle,
        "warrantyDescription": warrantyDescription,
        "correctiveActionByBuyer": correctiveActionByBuyer,
        "approverId": approverId,
        "failureTime": failureTime,
        "additionalEmailEmployees": List<dynamic>.from(additionalEmailEmployees!.map((x) => x)),
        "externalEmails": List<dynamic>.from(externalEmails!.map((x) => x)),
        "supplierActions": List<dynamic>.from(supplierActions!.map((x) => x)),


      };
}

class ExternalsEmails {
  ExternalsEmails({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  factory ExternalsEmails.fromJson(Map<String, dynamic> json) => ExternalsEmails(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}

class SuppliersActions {
  SuppliersActions({
    this.name,
    // this.is_required,
    this.required_by_date,
  });

  String? name;
  // int? is_required;
  String? required_by_date;

  factory SuppliersActions.fromJson(Map<String, dynamic> json) => SuppliersActions(
        name: json["name"],
        // is_required: json["is_required"],
        required_by_date: json["required_by_date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        // "is_required": is_required,
        "required_by_date": required_by_date,
      };
}


String addExternalsEmailsToJson(ExternalsEmails data) => json.encode(data.toJson());
String addSuppliersActionsToJson(SuppliersActions data) => json.encode(data.toJson());



