// To parse this JSON data, do
//
//     final inventoryCategoryModel = inventoryCategoryModelFromJson(jsonString);

import 'dart:convert';

List<CalibrationCertificateModel> WarrantyCertificateModelFromJson(String str) =>
    List<CalibrationCertificateModel>.from(
        json.decode(str).map((x) => CalibrationCertificateModel.fromJson(x)));

String WarrantyCertificateModelToJson(List<CalibrationCertificateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalibrationCertificateModel {
  CalibrationCertificateModel({
     this.id,
     this.categoryId,
    this.name,
    this.vendorName,
    this.calibrationFreqType,
    this.categoryName,
    this.frequeuncyId,
    this.warrantyTypeName,
    this.frequencyName,
    this.description,
    this.calibrationFrequency,
    this.calibrationReminderDays,
    this.calibrationLastDate,
    this.calibrationDueDate,
    this.calibrationStatus,

  });

  int? id;
  String? name;
  int? categoryId;
  String? categoryName;
  int? vendorId;
  String? vendorName;
  String? calibrationFreqType;
  String? warrantyTypeName;
  int? frequeuncyId;
  String? frequencyName;
  String? description;
  int? calibrationFrequency;
  int? calibrationReminderDays;
  String? calibrationLastDate;
  String? calibrationDueDate;
  int? calibrationStatus;

  factory CalibrationCertificateModel.fromJson(Map<String, dynamic> json) =>
      CalibrationCertificateModel(
        id: json["id"],
        categoryId: json["categoryId"],
        name: json["name"],
        vendorName: json["vendorName"],
        calibrationFreqType: json["calibrationFreqType"],
        categoryName: json["categoryName"],
        frequeuncyId: json["frequeuncyId"],
        warrantyTypeName: json["warrantyTypeName"],
        frequencyName: json["frequencyName"],
        calibrationFrequency: json["calibrationFrequency"],
        calibrationReminderDays: json["calibrationReminderDays"],
        calibrationLastDate: json["calibrationLastDate"],
        calibrationDueDate: json["calibrationDueDate"],
        calibrationStatus: json["calibrationStatus"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryId": categoryId,
    "name": name,
    "vendorName": vendorName,
    "calibrationFreqType": calibrationFreqType,
    "categoryName": categoryName,
    "frequeuncyId": frequeuncyId,
    "warrantyTypeName": warrantyTypeName,
    "frequencyName": frequencyName,
    "calibrationFrequency": calibrationFrequency,
    "calibrationReminderDays": calibrationReminderDays,
    "calibrationLastDate": calibrationLastDate,
    "calibrationDueDate": calibrationDueDate,
    "calibrationStatus": calibrationStatus,
      };
}
