// To parse this JSON data, do
//
//     final profileAvatar = profileAvatarFromJson(jsonString);

import 'dart:convert';

ProfileAvatar profileAvatarFromJson(String str) =>
    ProfileAvatar.fromJson(json.decode(str) as Map<String, dynamic>);

String profileAvatarToJson(ProfileAvatar data) => json.encode(data.toJson());

class ProfileAvatar {
  ProfileAvatar({
    this.message,
    this.data,
    this.totalCount,
  });

  factory ProfileAvatar.fromJson(Map<String, dynamic> json) => ProfileAvatar(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<ProfileAvatarData>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    ProfileAvatarData.fromJson(x as Map<String, dynamic>))),
        totalCount: json['totalCount'] as int? ?? 0,
      );

  String? message;
  List<ProfileAvatarData>? data;
  int? totalCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
        'totalCount': totalCount,
      };
}

class ProfileAvatarData {
  ProfileAvatarData({
    this.id,
    this.profileAvatar,
    this.createdOnTimestamp,
    this.createdOnDate,
    this.iconUrl,
  });

  factory ProfileAvatarData.fromJson(Map<String, dynamic> json) =>
      ProfileAvatarData(
        id: json['_id'] as String? ?? '',
        profileAvatar: ProfileAvatarClass.fromJson(
            json['profileAvatar'] as Map<String, dynamic>),
        createdOnTimestamp: json['createdOnTimestamp'] as int? ?? 0,
        createdOnDate: json['createdOnDate'] as String? ?? '',
        iconUrl: json['iconUrl'] as String? ?? '',
      );

  String? id;
  ProfileAvatarClass? profileAvatar;
  int? createdOnTimestamp;
  String? createdOnDate;
  String? iconUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'profileAvatar': profileAvatar!.toJson(),
        'createdOnTimestamp': createdOnTimestamp,
        'createdOnDate': createdOnDate,
        'iconUrl': iconUrl,
      };
}

class ProfileAvatarClass {
  ProfileAvatarClass({
    this.en,
  });

  factory ProfileAvatarClass.fromJson(Map<String, dynamic> json) =>
      ProfileAvatarClass(
        en: json['en'] as String? ?? '',
      );

  String? en;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'en': en,
      };
}
