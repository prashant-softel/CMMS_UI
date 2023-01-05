// To parse this JSON data, do
//
//     final zipCodeResponse = zipCodeResponseFromJson(jsonString);

import 'dart:convert';

ZipCodeResponse zipCodeResponseFromJson(String str) =>
    ZipCodeResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String zipCodeResponseToJson(ZipCodeResponse data) =>
    json.encode(data.toJson());

class ZipCodeResponse {
  ZipCodeResponse({
    this.message,
    this.status,
    this.postOffice,
  });

  factory ZipCodeResponse.fromJson(Map<String, dynamic> json) =>
      ZipCodeResponse(
        message: json['Message'] == null ? null : json['Message'] as String,
        status: json['Status'] == null ? null : json['Status'] as String,
        postOffice: json['PostOffice'] == null
            ? null
            : List<PostOffice>.from((json['PostOffice'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    PostOffice.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  String? status;
  List<PostOffice>? postOffice;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Message': message == null ? null : message,
        'Status': status == null ? null : status,
        'PostOffice': postOffice == null
            ? null
            : List<dynamic>.from(postOffice!.map<dynamic>((x) => x.toJson())),
      };
}

class PostOffice {
  PostOffice({
    this.name,
    this.description,
    this.branchType,
    this.deliveryStatus,
    this.taluk,
    this.circle,
    this.district,
    this.division,
    this.region,
    this.state,
    this.country,
  });


  factory PostOffice.fromJson(Map<String, dynamic> json) => PostOffice(
        name: json['Name'] == null ? null : json['Name'] as String,
        description:
            json['Description'] == null ? null : json['Description'] as String,
        branchType: json['BranchType'] as String? ?? '',
        deliveryStatus: json['DeliveryStatus'] as String? ?? '',
        taluk: json['Taluk'] as String? ?? '',
        circle: json['Circle'] as String? ?? '',
        district: json['District'] as String? ?? '',
        division: json['Division'] as String? ?? '',
        region: json['Region'] as String? ?? '',
        state: json['State'] as String? ?? '',
        country: json['Country'] as String? ?? '',
      );

  String? name;
  String? description;
  String? branchType;
  String? deliveryStatus;
  String? taluk;
  String? circle;
  String? district;
  String? division;
  String? region;
  String? state;
  String? country;


  Map<String, dynamic> toJson() => <String, dynamic>{
        'Name': name == null ? null : name,
        'Description': description,
        'BranchType': branchType,
        'DeliveryStatus': deliveryStatus,
        'Taluk': taluk,
        'Circle': circle,
        'District': district,
        'Division': division,
        'Region': region,
        'State': state,
        'Country': country,
      };
}
