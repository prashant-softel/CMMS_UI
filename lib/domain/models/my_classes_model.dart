// To parse this JSON data, do
//
//     final myClassesModel = myClassesModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

MyClassesModel myClassesModelFromJson(String str) =>
    MyClassesModel.fromJson(json.decode(str) as Map<String, dynamic>);

String myClassesModelToJson(MyClassesModel data) => json.encode(data.toJson());

class MyClassesModel {
  factory MyClassesModel.fromJson(Map<String, dynamic> json) => MyClassesModel(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<MyClassModelData>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    MyClassModelData.fromJson(x as Map<String, dynamic>))),
      );

  MyClassesModel({
    this.message,
    this.data,
  });

  String? message;
  List<MyClassModelData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class MyClassModelData {
  factory MyClassModelData.fromJson(Map<String, dynamic> json) =>
      MyClassModelData(
        id: json['_id'] as String? ?? '',
        notes: json['notes'] as String? ?? '',
        orderId: json['orderId'] as String? ?? '',
        token: json['token'] as String? ?? '',
        createdTs: json['createdTs'] as int? ?? 0,
        creator: Creator.fromJson(json['creator'] as Map<String, dynamic>),
        subject: json['subject'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        uIdForAgora: json['uId'].toString(),
      );

  MyClassModelData({
    this.id,
    this.notes,
    this.createdTs,
    this.creator,
    this.subject,
    this.statusCode,
    this.orderId,
    this.token,
    this.uIdForAgora,
    // this.paymentAmount
  });

  String? id;
  String? notes;
  int? createdTs;
  int? statusCode;
  Creator? creator;
  String? subject;
  String? orderId;
  String? uIdForAgora;
  String? token;
  // PaymentAmount? paymentAmount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'notes': notes,
        'createdTs': createdTs,
        'creator': creator!.toJson(),
        'subject': subject,
        // 'paymentAmount': paymentAmount!.toJson(),
      };
}

// class PaymentAmount {
//
//   factory PaymentAmount.fromJson(Map<String, dynamic> json) => PaymentAmount(
//     walletAmount: json['walletAmount'] as num? ?? 0,
//     pgAmount: json['pgAmount'] as num? ?? 0,
//   );
//   PaymentAmount({
//     this.walletAmount,
//     this.pgAmount,
//   });
//
//   num? walletAmount;
//   num? pgAmount;
//
//   Map<String, dynamic> toJson() => <String, dynamic> {
//     'walletAmount': walletAmount,
//     'pgAmount': pgAmount,
//   };
// }
