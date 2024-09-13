import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<WcCertificatesListModel> wcCertificatesListModelFromJson(String str) =>
    List<WcCertificatesListModel>.from(
        json.decode(str).map(WcCertificatesListModel.fromJson));
String wcCertificatesListModelToJson(List<WcCertificatesListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WcCertificatesListModel {
  int? facilityId;
  String? facilityName;
  int? assetId;
  int? categoryId;
  String? assetName;
  int? warrantyTypeId;
  int? warrantyProvider;
  String? categoryName;
  String? warrantyDescription;
  String? warrantyTypeName;
  int? warrantyTermId;
  String? warrantyTermName;
  String? certificateNumber;
  String? warrantyCertificateFilePath;
  String? warrantyStartDate;
  String? warrantyExpiryDate;
  int? warrantyProviderId;
  String? warrantyProviderName;
  String? warrantyTermType;

  WcCertificatesListModel({
    this.facilityId,
    this.facilityName,
    this.assetId,
    this.categoryId,
    this.assetName,
    this.warrantyTypeId,
    this.warrantyProvider,
    this.categoryName,
    this.warrantyDescription,
    this.warrantyTypeName,
    this.warrantyTermId,
    this.warrantyTermName,
    this.certificateNumber,
    this.warrantyCertificateFilePath,
    this.warrantyStartDate,
    this.warrantyExpiryDate,
    this.warrantyProviderId,
    this.warrantyProviderName,
    this.warrantyTermType,
  });

  // Factory method to create a WcCertificatesListModel instance from JSON
  factory WcCertificatesListModel.fromJson(Map<String, dynamic> json) {
    return WcCertificatesListModel(
      facilityId: json['facility_id'],
      facilityName: json['facility_name'],
      assetId: json['asset_id'],
      categoryId: json['categoryId'],
      assetName: json['asset_name'],
      warrantyTypeId: json['warrantyTypeId'],
      warrantyProvider: json['warranty_provider'],
      categoryName: json['categoryName'],
      warrantyDescription: json['warranty_description'],
      warrantyTypeName: json['warrantyTypeName'],
      warrantyTermId: json['warrantyTermId'],
      warrantyTermName: json['warrantyTermName'],
      certificateNumber: json['certificate_number'],
      warrantyCertificateFilePath: json['warranty_certificate_file_path'],
      warrantyStartDate:
          Utility.getFormatedyearMonthDay(json['warrantyStartDate']),
      warrantyExpiryDate:
          Utility.getFormatedyearMonthDay(json['warrantyExpiryDate']),
      warrantyProviderId: json['warrantyProviderId'],
      warrantyProviderName: json['warrantyProviderName'],
      warrantyTermType: json['warranty_term_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['facility_id'] = this.facilityId;
    data['facility_name'] = this.facilityName;
    data['asset_id'] = this.assetId;
    data['categoryId'] = this.categoryId;
    data['asset_name'] = this.assetName;
    data['warrantyTypeId'] = this.warrantyTypeId;
    data['warranty_provider'] = this.warrantyProvider;
    data['categoryName'] = this.categoryName;
    data['warranty_description'] = this.warrantyDescription;
    data['warrantyTypeName'] = this.warrantyTypeName;
    data['warrantyTermId'] = this.warrantyTermId;
    data['warrantyTermName'] = this.warrantyTermName;
    data['certificate_number'] = this.certificateNumber;
    data['warranty_certificate_file_path'] = this.warrantyCertificateFilePath;
    data['warrantyStartDate'] = this.warrantyStartDate;
    data['warrantyExpiryDate'] = this.warrantyExpiryDate;
    data['warrantyProviderId'] = this.warrantyProviderId;
    data['warrantyProviderName'] = this.warrantyProviderName;
    data['warranty_term_type'] = this.warrantyTermType;

    return data;
  }
}
