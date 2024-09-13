// To parse this JSON data, do
//
//     final inventoryCategoryModel = inventoryCategoryModelFromJson(jsonString);

import 'dart:convert';

List<WarrantyCertificateModel> WarrantyCertificateModelFromJson(String str) =>
    List<WarrantyCertificateModel>.from(
        json.decode(str).map((x) => WarrantyCertificateModel.fromJson(x)));

String wcCertificateModelToJson(List<WarrantyCertificateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WarrantyCertificateModel {
  WarrantyCertificateModel({
    this.asset_id,
    this.categoryId,
    this.asset_name,
    this.warrantyTypeId,
    this.warranty_provider,
    this.categoryName,
    this.warranty_description,
    this.warrantyTypeName,
    this.warrantyTermId,
    this.warrantyTermName,
    this.certificate_number,
    this.warranty_certificate_file_path,
    this.warrantyStartDate,
    this.warrantyExpiryDate,
    this.warrantyProviderId,
    this.warrantyProviderName,
    this.warranty_term_type,
  });

  int? asset_id;
  int? categoryId;
  String? asset_name;
  int? warrantyTypeId;
  int? warranty_provider;
  String? categoryName;
  String? warranty_description;
  String? warrantyTypeName;
  int? warrantyTermId;
  String? warrantyTermName;
  String? certificate_number;
  String? warranty_certificate_file_path;
  String? warrantyStartDate;
  String? warrantyExpiryDate;
  int? warrantyProviderId;
  String? warrantyProviderName;
  String? warranty_term_type;

  factory WarrantyCertificateModel.fromJson(Map<String, dynamic> json) =>
      WarrantyCertificateModel(
        asset_id: json["asset_id"],
        categoryId: json["categoryId"],
        asset_name: json["asset_name"],
        warrantyTypeId: json["warrantyTypeId"],
        warranty_provider: json["warranty_provider"],
        categoryName: json["categoryName"],
        warranty_description: json["warranty_description"],
        warrantyTypeName: json["warrantyTypeName"],
        warrantyTermId: json["warrantyTermId"],
        certificate_number: json["certificate_number"],
        warranty_certificate_file_path: json["warranty_certificate_file_path"],
        warrantyStartDate: json["warrantyStartDate"],
        warrantyExpiryDate: json["warrantyExpiryDate"],
        warrantyProviderId: json["warrantyProviderId"],
        warrantyProviderName: json["warrantyProviderName"],
        warranty_term_type: json["warranty_term_type"],
      );

  Map<String, dynamic> toJson() => {
        "asset_id": asset_id,
        "categoryId": categoryId,
        "asset_name": asset_name,
        "warrantyTypeId": warrantyTypeId,
        "warranty_provider": warranty_provider,
        "categoryName": categoryName,
        "warranty_description": warranty_description,
        "warrantyTypeName": warrantyTypeName,
        "warrantyTermId": warrantyTermId,
        "certificate_number": certificate_number,
        "warranty_certificate_file_path": warranty_certificate_file_path,
        "warrantyStartDate": warrantyStartDate,
        "warrantyExpiryDate": warrantyExpiryDate,
        "warrantyProviderId": warrantyProviderId,
        "warrantyProviderName": warrantyProviderName,
        "warranty_term_type": warranty_term_type,
      };
}
