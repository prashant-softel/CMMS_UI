import 'dart:convert';

import 'package:cmms/app/utils/utility.dart';

List<WcCertificatesListModel> wcCertificatesListModelFromJson(String str) =>
    List<WcCertificatesListModel>.from(
        json.decode(str).map(WcCertificatesListModel.fromJson));
String wcCertificatesListModelToJson(List<WcCertificatesListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WcCertificatesListModel {
  int? id;

  WcCertificatesListModel({
    this.id,
  });

  // Factory method to create a WcCertificatesListModel instance from JSON
  factory WcCertificatesListModel.fromJson(Map<String, dynamic> json) {
    return WcCertificatesListModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    return data;
  }
}
