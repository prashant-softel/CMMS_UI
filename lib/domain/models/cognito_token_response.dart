// To parse this JSON data, do
//
//     final cognitoTokenResp = cognitoTokenRespFromJson(jsonString);

import 'dart:convert';

CognitoTokenResp cognitoTokenRespFromJson(String str) => CognitoTokenResp.fromJson(json.decode(str) as Map<String,dynamic>);

String cognitoTokenRespToJson(CognitoTokenResp data) => json.encode(data.toJson());

class CognitoTokenResp {
  CognitoTokenResp({
    this.message,
    this.data,
  });

  factory CognitoTokenResp.fromJson(Map<String, dynamic> json) => CognitoTokenResp(
    message: json['message'] as String? ?? '',
    data: json['data'] == null ? null : CognitoTokenData.fromJson(json['data'] as Map<String,dynamic>),
  );

  String? message;
  CognitoTokenData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'message': message == null ? null : message,
    'data': data,
  };
}

class CognitoTokenData {
  CognitoTokenData({
    this.identityId,
    this.token,
    this.bucket,
    this.region,
    this.videoBucket,
    this.videoFolder,
    this.imageBucket,
  });

  factory CognitoTokenData.fromJson(Map<String, dynamic> json) => CognitoTokenData(
    identityId: json['IdentityId'] as String? ?? '',
    token: json['Token'] as String? ?? '',
    bucket: json['bucket'] as String? ?? '',
    region: json['region'] as String? ?? '',
    videoBucket: json['videoBucket'] as String? ?? '',
    videoFolder: json['videoFolder'] as String? ?? '',
    imageBucket: json['imageBucket'] as String? ?? '',
  );

  String? identityId;
  String? token;
  String? bucket;
  String? region;
  String? videoBucket;
  String? videoFolder;
  String? imageBucket;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'IdentityId': identityId == null ? null : identityId,
    'Token': token == null ? null : token,
    'bucket': bucket == null ? null : bucket,
    'region': region == null ? null : region,
    'videoBucket': videoBucket == null ? null : videoBucket,
    'videoFolder': videoFolder == null ? null : videoFolder,
    'imageBucket': imageBucket == null ? null : imageBucket,
  };
}
