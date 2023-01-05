// To parse this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

import 'dart:convert';

ChatListModel chatListModelFromJson(String str) =>
    ChatListModel.fromJson(json.decode(str) as Map<String, dynamic>);

String chatListModelToJson(ChatListModel data) => json.encode(data.toJson());

class ChatListModel {
  ChatListModel({
    this.message,
    this.data,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<ChatListData>.from(
                (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                    (dynamic x) =>
                        ChatListData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  final String? message;
  final List<ChatListData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class ChatListData {
  ChatListData({
    this.initiated,
    this.chatId,
    this.groupChat,
    this.userName,
    this.profilePic,
    this.deliveredAt,
    this.messageId,
    this.payload,
    this.messageType,
    this.receiverId,
    this.senderId,
    this.phoneNumber,
    this.recipientId,
    this.status,
    this.totalUnread,
    this.thumbnail,
    this.fileName,
    this.dataSize,
    this.groupSubject,
    this.groupImage,
    this.email,
  });

  factory ChatListData.fromJson(Map<String, dynamic> json) => ChatListData(
        initiated: json['initiated'] as bool? ?? false,
        chatId: json['chatId'] as String? ?? '',
        groupChat: json['groupChat'] as bool? ?? false,
        userName: json['userName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        deliveredAt: json['deliveredAt'] as int? ?? 0,
        messageId: json['messageId'] as int? ?? 0,
        payload: json['payload'] as String? ?? '',
        messageType: json['messageType'] as int? ?? 0,
        receiverId: json['receiverId'] as String? ?? '',
        senderId: json['senderId'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        recipientId: json['recipientId'] as String? ?? '',
        status: json['status'] as int? ?? 0,
        totalUnread: json['totalUnread'] as int? ?? 0,
        email: json['email'] as String? ?? '',
        thumbnail: json['thumbnail'] as String? ?? '',
        fileName: json['fileName'] as String? ?? '',
        dataSize: json['dataSize'],
        groupSubject: json['groupSubject'] as String? ?? '',
        groupImage: json['groupImage'] as String? ?? '',
      );

  final bool? initiated;
  final String? chatId;
  final bool? groupChat;
  final String? userName;
  final String? profilePic;
  final int? deliveredAt;
  final int? messageId;
  String? payload;
  final int? messageType;
  final String? receiverId;
  final String? senderId;
  final String? phoneNumber;
  final String? recipientId;
  final String? email;
  final int? status;
  final int? totalUnread;
  final String? thumbnail;
  final String? fileName;
  final dynamic dataSize;
  final String? groupSubject;
  final String? groupImage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'initiated': initiated,
        'chatId': chatId,
        'groupChat': groupChat,
        'userName': userName,
        'profilePic': profilePic,
        'deliveredAt': deliveredAt,
        'messageId': messageId,
        'payload': payload,
        'messageType': messageType,
        'receiverId': receiverId,
        'senderId': senderId,
        'phoneNumber': phoneNumber,
        'recipientId': recipientId,
        'status': status,
        'totalUnread': totalUnread,
        'thumbnail': thumbnail,
        'fileName': fileName,
        'dataSize': dataSize,
        'groupSubject': groupSubject,
        'groupImage': groupImage,
      };
}
