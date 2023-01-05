// To parse this JSON data, do
//
//     final appVersion = appVersionFromJson(jsonString);

import 'dart:convert';

AppVersion appVersionFromJson(String str) =>
    AppVersion.fromJson(json.decode(str) as Map<String, dynamic>);

String appVersionToJson(AppVersion data) => json.encode(data.toJson());

class AppVersion {
  factory AppVersion.fromJson(Map<String, dynamic> json) => AppVersion(
        message: json['message'] as String? ?? '',
        data: AppVersionData.fromJson(json['data'] as Map<String, dynamic>),
      );
  AppVersion({
    this.message,
    this.data,
  });

  String? message;
  AppVersionData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class AppVersionData {
  factory AppVersionData.fromJson(Map<String, dynamic> json) => AppVersionData(
        latestVersion: json['latestVersion'] as String? ?? '',
        mandatoryVersion: json['mandatoryVersion'] as String? ?? '',
        advisoryVersion: AdvisoryVersion.fromJson(
            json['advisoryVersion'] as Map<String, dynamic>),
      );
  AppVersionData({
    this.latestVersion,
    this.mandatoryVersion,
    this.advisoryVersion,
  });

  String? latestVersion;
  String? mandatoryVersion;
  AdvisoryVersion? advisoryVersion;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'latestVersion': latestVersion,
        'mandatoryVersion': mandatoryVersion,
        'advisoryVersion': advisoryVersion!.toJson(),
      };
}

class AdvisoryVersion {
  factory AdvisoryVersion.fromJson(Map<String, dynamic> json) =>
      AdvisoryVersion(
        version: json['version'] as String? ?? '',
        visible: json['visible'] as bool? ?? false,
      );
  AdvisoryVersion({
    this.version,
    this.visible,
  });

  String? version;
  bool? visible;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'version': version,
        'visible': visible,
      };
}
