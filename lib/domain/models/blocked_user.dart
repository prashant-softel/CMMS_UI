// To parse this JSON data, do
//
//     final blockedUser = blockedUserFromJson(jsonString);

import 'dart:convert';

BlockedUser blockedUserFromJson(String str) =>
    BlockedUser.fromJson(json.decode(str) as Map<String, dynamic>);

String blockedUserToJson(BlockedUser data) => json.encode(data.toJson());

class BlockedUser {
  BlockedUser({
    this.message,
    this.data,
  });

  factory BlockedUser.fromJson(Map<String, dynamic> json) => BlockedUser(
        message: json['message'] as String? ?? '',
        data: BlockedUserData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  BlockedUserData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class BlockedUserData {
  BlockedUserData({
    this.blockData,
    this.totalCount,
  });

  factory BlockedUserData.fromJson(Map<String, dynamic> json) =>
      BlockedUserData(
        blockData: List<BlockDatum>.from((json['blockData'] as List<dynamic>)
            .map<dynamic>(
                (dynamic x) => BlockDatum.fromJson(x as Map<String, dynamic>))),
        totalCount: json['totalCount'] as int? ?? 0,
      );

  List<BlockDatum>? blockData;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'blockData':
            List<dynamic>.from(blockData!.map<dynamic>((x) => x.toJson())),
        'totalCount': totalCount,
      };
}

class BlockDatum {
  BlockDatum({
    this.id,
    this.blockedUserId,
    this.blockedAt,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.userTypeCode,
    this.userTypeText,
  });

  factory BlockDatum.fromJson(Map<String, dynamic> json) => BlockDatum(
        id: json['_id'] as String? ?? '',
        blockedUserId: json['blockedUserId'] as String? ?? '',
        blockedAt: json['blockedAt'] as int? ?? 0,
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        userTypeCode: json['userTypeCode'] as int? ?? 0,
        userTypeText: json['userTypeText'] as String? ?? '',
      );

  String? id;
  String? blockedUserId;
  int? blockedAt;
  String? username;
  String? firstName;
  String? lastName;
  String? profilePic;
  int? userTypeCode;
  String? userTypeText;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'blockedUserId': blockedUserId,
        'blockedAt': blockedAt,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic,
        'userTypeCode': userTypeCode,
        'userTypeText': userTypeText,
      };
}
