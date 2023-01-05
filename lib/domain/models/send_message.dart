// To parse this JSON data, do
//
//     final sendMessage = sendMessageFromJson(jsonString);

import 'dart:convert';

SendMessage sendMessageFromJson(String str) =>
    SendMessage.fromJson(json.decode(str) as Map<String, dynamic>);

String sendMessageToJson(SendMessage data) => json.encode(data.toJson());

class SendMessage {
  SendMessage({
    this.username,
    this.profilePic,
    this.receiverName,
    this.receiverId,
    this.chatId,
    this.payload,
    this.messageType,
    this.actionType,
    this.dataSize,
    this.fileName,
    this.thumbnail,
    this.isVipMessage,
  });

  factory SendMessage.fromJson(Map<String, dynamic> json) => SendMessage(
        username: json['username'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        receiverName: json['receiverName'] as String? ?? '',
        receiverId: json['receiverId'] as String? ?? '',
        chatId: json['chatId'] as String? ?? '',
        payload: json['payload'] as String? ?? '',
        messageType: json['messageType'] as String? ?? '',
        actionType: json['actionType'] as String? ?? '',
        dataSize: json['dataSize'] as String? ?? '',
        fileName: json['fileName'] as String? ?? '',
        thumbnail: json['thumbnail'] as String? ?? '',
        isVipMessage: json['isVipMessage'] as bool? ?? false,
      );

  String? username;
  String? profilePic;
  String? receiverName;
  String? receiverId;
  String? chatId;
  String? payload;
  String? messageType;
  String? actionType;
  String? dataSize;
  String? fileName;
  String? thumbnail;
  bool? isVipMessage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'profilePic': profilePic,
        'receiverName': receiverName,
        'receiverId': receiverId,
        'chatId': chatId,
        'payload': payload,
        'messageType': messageType,
        'actionType': actionType,
        'dataSize': dataSize,
        'fileName': fileName,
        'thumbnail': thumbnail,
        'isVipMessage': isVipMessage,
      };
}
