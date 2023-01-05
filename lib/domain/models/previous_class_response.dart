// To parse this JSON data, do
//
//     final PreviousClassResponse = PreviousClassResponseFromJson(jsonString);

import 'dart:convert';

PreviousClassResponse previousClassResponseFromJson(String str) =>
    PreviousClassResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String previousClassResponseToJson(PreviousClassResponse data) =>
    json.encode(data.toJson());

class PreviousClassResponse {
  PreviousClassResponse({
    this.message,
    this.data,
  });

  factory PreviousClassResponse.fromJson(Map<String, dynamic> json) =>
      PreviousClassResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<PreviousClassData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        PreviousClassData.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };

  String? message;
  List<PreviousClassData>? data;
}

class PreviousClassData {
  PreviousClassData(
      {this.id,
      this.price,
      this.tutor,
      this.createdTs,
      this.updatedAt,
      this.orderId,
      this.notes,
      this.orderThumbnailUrl,
      this.orderUrl,
      this.subject,
      this.creator});

  factory PreviousClassData.fromJson(Map<String, dynamic> json) =>
      PreviousClassData(
        id: json['_id'] as String? ?? '',
        price: json['price'] == null
            ? null
            : PriceClass.fromJson(json['price'] as Map<String, dynamic>),
        tutor: json['tutor'] == null
            ? null
            : TutorDataClass.fromJson(json['tutor'] as Map<String, dynamic>),
        createdTs: json['createdTs'] as int? ?? 0,
        updatedAt: json['updatedAt'] as int? ?? 0,
        orderId: json['orderId'] as String? ?? '',
        notes: json['notes'],
        orderThumbnailUrl: json['orderThumbnailUrl'],
        orderUrl: json['orderUrl'],
        creator: json['creator'] == null
            ? null
            : Creator.fromJson(json['creator'] as Map<String, dynamic>),
        subject: json['subject'] as String? ?? '',
      );

  String? id;
  PriceClass? price;
  TutorDataClass? tutor;
  int? createdTs;
  int? updatedAt;
  String? orderId;
  dynamic notes;
  dynamic orderThumbnailUrl;
  dynamic orderUrl;
  String? subject;
  Creator? creator;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'price': price!.toJson(),
        'createdTs': createdTs,
        'updatedAt': updatedAt,
        'orderId': orderId,
        'notes': notes,
        'orderThumbnailUrl': orderThumbnailUrl,
        'orderUrl': orderUrl,
        'subject': subject,
      };
}

class Creator {
  Creator({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.profilePic,
    this.avgRating,
    this.creatorId,
    this.totalRating,
    this.defaultCurrency,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json['_id'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        creatorId: json['creatorId'] as String? ?? '',
        avgRating: json['avgRating'] as num? ?? 4.0,
        lastName: json['lastName'] as String? ?? '',
        username: json['username'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        defaultCurrency: json['defaultCurrency'] as String? ?? '',
        totalRating: json['totalRating'] as num? ?? 0,
      );

  String? id;
  String? creatorId;
  num? avgRating;
  String? firstName;
  String? lastName;
  String? username;
  String? profilePic;
  String? defaultCurrency;
  num? totalRating;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id == null ? null : id,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'username': username == null ? null : username,
        'profilePic': profilePic == null ? null : profilePic,
        'totalRating': totalRating == null ? null : totalRating,
        'avgRating': avgRating == null ? null : avgRating,
        'defaultCurrency': defaultCurrency == null ? null : defaultCurrency,
      };
}

class PriceClass {
  factory PriceClass.fromJson(Map<String, dynamic> json) => PriceClass(
        price: json['price'] as num? ?? 0,
        currencyCode: json['currencyCode'] as String? ?? '',
        currencySymbol: json['currencySymbol'] as String? ?? '',
      );

  PriceClass({
    this.price,
    this.currencyCode,
    this.currencySymbol,
  });

  num? price;
  String? currencyCode;
  String? currencySymbol;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'price': price,
        'currencyCode': currencyCode,
        'currencySymbol': currencySymbol,
      };
}

class TutorDataClass {
  factory TutorDataClass.fromJson(Map<String, dynamic> json) => TutorDataClass(
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
      );

  TutorDataClass({
    this.firstName,
    this.lastName,
    this.profilePic,
  });

  String? firstName;
  String? lastName;
  String? profilePic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic,
      };
}
