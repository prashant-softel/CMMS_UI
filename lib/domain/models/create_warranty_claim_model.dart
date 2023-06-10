import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

CreateWarrantyClaimModel createWarrantyClaimModelFromJson(String str) =>
    CreateWarrantyClaimModel.fromJson(json.decode(str));

String createWarrantyClaimModelToJson(CreateWarrantyClaimModel data) =>
    json.encode(data.toJson());

class CreateWarrantyClaimModel {
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

  CreateWarrantyClaimModel({
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
  });

  factory CreateWarrantyClaimModel.fromJson(Map<String, dynamic> json) =>
      CreateWarrantyClaimModel(
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
      );

  Map<String, dynamic> toJson() => {
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
      };
}
