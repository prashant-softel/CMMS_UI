// To parse this JSON data, do
//
//     final cognitoIdentityResponse = cognitoIdentityResponseFromJson(jsonString);

import 'dart:convert';

CognitoIdentityResponse cognitoIdentityResponseFromJson(String str) =>
    CognitoIdentityResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String cognitoIdentityResponseToJson(CognitoIdentityResponse data) =>
    json.encode(data.toJson());

class CognitoIdentityResponse {
  CognitoIdentityResponse({
    this.credentials,
    this.identityId,
  });

  factory CognitoIdentityResponse.fromJson(Map<String, dynamic> json) =>
      CognitoIdentityResponse(
        credentials:
            Credentials.fromJson(json['Credentials'] as Map<String, dynamic>),
        identityId: json['IdentityId'] as String? ?? '',
      );

  Credentials? credentials;
  String? identityId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Credentials': credentials,
        'IdentityId': identityId,
      };
}

class Credentials {
  Credentials({
    this.accessKeyId,
    this.expiration,
    this.secretKey,
    this.sessionToken,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        accessKeyId: json['AccessKeyId'] as String? ?? '',
        expiration: json['Expiration'] as double? ?? 0.0,
        secretKey: json['SecretKey'] as String? ?? '',
        sessionToken: json['SessionToken'] as String? ?? '',
      );

  String? accessKeyId;
  double? expiration;
  String? secretKey;
  String? sessionToken;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'AccessKeyId': accessKeyId,
        'Expiration': expiration,
        'SecretKey': secretKey,
        'SessionToken': sessionToken,
      };
}
