// To parse this JSON data, do
//
//     final preOrder = preOrderFromJson(jsonString);

import 'dart:convert';

PreOrder preOrderFromJson(String str) =>
    PreOrder.fromJson(json.decode(str) as Map<String, dynamic>);

String preOrderToJson(PreOrder data) => json.encode(data.toJson());

class PreOrder {
  factory PreOrder.fromJson(Map<String, dynamic> json) => PreOrder(
        message: json['message'] as String? ?? '',
        data: PreOrderData.fromJson(json['data'] as Map<String, dynamic>),
      );
  PreOrder({
    this.message,
    this.data,
  });

  String? message;
  PreOrderData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data?.toJson(),
      };
}

class PreOrderData {
  factory PreOrderData.fromJson(Map<String, dynamic> json) => PreOrderData(
        id: json['id'] as String? ?? '',
        entity: json['entity'] as String? ?? '',
        amount: json['amount'] as num? ?? 0,
        amountPaid: json['amount_paid'] as num? ?? 0,
        amountDue: json['amount_due'] as num? ?? 0,
        currency: json['currency'] as String? ?? '',
        receipt: json['receipt'] as String? ?? '',
        offerId: json['offer_id'] as String? ?? '',
        status: json['status'] as String? ?? '',
        attempts: json['attempts'] as num? ?? 0,
        notes: json['notes'] == null
            ? <dynamic>[]
            : List<dynamic>.from((json['notes'] as List<dynamic>)
                .map<dynamic>((dynamic x) => x)),
        createdAt: json['created_at'] as num? ?? 0,
      );
  PreOrderData({
    this.id,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.notes,
    this.createdAt,
  });

  String? id;
  String? entity;
  num? amount;
  num? amountPaid;
  num? amountDue;
  String? currency;
  dynamic receipt;
  dynamic offerId;
  String? status;
  num? attempts;
  List<dynamic>? notes;
  num? createdAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'entity': entity,
        'amount': amount,
        'amount_paid': amountPaid,
        'amount_due': amountDue,
        'currency': currency,
        'receipt': receipt,
        'offer_id': offerId,
        'status': status,
        'attempts': attempts,
        'notes': List<dynamic>.from(
            (notes ?? <dynamic>[]).map<dynamic>((dynamic x) => x)),
        'created_at': createdAt,
      };
}
