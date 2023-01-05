// To parse this JSON data, do
//
//     final chatMediaDocResp = chatMediaDocRespFromJson(jsonString);

import 'dart:convert';

ChatMediaDocResp chatMediaDocRespFromJson(String str) =>
    ChatMediaDocResp.fromJson(json.decode(str) as Map<String, dynamic>);

String chatMediaDocRespToJson(ChatMediaDocResp data) =>
    json.encode(data.toJson());

class ChatMediaDocResp {
  ChatMediaDocResp({
    this.message,
    this.data,
    this.totalCount,
  });

  factory ChatMediaDocResp.fromJson(Map<String, dynamic> json) =>
      ChatMediaDocResp(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<DocData>.from((json['data'] as List<dynamic>? ?? <dynamic>[])
                .map<dynamic>(
                    (dynamic x) => DocData.fromJson(x as Map<String, dynamic>)))
            : [],
        totalCount: json['totalCount'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data,
        'totalCount': totalCount,
      };
  String? message;
  List<DocData>? data;
  int? totalCount;
}

class DocData {
  DocData({
    this.messageId,
    this.senderId,
    this.receiverId,
    this.messageType,
    this.status,
    this.delivered,
    this.payload,
    this.thumbnail,
    this.dataSize,
    this.fileName,
    this.deliveredAt,
    this.createdAt,
  });

  factory DocData.fromJson(Map<String, dynamic> json) => DocData(
        messageId: json['messageId'] as int? ?? 0,
        senderId: json['senderId'] as String? ?? '',
        receiverId: json['receiverId'] as String? ?? '',
        messageType: json['messageType'] as int? ?? 0,
        status: json['status'] as int? ?? 0,
        delivered: json['delivered'] as int? ?? 0,
        payload: json['payload'] as String? ?? '',
        thumbnail: json['thumbnail'] as String? ?? '',
        dataSize: json['dataSize'] as int? ?? 0,
        fileName: json['fileName'] as String? ?? '',
        deliveredAt: json['deliveredAt'] as int? ?? 0,
        createdAt: json['createdAt'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'messageId': messageId,
        'senderId': senderId,
        'receiverId': receiverId,
        'messageType': messageType,
        'status': status,
        'delivered': delivered,
        'payload': payload,
        'thumbnail': thumbnail,
        'dataSize': dataSize,
        'fileName': fileName,
        'deliveredAt': deliveredAt,
        'createdAt': createdAt,
      };
  int? messageId;
  String? senderId;
  String? receiverId;
  int? messageType;
  int? status;
  int? delivered;
  String? payload;
  String? thumbnail;
  int? dataSize;
  String? fileName;
  int? deliveredAt;
  int? createdAt;
}
