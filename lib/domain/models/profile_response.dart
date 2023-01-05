// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

import 'package:cmms/domain/domain.dart';

ProfileResponse profileFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String profileToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    this.message,
    this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        message: json['message'] as String? ?? '',
        data: ProfileData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  ProfileData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data!.toJson(),
      };
}

class ProfileData {
  ProfileData({
    this.id,
    this.userTypeCode,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.referralCode,
    this.fcmTopic,
    this.statusCode,
    this.profilePic,
    this.phoneNumber,
    this.countryCode,
    this.userMode,
    this.userPreference,
    this.timezone,
    this.videoCallPrice,
    this.orderCount,
    this.isFollow,
    this.subscriptionData,
    this.postCount,
    this.mySubscriber,
    this.bio,
    this.loginVerifiredBy,
    this.address,
    this.ageGroupsAndSubjectsAllowedToTeach,
    this.applicationVideosForReview,
    this.billingAddress,
    this.businessName,
    this.countryCodeName,
    this.currencySymbol,
    this.dateOfBirth,
    this.defaultCurrency,
    this.documents,
    this.educationLevel,
    this.experience,
    this.gender,
    this.profileCompletionPercentage,
    this.taxOrGstNumber,
    this.subjects,
    this.avgRating,
    this.ratingCount,
    this.totalRating,
    this.isFavorite,
    this.taughtHrs,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json['_id'] as String? ?? '',
        userTypeCode: json['userTypeCode'] as int? ?? 0,
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        username: json['username'] as String? ?? '',
        referralCode: json['referralCode'] as String? ?? '',
        fcmTopic: json['fcmTopic'] as String? ?? '',
        isFavorite: json['isFavorite'] as num? ?? 0,
        taughtHrs: json['taughtHrs'] as num? ?? 0,
        bio: json['bio'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        profilePic: json['profilePic'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        userMode: json['userMode'] as String? ?? '',
        userPreference: json['userPreference'] == null
            ? null
            : UserPreference.fromJson(
                json['userPreference'] as Map<String, dynamic>),
        timezone: json['timezone'] as String? ?? '',
        videoCallPrice: VideoCallPrice.fromJson(),
        orderCount: json['orderCount'] as int? ?? 0,
        isFollow: json['isFollow'] as bool? ?? false,
        subscriptionData: json['subscriptionData'] == null
            ? null
            : SubscriptionData.fromJson(
                json['subscriptionData'] as Map<String, dynamic>),
        postCount: json['postCount'] as int? ?? 0,
        mySubscriber: json['mySubscriber'] as int? ?? 0,
        loginVerifiredBy: json['loginVerifiedBy'] == null
            ? null
            : LoginVerifiredBy.fromJson(
                json['loginVerifiedBy'] as Map<String, dynamic>),
        gender: json['gender'] as String? ?? '',
        dateOfBirth: json['dateOfBirth'] as String? ?? '',
        documents: json['documents'] == null
            ? null
            : Documents.fromJson(json['documents'] as Map<String, dynamic>),
        countryCodeName: json['countryCodeName'] as String? ?? '',
        currencySymbol: json['currencySymbol'] as String? ?? '',
        defaultCurrency: json['defaultCurrency'] as String? ?? '',
        avgRating: json['avgRating'] as num? ?? 0.0,
        ratingCount: json['ratingCount'] as num? ?? 0,
        totalRating: json['totalRating'] as num? ?? 0.0,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        experience: json['experience'] as int? ?? 0,
        businessName: json['businessName'] as String? ?? '',
        taxOrGstNumber: json['taxOrGstNumber'] as String? ?? '',
        subjects: json['subjects'] == null
            ? []
            : List<SubjectOne>.from((json['subjects'] as List).map<dynamic>(
                (dynamic x) => SubjectOne.fromJson(x as Map<String, dynamic>))),
        billingAddress: json['billingAddress'] == null
            ? null
            : Address.fromJson(json['billingAddress'] as Map<String, dynamic>),
        profileCompletionPercentage:
            json['profileCompletionPercentage'] as String? ?? '',
        ageGroupsAndSubjectsAllowedToTeach:
            json['ageGroupsAndSubjectsAllowedToTeach'] == null
                ? []
                : List<AgeGroupsAndSubjectsAllowedToTeach>.from(
                    (json['ageGroupsAndSubjectsAllowedToTeach'] as List)
                        .map<dynamic>((dynamic x) =>
                            AgeGroupsAndSubjectsAllowedToTeach.fromJson(
                                x as Map<String, dynamic>))),
        educationLevel: json['educationLevel'] == null
            ? []
            : List<EducationLevel>.from((json['educationLevel'] as List)
                .map<dynamic>((dynamic x) =>
                    EducationLevel.fromJson(x as Map<String, dynamic>))),
        applicationVideosForReview: json['applicationVideosForReview'] == null
            ? []
            : List<ApplicationVideosForReview>.from(
                (json['applicationVideosForReview'] as List).map<dynamic>(
                    (dynamic x) => ApplicationVideosForReview.fromJson(
                        x as Map<String, dynamic>))),
      );

  String? id;
  int? userTypeCode;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? referralCode;
  String? fcmTopic;
  int? statusCode;
  num? isFavorite;
  String? profilePic;
  String? phoneNumber;
  String? countryCode;
  String? userMode;
  String? bio;
  UserPreference? userPreference;
  String? timezone;
  VideoCallPrice? videoCallPrice;
  int? orderCount;
  bool? isFollow;
  SubscriptionData? subscriptionData;
  int? postCount;
  int? mySubscriber;
  LoginVerifiredBy? loginVerifiredBy;
  String? gender;
  String? dateOfBirth;
  Documents? documents;
  String? countryCodeName;
  String? currencySymbol;
  String? defaultCurrency;
  Address? address;
  int? experience;
  String? businessName;
  String? taxOrGstNumber;
  Address? billingAddress;
  String? profileCompletionPercentage;
  List<AgeGroupsAndSubjectsAllowedToTeach>? ageGroupsAndSubjectsAllowedToTeach;
  List<EducationLevel>? educationLevel;
  List<ApplicationVideosForReview>? applicationVideosForReview;
  List<SubjectOne>? subjects;
  num? avgRating;
  num? ratingCount;
  num? totalRating;
  num? taughtHrs;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'userTypeCode': userTypeCode,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'username': username,
        'referralCode': referralCode,
        'fcmTopic': fcmTopic,
        'statusCode': statusCode,
        'profilePic': profilePic,
        'phoneNumber': phoneNumber,
        'countryCode': countryCode,
        'taughtHrs': taughtHrs,
        'userMode': userMode,
        'userPreference': userPreference!.toJson(),
        'timezone': timezone,
        'videoCallPrice': videoCallPrice!.toJson(),
        'orderCount': orderCount,
        'isFollow': isFollow,
        'subscriptionData': subscriptionData!.toJson(),
        'postCount': postCount,
        'mySubscriber': mySubscriber,
        'loginVerifiedBy': loginVerifiredBy!.toJson(),
        'gender': gender,
        'dateOfBirth': dateOfBirth,
        'documents': documents!.toJson(),
        'countryCodeName': countryCodeName,
        'currencySymbol': currencySymbol,
        'defaultCurrency': defaultCurrency,
        'address': address!.toJson(),
        'experience': experience,
        'businessName': businessName,
        'taxOrGstNumber': taxOrGstNumber,
        'billingAddress': billingAddress!.toJson(),
        'profileCompletionPercentage': profileCompletionPercentage,
        'subjects':
            List<dynamic>.from(subjects!.map<dynamic>((x) => x.toJson())),
        'ageGroupsAndSubjectsAllowedToTeach': List<dynamic>.from(
            ageGroupsAndSubjectsAllowedToTeach!
                .map<dynamic>((x) => x.toJson())),
        'educationLevel':
            List<dynamic>.from(educationLevel!.map<dynamic>((x) => x.toJson())),
        'applicationVideosForReview': List<dynamic>.from(
            applicationVideosForReview!.map<dynamic>((x) => x.toJson())),
      };
}

class SubscriptionData {
  SubscriptionData({
    this.planCount,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      SubscriptionData(
        planCount: json['planCount'] as int? ?? 0,
      );

  int? planCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'planCount': planCount,
      };
}

class UserPreference {
  UserPreference({
    this.allowFreeMessage,
  });

  factory UserPreference.fromJson(Map<String, dynamic> json) => UserPreference(
        allowFreeMessage: json['allowFreeMessage'] as bool? ?? false,
      );

  bool? allowFreeMessage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'allowFreeMessage': allowFreeMessage,
      };
}

class VideoCallPrice {
  VideoCallPrice();

  factory VideoCallPrice.fromJson() => VideoCallPrice();

  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class EducationLevel {
  EducationLevel({
    this.educationLevelId,
    this.documentUrl,
    this.educationLevel,
  });

  factory EducationLevel.fromJson(Map<String, dynamic> json) => EducationLevel(
        educationLevelId: json['educationLevelId'] as String? ?? '',
        documentUrl: json['documentUrl'] as String? ?? '',
        educationLevel: json['educationLevel'] as String? ?? '',
      );

  String? educationLevelId;
  String? documentUrl;
  String? educationLevel;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'educationLevelId': educationLevelId,
        'documentUrl': documentUrl,
        'educationLevel': educationLevel,
      };
}

class Documents {
  Documents({
    this.documentId,
    this.name,
    this.frontImage,
    this.backImage,
    this.createdTs,
    this.uploadedTs,
    this.uploadedDate,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
        documentId: json['documentId'] as String? ?? '',
        name: json['name'] as String? ?? '',
        frontImage: json['frontImage'] as String? ?? '',
        backImage: json['backImage'] as String? ?? '',
        createdTs: json['createdTs'] as int? ?? 0,
        uploadedTs: json['uploadedTs'] as int? ?? 0,
        uploadedDate: json['uploadedDate'] as String? ?? '',
      );

  String? documentId;
  String? name;
  String? frontImage;
  String? backImage;
  int? createdTs;
  int? uploadedTs;
  String? uploadedDate;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'documentId': documentId,
        'name': name,
        'frontImage': frontImage,
        'backImage': backImage,
        'createdTs': createdTs,
        'uploadedTs': uploadedTs,
        'uploadedDate': uploadedDate,
      };
}

class ApplicationVideosForReview {
  ApplicationVideosForReview({
    this.subjectId,
    this.videoUrl,
    this.type,
    this.subject,
  });

  factory ApplicationVideosForReview.fromJson(Map<String, dynamic> json) =>
      ApplicationVideosForReview(
        subjectId: json['subjectId'] as String? ?? '',
        videoUrl: json['videoUrl'] as String? ?? '',
        type: json['type'] as String? ?? '',
        subject: json['subject'] as String? ?? '',
      );

  String? subjectId;
  String? videoUrl;
  String? type;
  String? subject;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subjectId': subjectId,
        'videoUrl': videoUrl,
        'type': type,
        'subject': subject,
      };
}

class AgeGroupsAndSubjectsAllowedToTeach {
  AgeGroupsAndSubjectsAllowedToTeach({
    this.ageGroupId,
    this.subjectId,
    this.learningObjectives,
    this.status,
    this.ageGroup,
    this.subject,
    this.learningObjectivesData,
  });

