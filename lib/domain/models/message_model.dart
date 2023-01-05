// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);
import 'dart:convert';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

MessageModel messageFromJson(String str) =>
    MessageModel.fromJson(json.decode(str) as Map<String, dynamic>);

String messageToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    this.message,
    this.data,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      message: json['message'] as String? ?? '',
      data: json['data'].runtimeType.toString() !=
              '_InternalLinkedHashMap<String, dynamic>'
          ? List<types.MessageData>.from(
              (json['data'] as List<dynamic>? ?? <dynamic>[]).map<dynamic>(
                  (dynamic x) =>
                      types.MessageData.fromJson(x as Map<String, dynamic>)))
          : []);

  final String? message;
  final List<types.MessageData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson()))
      };
}
