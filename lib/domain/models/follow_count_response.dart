// To parse this JSON data, do
//
//     final followCountResponse = followCountResponseFromJson(jsonString);

import 'dart:convert';

FollowCountResponse followCountResponseFromJson(String str) => FollowCountResponse.fromJson(json.decode(str) as Map<String,dynamic>);

String followCountResponseToJson(FollowCountResponse data) => json.encode(data.toJson());

class FollowCountResponse {
  FollowCountResponse({
    this.message,
    this.data,
  });

  factory FollowCountResponse.fromJson(Map<String, dynamic> json) => FollowCountResponse(
    message: json['message'] as String? ?? '',
    data: json['data'] == null ? null : FollowCountData.fromJson(json['data'] as Map<String,dynamic>),
  );

  String? message;
  FollowCountData? data;

  Map<String, dynamic> toJson() => <String,dynamic>{
    'message': message == null ? null : message,
    'data': data,
  };
}

class FollowCountData {
  FollowCountData({
    this.totalFollower,
    this.totalFollowing,
    this.isFollow,
  });

  factory FollowCountData.fromJson(Map<String, dynamic> json) => FollowCountData(
    totalFollower: json['totalFollower'] as int? ?? 0,
    totalFollowing: json['totalFollowing'] as int? ?? 0,
    isFollow: json['isFollow'] as int? ?? 0,
  );

  int? totalFollower;
  int? totalFollowing;
  int? isFollow;

  Map<String, dynamic> toJson() => <String,dynamic>{
    'totalFollower': totalFollower == null ? null : totalFollower,
    'totalFollowing': totalFollowing == null ? null : totalFollowing,
    'isFollow': isFollow == null ? null : isFollow,
  };
}