  factory AgeGroupsAndSubjectsAllowedToTeach.fromJson(
          Map<String, dynamic> json) =>
      AgeGroupsAndSubjectsAllowedToTeach(
        ageGroupId: json['ageGroupId'] as String? ?? '',
        subjectId: json['subjectId'] as String? ?? '',
        learningObjectives: json['learningObjectives'] == null
            ? []
            : List<String>.from((json['learningObjectives'] as List)
                .map<dynamic>((dynamic x) => x)),
        status: json['status'] as String? ?? '',
        ageGroup: json['ageGroup'] as String? ?? '',
        subject: json['subject'] as String? ?? '',
        learningObjectivesData: json['learningObjectivesData'] == null
            ? []
            : List<LearningObjectivesDatum>.from(
                (json['learningObjectivesData'] as List).map<dynamic>(
                    (dynamic x) => LearningObjectivesDatum.fromJson(
                        x as Map<String, dynamic>))),
      );

  String? ageGroupId;
  String? subjectId;
  List<String>? learningObjectives;
  String? status;
  String? ageGroup;
  String? subject;
  List<LearningObjectivesDatum>? learningObjectivesData;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ageGroupId': ageGroupId,
        'subjectId': subjectId,
        'learningObjectives':
            List<dynamic>.from(learningObjectives!.map<dynamic>((x) => x)),
        'status': status,
        'ageGroup': ageGroup,
        'subject': subject,
        'learningObjectivesData': List<dynamic>.from(
            learningObjectivesData!.map<dynamic>((x) => x.toJson())),
      };
}

class LearningObjectivesDatum {
  LearningObjectivesDatum({
    this.id,
    this.learningObjective,
  });

  factory LearningObjectivesDatum.fromJson(Map<String, dynamic> json) =>
      LearningObjectivesDatum(
        id: json['_id'] as String? ?? '',
        learningObjective: json['learningObjective'] as String? ?? '',
      );

  String? id;
  String? learningObjective;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'learningObjective': learningObjective,
      };
}
