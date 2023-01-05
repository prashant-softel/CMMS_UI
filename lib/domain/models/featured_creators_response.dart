// To parse this JSON data, do
//
//     final featuredCreatorsReponse = featuredCreatorsReponseFromJson(jsonString);

import 'dart:convert';

FeaturedCreatorsReponse featuredCreatorsReponseFromJson(String str) =>
    FeaturedCreatorsReponse.fromJson(json.decode(str) as Map<String, dynamic>);

class FeaturedCreatorsReponse {
  FeaturedCreatorsReponse({
    this.message,
    this.data,
  });

  factory FeaturedCreatorsReponse.fromJson(Map<String, dynamic> json) =>
      FeaturedCreatorsReponse(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<FeaturedCreatorsData>.from(
          (json['data'] as List<dynamic>).map<dynamic>(
                (dynamic x) => FeaturedCreatorsData.fromJson(
              x as Map<String, dynamic>,
            ),
          ),
        )
            : [],
      );

  String? message;
  List<FeaturedCreatorsData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'message': message,
    'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
  };
}

class FeaturedCreatorsData {
  FeaturedCreatorsData({
    this.id,
    this.userId,
    this.username,
    this.email,
    this.fullName,
    this.profilePic,
    this.bannerImage,
    this.isFollow,
  });

  factory FeaturedCreatorsData.fromJson(Map<String, dynamic> json) =>
      FeaturedCreatorsData(
        id: json['_id'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        username: json['username'] as String? ?? '',
        email: json['email'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        bannerImage: json['bannerImage'] as String? ?? '',
        isFollow: json['isFollow'] as bool? ?? false,
      );

  String? id;
  String? userId;
  String? username;
  String? email;
  String? fullName;
  String? profilePic;
  String? bannerImage;
  bool? isFollow;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'userId': userId,
    'username': username,
    'email': email,
    'fullName': fullName,
    'profilePic': profilePic,
    'bannerImage': bannerImage,
    'isFollow': isFollow,
  };
}
