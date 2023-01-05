// coverage:ignore-file
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cmms/app/app.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/domain.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  late Dio _dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  /// Device info plugin initialization
  final deviceinfo = DeviceInfoPlugin();

  /// To get android device info
  AndroidDeviceInfo? androidDeviceInfo;

  /// To get iOS device info
  IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  // coverage:ignore-start
  /// initialize the andorid device information
  void _init() async {
    if (GetPlatform.isAndroid) {
      androidDeviceInfo = await deviceinfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceinfo.iosInfo;
    }
    _dio = Dio();
  }

  // coverage:ignore-end

  /// Device id
  String? get deviceId => GetPlatform.isAndroid
      ? androidDeviceInfo?.id
      : iosDeviceInfo?.identifierForVendor;

  /// Device make brand
  String? get deviceMake =>
      GetPlatform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  /// Device Model
  String? get deviceModel => GetPlatform.isAndroid
      ? androidDeviceInfo?.model
      : iosDeviceInfo?.utsname.machine;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => GetPlatform.isAndroid ? '1' : '2';

  /// Device OS
  String get deviceOs => GetPlatform.isAndroid
      ? '${androidDeviceInfo?.version.codename}'
      : '${iosDeviceInfo?.systemVersion}';

  /// guest login
  Future<ResponseModel> guestLogin() async {
    var data = <String, dynamic>{
      'deviceId': deviceId,
      'deviceMake': deviceMake,
      'deviceModel': deviceModel,
      'deviceTypeCode': deviceTypeCode,
      'deviceOs': deviceOs,
      'appVersion': DeviceConstants.appVersion,
      'browserVersion': '1',
      'lat': 0,
      'long': 0
    };
    log(data.toString());
    var basicAuth =
        'Basic ${base64Encode(utf8.encode('instrucko:admin@instrucko.in'))}';
    return await apiWrapper.makeRequest(
      'guestLogin',
      Request.post,
      data,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': basicAuth,
        'lan': 'en',
      },
    );
  }

  /// Signup API
  ///
  /// // 1 - user, 2 - model
  Future<ResponseModel?> signupCreatorModel(
    String email,
    String password,
    String firstName,
    String lastName,
    String userName,
    String token,
    String countryCode,
    String phoneNumber,
    UserType userType,
    String profilePic,
    String dateOfBirth,
    Gender gender,
    String inviteReferralCode,
    String socialMediaLink,
    bool isNsfwAllow,
  ) async {
    var data = {
      'userType': userType == UserType.user ? 1 : 2,
      'firstName': firstName,
      'lastName': lastName,
      'username': userName,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'profilePic': userType == UserType.user
          ? ''
          : '61b0b19e618d793fda9753d0/profile/1639980943882.jpg',
      'dateOfBirth': userType == UserType.user ? '' : '1997/11/01',
      'gender': gender == Gender.male
          ? 'Male'
          : gender == Gender.female
              ? 'Female'
              : 'Others',
      'inviterReferralCode': 'UJ0OWX',
      'socialMediaLink': 'facebook.com',
      'isNSFWAllow': isNsfwAllow,
      'deviceId': deviceId,
      'deviceMake': deviceMake,
      'deviceModel': deviceModel,
      'deviceTypeCode': deviceTypeCode,
      'deviceOs': deviceOs,
      'browserVersion': '1'
    };
    return await apiWrapper.makeRequest(
      'signUp',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Login API
  Future<ResponseModel> loginUser(
    String email,
    String password,
    String token,
    LoginType loginType,
    String phoneNumber,
    String countryCode,
    String? googleId,
    String? verificationId,
    bool? loading,
    String? appleId,
  ) async {
    var data = <String, dynamic>{};

    switch (loginType) {
      case LoginType.email:
        data = <String, dynamic>{
          'loginType': 1,
          'email': email,
          'password': password,
          'deviceId': deviceId,
          'deviceMake': deviceMake,
          'deviceModel': deviceModel,
          'deviceTypeCode': deviceTypeCode,
          'deviceOs': deviceOs,
          'browserVersion': '1',
        };
        break;
      case LoginType.facebook:
        break;
      case LoginType.google:
        data = <String, dynamic>{
          'loginType': 3,
          'googleId': googleId,
          'email': email,
          'password': password,
          'deviceId': deviceId,
          'deviceMake': deviceMake,
          'deviceModel': deviceModel,
          'deviceTypeCode': deviceTypeCode,
          'deviceOs': deviceOs,
          'browserVersion': '1',
        };
        break;
      case LoginType.twitter:
        break;
      case LoginType.phoneNumber:
        data = <String, dynamic>{
          'loginType': 5,
          'countryCode': countryCode,
          'phoneNumber': phoneNumber,
          'verificationId': verificationId,
          'password': password,
          'deviceId': deviceId,
          'deviceMake': deviceMake,
          'deviceModel': deviceModel,
          'deviceTypeCode': deviceTypeCode,
          'deviceOs': deviceOs,
          'browserVersion': '1',
        };
        break;
      case LoginType.apple:
        data = <String, dynamic>{
          'loginType': 6,
          'appleId': appleId,
          'email': email,
          'deviceId': deviceId,
          'deviceMake': deviceMake,
          'deviceModel': deviceModel,
          'deviceTypeCode': deviceTypeCode,
          'deviceOs': deviceOs,
          'browserVersion': '1',
        };
        break;
    }

    // var data = loginType == LoginType.google
    //     ? {
    //         'loginType': 3,
    //         'googleId': googleId,
    //         'email': email,
    //         'password': password,
    //         'deviceId': deviceId,
    //         'deviceMake': deviceMake,
    //         'deviceModel': deviceModel,
    //         'deviceTypeCode': deviceTypeCode,
    //         'deviceOs': deviceOs,
    //         'browserVersion': '1',
    //       }
    //     : loginType != LoginType.phoneNumber
    //         ? {
    //             'loginType': loginType == LoginType.email
    //                 ? 1
    //                 : loginType == LoginType.facebook
    //                     ? 2
    //                     : loginType == LoginType.google
    //                         ? 3
    //                         : 4,
    //             'email': email,
    //             'password': password,
    //             'deviceId': deviceId,
    //             'deviceMake': deviceMake,
    //             'deviceModel': deviceModel,
    //             'deviceTypeCode': deviceTypeCode,
    //             'deviceOs': deviceOs,
    //             'browserVersion': '1',
    //           }
    //         : {
    //             'loginType': 5,
    //             'countryCode': countryCode,
    //             'phoneNumber': phoneNumber,
    //             'verificationId': verificationId,
    //             'password': password,
    //             'deviceId': deviceId,
    //             'deviceMake': deviceMake,
    //             'deviceModel': deviceModel,
    //             'deviceTypeCode': deviceTypeCode,
    //             'deviceOs': deviceOs,
    //             'browserVersion': '1',
    //           };
    return await apiWrapper.makeRequest(
      'login',
      Request.post,
      data,
      loading!,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Signup API
  Future<ResponseModel> signupUserModel({
    required SignUpType signUpType,
    required String email,
    required String password,
    required String googleId,
    required String facebookId,
    required String appleId,
    required String firstName,
    required String lastName,
    required String token,
    required String timezone,
    required String countryCode,
    required String phoneNumber,
    required String inviterReferralCode,
    required String countryCodeName,
  }) async {
    var data = <String, dynamic>{};

    var _signUpType = 1;

    if (inviterReferralCode.isEmpty) {
      data = <String, dynamic>{
        'signUpType': _signUpType,
        'userType': 2, // 2: For Parents
        'email': email,
        'password': password,
        'deviceId': deviceId,
        'deviceMake': deviceMake,
        'deviceModel': deviceModel,
        'deviceTypeCode': deviceTypeCode,
        'deviceOs': deviceOs,
        'browserVersion': '1',
        'timezone': timezone,
        'countryCode': countryCode,
        'phoneNumber': phoneNumber,
        'countryCodeName': countryCodeName,
      };
    } else {
      data = <String, dynamic>{
        'signUpType': _signUpType,
        'userType': 2, // 2: For Parents
        'email': email,
        'password': password,
        'deviceId': deviceId,
        'deviceMake': deviceMake,
        'deviceModel': deviceModel,
        'deviceTypeCode': deviceTypeCode,
        'deviceOs': deviceOs,
        'browserVersion': '1',
        'timezone': timezone,
        'countryCode': countryCode,
        'phoneNumber': phoneNumber,
        'inviterReferralCode': inviterReferralCode,
        'countryCodeName': countryCodeName,
      };
    }

    switch (signUpType) {
      case SignUpType.Apple:
        {
          _signUpType = 6;
          // data.putIfAbsent('appleId', () => appleId);
          data['signUpType'] = _signUpType;
          data['appleId'] = appleId;
          break;
        }
      case SignUpType.Google:
        {
          // data.putIfAbsent('googleId', () => googleId);
          _signUpType = 3;
          data['googleId'] = googleId;
          data['signUpType'] = _signUpType;
          break;
        }
      default:
        {
          _signUpType = 1;
          break;
        }
    }

    return await apiWrapper.makeRequest(
      'signUp',
      Request.post,
      data,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  ///Logout API
  Future<ResponseModel> logout(
    String authToken,
    String refreshToken,
  ) async {
    var data = {'refreshToken': refreshToken, 'deviceId': deviceId};
    return await apiWrapper.makeRequest(
      'signOut',
      Request.post,
      data,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': authToken,
        'lan': 'en',
      },
    );
  }

  /// Mark a student as default.
  ///
  Future<ResponseModel> markAStudentAsDefault({
    required String token,
    required String studentId,
    required bool markAsDefault,
    required bool isLoading,
  }) async {
    final data = {
      'studentId': studentId,
      'markAsDefault': markAsDefault,
    };
    return await apiWrapper.makeRequest(
      'student/markAsDefault',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to get reviewrating
  ///
  Future<ResponseModel> getRatings({
    required String token,
    required String linkedWith,
    required bool isLoading,
  }) async {
    var url = '';
    url = 'ratingParameters?linkedWith=$linkedWith';

    return await apiWrapper.makeRequest(
      url,
      Request.get,
      null,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to send message
  ///
  Future<ResponseModel> sendMessage({
    required String token,
    required SendMessage message,
    required bool isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'message/send',
        Request.post,
        message.toJson(),
        isLoading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
        },
      );

  /// API to get myClasses
  ///
  Future<ResponseModel> getMyClasses({
    required String token,
    required String filter,
    required bool loading,
    required int offset,
    required int limit,
  }) async {
    var url = '';
    url =
        'myClasses?offset=$offset&limit=$limit${filter.isNotEmpty ? '&filter=$filter' : ''}';

    return await apiWrapper.makeRequest(
      url,
      Request.get,
      null,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to patch virtual order.
  ///
  Future<ResponseModel> patchVirtualOrder({
    required String orderType,
    required String virtualOrderId,
    required String status,
    required String token,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'virtualOrder',
        Request.patch,
        {
          'orderType': orderType,
          'virtualOrderId': virtualOrderId,
          'status': status,
        },
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
        },
      );

  /// API to get myClasses Details
  ///
  Future<ResponseModel> getMyClassesDetails({
    required String token,
    required bool loading,
    required String classId,
  }) async {
    var url = '';
    url = 'myClasses/detail?classId=$classId';

    return await apiWrapper.makeRequest(
      url,
      Request.get,
      null,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to get previousTutor
  ///
  Future<ResponseModel> getPreviousTutorData({
    required String token,
    required bool loading,
    required String offset,
    required String limit,
    required String searchText,
    required String fromDate,
    required String toDate,
    required List<String> subjectId,
    required int rating,
  }) async {
    // var url = '';
    // url = 'previousTutor?searchText=$search&offset=$offset&limit=$limit';

    var url = '';

    if (searchText.isNotEmpty) {
      if (subjectId.isNotEmpty) {
        url =
            'previousTutor?offset=$offset&limit=$limit&subjectIds=${subjectId.join(',')}&searchText=$searchText${rating != 0 ? '&rating=$rating' : ''}';
      } else if (fromDate.isNotEmpty) {
        url =
            'previousTutor?offset=$offset&limit=$limit&fromDate=$fromDate&searchText=$searchText${rating != 0 ? '&rating=$rating' : ''}';
      } else if (fromDate.isNotEmpty && subjectId.isNotEmpty) {
        url =
            'previousTutor?offset=$offset&limit=$limit&fromDate=$fromDate&toDate=$toDate&subjectIds=${subjectId.join(',')}&searchText=$searchText${rating != 0 ? '&rating=$rating' : ''}';
      } else {
        url =
            'previousTutor?offset=$offset&limit=$limit&searchText=$searchText${rating != 0 ? '&rating=$rating' : ''}';
      }
    } else {
      if (subjectId.isNotEmpty) {
        url =
            'previousTutor?offset=$offset&limit=$limit&subjectIds=${subjectId.join(',')}${rating != 0 ? '&rating=$rating' : ''}';
      } else if (fromDate.isNotEmpty) {
        url =
            'previousTutor?offset=$offset&limit=$limit&fromDate=$fromDate${rating != 0 ? '&rating=$rating' : ''}';
      } else if (fromDate.isNotEmpty && subjectId.isNotEmpty) {
        url =
            'previousTutor?offset=$offset&limit=$limit&fromDate=$fromDate&toDate=$toDate&subjectIds=${subjectId.join(',')}${rating != 0 ? '&rating=$rating' : ''}';
      } else {
        url =
            'previousTutor?offset=$offset&limit=$limit${rating != 0 ? '&rating=$rating' : ''}';
      }
    }

    return await apiWrapper.makeRequest(
      url,
      Request.get,
      null,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Api to post review rating
  ///
  Future<ResponseModel> reviewRatingPost({
    required String token,
    required String virtualOrderId,
    required String linkedWith,
    // required String parameterId,
    // required double rating,
    required String review,
    required bool isLoading,
    required RateWithParameter ratingList,
  }) async {
    var data = {
      'virtualOrderId': virtualOrderId,
      'linkedWith': linkedWith,
      'ratings': ratingList.rating!.map((e) => e.toJson()).toList(),
      'review': review
    };
    return await apiWrapper.makeRequest(
      'reviewRating',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to get students
  ///
  Future<ResponseModel> getStudents({
    required String token,
    required String studentId,
    required bool isLoading,
    required int offset,
    required int limit,
    required int status,
  }) async {
    var url = '';
    if (studentId.isNotEmpty) {
      url =
          'students?offset=$offset&limit=$limit&status=$status&studentId=$studentId';
    } else {
      url = 'students?offset=$offset&limit=$limit&status=$status';
    }
    return await apiWrapper.makeRequest(
      url,
      Request.get,
      null,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to get learning objectives
  ///
  Future<ResponseModel> getLearningObjectives({
    required String token,
    required bool isLoading,
    required int offset,
    required int limit,
    required int status,
  }) async {
    final url = 'learningObjective?offset=$offset&limit=$limit&status=$status';
    return await apiWrapper.makeRequest(
      url,
      Request.get,
      null,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to get user notification count.
  Future<ResponseModel> getNotificationCount({
    required String authToken,
    required String appName,
  }) async =>
      await apiWrapper.makeRequest(
        'notificationCount',
        Request.get,
        null,
        false,
        {
          'Content-Type': 'application/json',
          'authorization': authToken,
          'appname': appName,
          'lan': 'en',
        },
      );

  /// Forgot Password API
  Future<ResponseModel> forgotPassword(
    String emailOrPhoneNo,
    EmailOrPhoneNoType type,
    String countryCode,
    String token,
  ) async {
    var data = {
      'emailOrPhone': emailOrPhoneNo,
      'type': type == EmailOrPhoneNoType.phoneNumber ? 1 : 2,
      'countryCode': countryCode
    };
    return await apiWrapper.makeRequest(
      'forgotPassword',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
        'platform': Utility.platFormType()
      },
    );
  }

  /// Check Username is valid or not (1-Signup, 2-Login)
  Future<ResponseModel> checkUsername(
    String trigger,
    String username,
    String token,
  ) async {
    var data = {'username': username, 'trigger': trigger};
    return await apiWrapper.makeRequest(
      'userName?username=$username&trigger=$trigger',
      Request.post,
      data,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Validate phone number - Api is being use for user can check phone number
  Future<ResponseModel> validatePhoneNumberApi(
    String phoneNumber,
    String countryCode,
    String token,
    String trigger,
    bool isLoading,
  ) async {
    var data = <String, dynamic>{};

    if (trigger.isEmpty) {
      data = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'countryCode': countryCode,
      };
    } else {
      data = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'countryCode': countryCode,
        'trigger': 'LOGIN'
      };
    }
    return await apiWrapper.makeRequest(
      'validatePhoneNumber',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Send Verification code
  Future<ResponseModel> sendVerificationCode(
    String phoneNumber,
    String countryCode,
    String userId,
    String trigger,
    bool isUpdatingPhoneNumber,
    String token,
    bool isLoading,
  ) async {
    var data = isUpdatingPhoneNumber
        ? {
            'phoneNumber': phoneNumber,
            'countryCode': countryCode,
            'trigger': trigger,
            'userId': userId
          }
        : {
            'phoneNumber': phoneNumber,
            'countryCode': countryCode,
            'trigger': trigger,
          };
    return await apiWrapper.makeRequest(
      'sendVerificationCode',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
        'platform': Utility.platFormType()
      },
    );
  }

  /// API to delete a student.
  ///
  Future<ResponseModel> deleteStudent({
    required String token,
    required String reason,
    required List<String> studentIds,
    required bool isLoading,
  }) async {
    final data = {
      'studentIds': studentIds,
      'reason': reason,
    };
    return await apiWrapper.makeRequest(
      'students',
      Request.delete,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to patch student details.
  ///
  Future<ResponseModel> patchStudent({
    required String studentId,
    required String parentId,
    required String avatarId,
    required String firstName,
    required String lastName,
    required String ageGroupId,
    required String birthDate,
    required String gender,
    required String profilePic,
    required String token,
    required List<String> subjectIds,
    required List<String> interestIds,
    required bool isLoading,
  }) async {
    final data = {
      'studentId': studentId,
      'parentId': parentId,
      'avatarId': avatarId,
      'firstName': firstName,
      'profilePic': profilePic,
      'lastName': lastName,
      'ageGroupId': ageGroupId,
      'dateOfBirth': birthDate,
      'gender': gender == 'preferNotToSay'.tr
          ? 'Other'
          : (gender == 'boy'.tr ? 'Male' : 'Female'),
      'subjectIds': subjectIds,
      'interestIds': interestIds,
    };
    return await apiWrapper.makeRequest(
      'students',
      Request.patch,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to post student details.
  ///
  Future<ResponseModel> postStudent({
    required String parentId,
    required String avatarId,
    required String firstName,
    required String lastName,
    required String ageGroupId,
    required String birthDate,
    required String profilePic,
    required String gender,
    required String token,
    required List<String> subjectIds,
    required List<String> interestIds,
    required bool isLoading,
  }) async {
    final data = {
      'parentId': parentId,
      'avatarId': avatarId,
      'firstName': firstName,
      'profilePic': profilePic,
      'lastName': lastName,
      'ageGroupId': ageGroupId,
      'dateOfBirth': birthDate,
      'gender': gender == 'preferNotToSay'.tr
          ? 'Other'
          : (gender == 'boy'.tr ? 'Male' : 'Female'),
      'subjectIds': subjectIds,
      'interestIds': interestIds,
    };
    return await apiWrapper.makeRequest(
      'students',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Validate Verification code
  Future<ResponseModel> validateVerificationCode(
    String phoneNumber,
    String countryCode,
    String trigger,
    String code,
    String verificationId,
    String token,
    bool loading,
  ) async {
    var data = {
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'trigger': trigger,
      'verificationId': verificationId,
      'code': code,
    };
    return await apiWrapper.makeRequest(
      'validateVerificationCode',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to HTML Pages.
  ///
  Future<ResponseModel> getHtmlPage({
    required int type,
    required String lan,
    required String token,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'htmlPage?type=$type&lan=$lan',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
        },
      );

  /// API to get favourites
  ///
  Future<ResponseModel> getFavourites({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'posts/likes?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
        },
      );

  /// API to get subjects
  ///
  Future<ResponseModel> getSubjects({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
    required String dateOfBirth,
  }) async =>
      await apiWrapper.makeRequest(
        'subjectToAgeGroup?offset=$offset&limit=$limit&dateOfBirth=$dateOfBirth',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
        },
      );

  /// API to get avatars
  ///
  Future<ResponseModel> getProfileAvatars({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'profileAvatars?offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
        },
      );

  /// API to get interests
  ///
  Future<ResponseModel> getInterests({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'interest?offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
        },
      );

  /// Resend Verification Code
  Future<ResponseModel> resendVerificationCode(
    String emailOrPhone,
    EmailOrPhoneNoType type,
    String countryCode,
    String trigger,
    String token,
  ) async {
    var data = <String, dynamic>{};
    if (countryCode.isNotEmpty) {
      data = <String, dynamic>{
        'emailOrPhone': emailOrPhone,
        'type': type == EmailOrPhoneNoType.phoneNumber ? 1 : 2,
        'countryCode': countryCode,
        'trigger': trigger,
      };
    } else {
      data = <String, dynamic>{
        'emailOrPhone': emailOrPhone,
        'type': type == EmailOrPhoneNoType.phoneNumber ? 1 : 2,
        'trigger': trigger,
      };
    }

    // var data = {
    //   'emailOrPhone': emailOrPhone,
    //   'type': type == EmailOrPhoneNoType.phoneNumber ? 1 : 2,
    //   'countryCode': countryCode,
    //   'trigger': trigger,
    // };
    var res = await apiWrapper.makeRequest(
      'resendVerificationCode',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
        'platform': Utility.platFormType()
      },
    );
    return res;
  }

  /// Instant Class Request
  ///
  Future<ResponseModel> instantClassRequest({
    required ClassRequestBody classRequest,
    required String token,
  }) async =>
      await apiWrapper.makeRequest(
        'instant_class_request/',
        Request.post,
        classRequest.toJson(),
        true,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
          'timezone': 'Asia/Kolkata',
        },
      );

  /// Instant Class Status
  ///
  Future<ResponseModel> instantClassStatus({
    required String parentId,
    required String childId,
    required String token,
    required int status,
    required bool isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'instant_class_status?parentId=$parentId&childId=$childId&status=$status',
        Request.get,
        null,
        isLoading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': 'en',
          'timezone': 'Asia/Kolkata',
        },
      );

  /// Validate Email
  Future<ResponseModel> validateEmail(
    String emailId,
    TypeOfEntry type,
    String token,
    bool isLoading,
  ) async {
    var data = {
      'type': type == TypeOfEntry.login ? '1' : '2',
      'email': emailId,
    };
    return await apiWrapper.makeRequest(
      'validateEmail',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Config App
  ///
  Future<ResponseModel> config(
    String token,
  ) async {
    var res = await apiWrapper.makeRequest(
      'config',
      Request.get,
      null,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
    return res;
  }

  Future<ResponseModel> socialVerify(
      {required String token,
      required bool loading,
      required String langCode,
      required SocialType type,
      required String id,
      required SocialTrigger trigger}) async {
    var data = {
      'id': id,
      'trigger': trigger == SocialTrigger.facebook
          ? 1
          : trigger == SocialTrigger.google
              ? 2
              : 3,
      'type': type == SocialType.LINK ? 'LINK' : 'UNLINK'
    };

    if (id.isEmpty) {
      data.remove('id');
    }

    return await apiWrapper.makeRequest(
      'socialVerify',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': langCode,
      },
    );
  }

  // Future<ResponseModel> shorten() async {
  //   final data = {
  //     'long_url': 'https://fanzly.app/post/61b0b65abe48baa6c36f2ddc/BAVPRP',
  //     'domain': 'bit.ly'
  //   };
  // }

  /// API to get the cognito auth token
  Future<ResponseModel> getCognitoToken(
          {required String token, required bool loading}) async =>
      await apiWrapper.makeRequest(
        'cognitoToken',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to get the cognito identity
  Future<ResponseModel> getCognitoIdentity({
    required bool loading,
    required String region,
    required String identityId,
    required String cognitoToken,
  }) async {
    var response = await _dio.post<String>(
      'https://cognito-identity.$region.amazonaws.com/',
      data:
          '''{"IdentityId":"$identityId","Logins":{"cognito-identity.amazonaws.com":"$cognitoToken"}}''',
      options: Options(
        headers: <String, dynamic>{
          'content-type': 'application/x-amz-json-1.1',
          'x-amz-target': 'AWSCognitoIdentityService.GetCredentialsForIdentity',
        },
      ),
    );
    return ResponseModel(
      data: response.data!,
      hasError: false,
    );
  }

  /// API to search a model by the name
  Future<ResponseModel> searchModel(
          {required String token,
          required String lan,
          required String searchText,
          required String offset,
          required String limit,
          required bool loading}) async =>
      await apiWrapper.makeRequest(
        'models/search?searchText=$searchText&offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan
        },
      );

  /// API to get the popular posts
  Future<ResponseModel> getPopularPosts(
          {required String token,
          required String lan,
          required bool loading,
          required String pageNumber}) async =>
      await apiWrapper.makeRequest(
        'popularPosts/?page=$pageNumber',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan
        },
      );

  /// API to get the Banners
  Future<ResponseModel> getBanners({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
  }) async =>
      await apiWrapper.makeRequest(
        'banner',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to get the purchased posts
  Future<ResponseModel> getPurchasedPosts({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String limit,
    required String offset,
  }) async =>
      await apiWrapper.makeRequest(
        'posts/purchase?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to get the popular hashtags
  Future<ResponseModel> getPopularHashtags({
    required String token,
    required String lan,
    required bool loading,
    int? set,
    int? limit,
    int? postLimit,
  }) async {
    var param = 'popularHashTags';

    if (set != null || limit != null || postLimit != null) {
      param = '$param?';
      param =
          '$param${set != null ? '/set=$set' : ''}${limit != null ? '&limit=$limit' : ''}${postLimit != null ? '&postLimit=$postLimit' : ''}';
    }

    return await apiWrapper.makeRequest(
      '$param',
      Request.get,
      null,
      loading,
      {'Content-Type': 'application/json', 'authorization': token, 'lan': lan},
    );
  }

  /// API to get the IP of the user
  Future<String> getIp() async {
    var ip = '';
    if (await Utility.isNetworkAvailable()) {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          ip = addr.address;
          // print(
          //     '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
        }
      }
      // var response = await _dio.get<String>('https://api.ipify.org');
      return ip.isNotEmpty ? ip : '0.0.0.0';
    }
    return '0.0.0.0';
  }

  /// API to get the user profile
  Future<ResponseModel> getProfile({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String userId,
    required String status,
  }) async {
    final res = await apiWrapper.makeRequest(
      'profile?userId=$userId&status=$status',
      Request.get,
      null,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        // 'lan': lan,
        // 'city': city,
        // 'country': country,
        'ipaddress': ipAddress,
        // 'latitude': lat,
        // 'longitude': lng,
        // 'platform': deviceTypeCode,
      },
    );
    return res;
  }

  /// API to get the user profile
  Future<ResponseModel> getUserProfile({
    required String token,
    required String lan,
    required bool loading,
    required String userId,
    required String status,
  }) async {
    final res = await apiWrapper.makeRequest(
      'profile?userId=$userId&status=$status',
      Request.get,
      null,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
    return res;
  }

  /// API to get the featured creators
  Future<ResponseModel> getFeaturedCreators(
          {required String token,
          required String lan,
          required String countryName,
          required bool loading,
          required int offset,
          required int limit,
          required String searchText}) async =>
      await apiWrapper.makeRequest(
        'featureCreator?limit=$limit&offset=$offset&countryName=$countryName&searchText=$searchText',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan
        },
      );

  /// API to get the list of popular models
  Future<ResponseModel> getPopularModels({
    required String token,
    required bool loading,
    required String searchText,
    required String skip,
    required String limit,
    required String userId,
  }) async =>
      await apiWrapper.makeRequest(
        'popularModels/?search=$searchText&skip=$skip&limit=$limit&userId=$userId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to get the notifications
  Future<ResponseModel> getNotification({
    required String token,
    required bool loading,
    required int skip,
    required String appName,
    required int limit,
  }) async =>
      await apiWrapper.makeRequest(
        'notifications?skip=$skip&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'appname': appName,
        },
      );

  /// API to get the Learning Objective By Subject
  Future<ResponseModel> getLearningObjectiveBySubject({
    required String token,
    required bool loading,
    required List<String> subjectIds,
    required String ageGroupId,
  }) async =>
      await apiWrapper.makeRequest(
        'learningObjectiveBySubject',
        Request.post,
        {
          'ageGroupId': ageGroupId,
          'subjectIds': subjectIds,
        },
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to like a post
  Future<ResponseModel> likeDislikePost({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String userId,
    required String assetId,
    required bool like,
  }) async {
    var data = {'userId': userId, 'assetid': assetId, 'like': like};

    return await apiWrapper.makeRequest(
      'likesDislikeAsset/',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to get a list of like dislike
  Future<ResponseModel> getLikeDislike({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String lat,
    required String lng,
    required String assetId,
    required String userId,
    required String limit,
    required String offset,
  }) async =>
      await apiWrapper.makeRequest(
        'likesDislikeAsset/?skip=$offset&limit=$limit&assetId=$assetId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'assetId': assetId,
          'userId': userId,
        },
      );

  /// API to bookmark a post
  Future<ResponseModel> bookmarkPost({
    required String token,
    required String postId,
    required String collectionId,
    required bool loading,
  }) async {
    var data = {'postId': postId, 'collectionId': collectionId};
    return await apiWrapper.makeRequest(
      'bookmark',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to post documents.
  Future<ResponseModel> postDocuments({
    required String token,
    required bool loading,
    required String backImage,
    required String documentTypeId,
    required String frontImage,
    required String userId,
  }) async {
    var data = {
      'userId': '$userId',
      'documentTypeId': '$documentTypeId',
      'frontImage': '$frontImage',
      'backImage': '$backImage'
    };
    return await apiWrapper.makeRequest(
      'uploadDocuments',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to create a new collection
  Future<ResponseModel> createCollection({
    required String token,
    required String coverImage,
    required String title,
    required bool loading,
  }) async {
    var data = <String, dynamic>{};
    if (coverImage.isEmpty) {
      data = <String, dynamic>{'title': title};
    } else {
      data = <String, dynamic>{'title': '$title', 'coverImage': '$coverImage'};
    }
    return await apiWrapper.makeRequest(
      'collection',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to get list of collections
  Future<ResponseModel> getCollections({
    required String token,
    required String limit,
    required String offset,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'collection?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to unBookmark a post
  Future<ResponseModel> unBookmark({
    required String token,
    required String collectionId,
    required bool isCollection,
    required List<String> postIds,
    required bool loading,
  }) async {
    var data = <String, dynamic>{};

    if (isCollection) {
      data = <String, dynamic>{
        'postIds': postIds,
        'isCollection': isCollection,
        'collectionId': collectionId,
      };
    } else {
      data = <String, dynamic>{
        'postIds': postIds,
        'isCollection': isCollection,
      };
    }
    return await apiWrapper.makeRequest(
      'bookmark',
      Request.delete,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to bookmark a post
  Future<ResponseModel> bookmarkPosts({
    required String token,
    required String collectionId,
    required List<String> postIds,
    required bool loading,
  }) async {
    var data = {'postId': postIds.join(','), 'collectionId': collectionId};
    return await apiWrapper.makeRequest(
      'bookmark',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to delete a collection
  Future<ResponseModel> deleteCollection({
    required String token,
    required bool isCollection,
    required String collectionId,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'collection?collectionId=$collectionId&isCollection=$isCollection',
        Request.delete,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to get a list of reasons to report
  Future<ResponseModel> getReasonsToReport({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String type,
  }) async =>
      await apiWrapper.makeRequest(
        'reasons?type=$type',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to report a post
  Future<ResponseModel> reportAPost({
    required String token,
    required String reportType,
    required String reportedId,
    required String reason,
    required bool loading,
  }) async {
    var data = {
      'reportType': reportType,
      'reportedId': reportedId,
      'reason': reason
    };
    return await apiWrapper.makeRequest(
      'report',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to add a comment on a post
  Future<ResponseModel> addComment({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String comment,
    required String assetId,
  }) async {
    var data = {'comments': comment, 'assetId': assetId};
    return await apiWrapper.makeRequest(
      'comments/',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to get the list of people who have commented on a post
  Future<ResponseModel> getCommentList({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String limit,
    required String skip,
    required String assetId,
  }) async =>
      await apiWrapper.makeRequest(
        'comments/?limit=$limit&skip=$skip&assetId=$assetId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to get the list of people who have commented on a post
  Future<ResponseModel> userLikedPosts({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String limit,
    required String offset,
  }) async =>
      await apiWrapper.makeRequest(
        'posts/likes?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to edit User Profile.
  Future<ResponseModel> editUserProfile({
    required String token,
    required String lan,
    required String bannerImage,
    required String profilePic,
    required String bio,
    required String firstName,
    required String lastName,
    required bool isNSFWAllow,
    required bool isLoading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String price,
    required String currencyCode,
    required String currencySymbol,
    required String timezone,
    required dynamic socialMediaLink,
  }) async {
    var data = <dynamic, dynamic>{};

    data = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'profilePic': profilePic,
      'bio': bio,
      'timezone': timezone
    };

    // if (price.isEmpty && currencySymbol.isEmpty) {
    //   data = <dynamic, dynamic>{
    //     'firstName': firstName,
    //     'lastName': lastName,
    //     'profilePic': lastName,
    //     'bio': lastName,
    //     'bannerImage': bannerImage,
    //     'isNSFWAllow': isNSFWAllow,
    //     'socialMediaLink': socialMediaLink as Map,
    //     'timezone': timezone,
    //   };
    // } else {
    //   data = <dynamic, dynamic>{
    //     'firstName': firstName,
    //     'lastName': lastName,
    //     'profilePic': profilePic,
    //     'bio': bio,
    //     'bannerImage': bannerImage,
    //     'isNSFWAllow': isNSFWAllow,
    //     'shoutoutPrice': {
    //       'price': price,
    //       'currencyCode': currencyCode,
    //       'currencySymbol': currencySymbol
    //     },
    //     'socialMediaLink': socialMediaLink as Map,
    //   };
    // }
    return await apiWrapper.makeRequest(
      'profile',
      Request.patch,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to get the count of followers and following of a user
  Future<ResponseModel> getFollowCount({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String userId,
  }) async =>
      await apiWrapper.makeRequest(
        'follow/count?userId=$userId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to follow a user/model
  Future<ResponseModel> followUser({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String userIdToFollow,
  }) async {
    var data = {'followingId': userIdToFollow};
    return await apiWrapper.makeRequest(
      'follow',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to follow a hashtag
  Future<ResponseModel> followHashTag({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String hashTag,
    required String trigger,
  }) async {
    var data = {
      'hashTag': '$hashTag',
      'trigger': '$trigger',
    };
    return await apiWrapper.makeRequest(
      'hashtag/follow',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to follow a user/model
  Future<ResponseModel> unfollowUser({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String userIdToFollow,
  }) async {
    var data = {'followingId': userIdToFollow};
    return await apiWrapper.makeRequest(
      'unfollow',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to get list of saved addresses
  Future<ResponseModel> getUserSavedAddresses({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
  }) async =>
      await apiWrapper.makeRequest(
        'address',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to save an address
  Future<ResponseModel> saveAddress({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String bodyAddress,
    required String bodyState,
    required String bodyCity,
    required String bodyZipCode,
    required String bodyCountry,
    required double bodyLat,
    required double bodyLng,
    required String bodyNote,
  }) async {
    var data = {
      'address': bodyAddress,
      'state': bodyState,
      'city': bodyCity,
      'zipCode': bodyZipCode,
      'country': bodyCountry,
      'lat': bodyLat,
      'long': bodyLng,
      'note': bodyNote
    };
    return await apiWrapper.makeRequest(
      'address',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to list the stories
  Future<ResponseModel> stories({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String limit,
    required String offset,
  }) async =>
      await apiWrapper.makeRequest(
        'stories?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to get the data of a particular story
  Future<ResponseModel> storyData({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String userId,
  }) async =>
      await apiWrapper.makeRequest(
        'stories/detail?userId=$userId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': deviceTypeCode,
        },
      );

  /// API to view a creator's story
  Future<ResponseModel> viewStory({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String storyId,
  }) async {
    var data = {'storyId': storyId};
    return await apiWrapper.makeRequest(
      'story/views',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to update password
  Future<ResponseModel> updatePassword({
    required String token,
    required String lan,
    required String city,
    required String country,
    required String ipAddress,
    required String lat,
    required String lng,
    required bool loading,
    required String oldPassword,
    required String newPassword,
  }) async {
    var data = {'currentPassword': oldPassword, 'newPassword': newPassword};
    return await apiWrapper.makeRequest(
      'password',
      Request.patch,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': deviceTypeCode,
      },
    );
  }

  /// user Account Delete api (Deactivate Account)
  Future<ResponseModel> deactivateAccount({
    required String token,
    required String lan,
    required bool deleteConfirmation,
    required String id,
    required String reason,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'userAccount?deleteConfirmation=$deleteConfirmation&id=$id&reason=$reason',
        Request.delete,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
        },
      );

  /// API to patch email
  Future<ResponseModel> patchEmail({
    required String token,
    required String lan,
    required String newEmail,
    required bool loading,
  }) async {
    var data = {
      'newEmail': newEmail,
    };
    return await apiWrapper.makeRequest(
      'email',
      Request.patch,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to get followings
  Future<ResponseModel> getFollowing({
    required String token,
    required String lan,
    required String city,
    required String country,
    required String ipAddress,
    required String lat,
    required String lng,
    required bool loading,
    required int limit,
    required int offset,
    required String userId,
  }) async =>
      await apiWrapper.makeRequest(
        'follow?offset=$offset&limit=$limit&trigger=FOLLOWING&userId=$userId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to get followers
  Future<ResponseModel> getFollowers({
    required String token,
    required String lan,
    required String city,
    required String country,
    required String ipAddress,
    required String lat,
    required String lng,
    required bool loading,
    required int limit,
    required int offset,
    required String userId,
  }) async =>
      await apiWrapper.makeRequest(
        'follow?offset=$offset&limit=$limit&trigger=FOLLOWER&userId=$userId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to patch default address
  Future<ResponseModel> patchDefaultAddress({
    required String token,
    required String lan,
    required String city,
    required String country,
    required String ipaddress,
    required String latitude,
    required String longitude,
    required String platform,
    required String addressId,
    required bool loading,
  }) async {
    var data = {
      'addressId': addressId,
    };
    return await apiWrapper.makeRequest(
      'address/default',
      Request.patch,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipaddress,
        'latitude': latitude,
        'longitude': longitude,
        'platform': deviceTypeCode,
      },
    );
  }

  /// API to delete address
  Future<ResponseModel> deleteAddress({
    required String token,
    required String lan,
    required String city,
    required String country,
    required String ipaddress,
    required String latitude,
    required String longitude,
    required String platform,
    required String addressId,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'address?addressId=$addressId',
        Request.delete,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipaddress,
          'latitude': latitude,
          'longitude': longitude,
          'platform': deviceTypeCode,
        },
      );

  /// API to delete asset.
  ///
  Future<ResponseModel> deleteAsset({
    required String token,
    required bool loading,
    required int status,
    required List<String> postIds,
  }) async =>
      await apiWrapper.makeRequest(
        'assets/',
        Request.delete,
        {
          'status': status,
          'postId': postIds,
        },
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to get Latest posts
  Future<ResponseModel> getLatestPosts({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
  }) async =>
      await apiWrapper.makeRequest(
        'posts?filter=LATEST&offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'appname': 'Fanzly',
        },
      );

  /// API to get Collection Details posts
  Future<ResponseModel> getCollectionDetails({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
    required String collectionId,
  }) async {
    final data = (collectionId.isEmpty || collectionId == 'all')
        ? ''
        : '&collectionId=$collectionId';
    return await apiWrapper.makeRequest(
      'posts/bookmark?limit=$limit&offset=$offset$data',
      Request.get,
      null,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to get bookmarks
  Future<ResponseModel> getBookmarks({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
  }) async =>
      await apiWrapper.makeRequest(
        'posts/bookmark?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to edit an address
  Future<ResponseModel> editAddress({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String platform,
    required String bodyAddress,
    required String bodyState,
    required String bodyCity,
    required String bodyZipCode,
    required String bodyCountry,
    required double bodyLat,
    required double bodyLng,
    required String bodyNote,
    required String addressId,
  }) async {
    var data = {
      'address': bodyAddress,
      'state': bodyState,
      'city': bodyCity,
      'zipCode': bodyZipCode,
      'country': bodyCountry,
      'lat': bodyLat,
      'long': bodyLng,
      'note': bodyNote,
      'addressId': addressId,
    };
    return await apiWrapper.makeRequest(
      'address',
      Request.patch,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': platform,
      },
    );
  }

  /// API  to get featured collection
  Future<ResponseModel> getFeaturedCollection({
    required String token,
    required String userId,
    required bool loading,
    required String limit,
    required String offset,
  }) async =>
      await apiWrapper.makeRequest(
        'featuredCollection?userId=$userId&offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API  to get collection Info
  Future<ResponseModel> getCollectionInfo({
    required String token,
    required String collectionId,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'collection?limit=1&offset=0&collectionId=$collectionId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to patch collection Info
  Future<ResponseModel> patchCollection({
    required String token,
    required String collectionId,
    required String collectionName,
    required bool loading,
    required String collectionCover,
  }) async {
    var data = <String, dynamic>{};
    if (collectionCover.isEmpty) {
      data = <String, dynamic>{
        'title': '$collectionName',
        'collectionId': '$collectionId',
      };
    } else {
      data = <String, dynamic>{
        'title': '$collectionName',
        'collectionId': '$collectionId',
        'coverImage': '$collectionCover',
      };
    }
    return await apiWrapper.makeRequest(
      'collection',
      Request.patch,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  ///API to get the preSignedUrl in order to upload the image to AWS
  Future<ResponseModel> getPreSignedUrl({
    required bool loading,
    required String folder,
    required String fileName,
    required String token,
    required String bucketName,
  }) async {
    final mimeType = lookupMimeType(fileName);

    var data = {
      'folder': folder,
      'fileName': fileName,
      'bucket': bucketName,
      'contentType': '$mimeType',
    };
    return await apiWrapper.makeRequest(
      'aws/presigneUrl',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  ///API to get the hashtags
  Future<ResponseModel> hashtags({
    required bool loading,
    required String hashtag,
    required String pageNumber,
    required String token,
  }) async =>
      await apiWrapper.makeRequest(
        'assets/?hashtag=$hashtag&page=$pageNumber',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  ///API to get the User's Assets
  Future<ResponseModel> getUserAssets({
    required bool loading,
    required String userId,
    required String pageNumber,
    required String status,
    required String token,
  }) async =>
      await apiWrapper.makeRequest(
        'assets/?page=$pageNumber&userId=$userId&status=$status',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  ///API to get the User's Locked Assets
  Future<ResponseModel> getUserLockedAssets({
    required bool loading,
    required String userId,
    required String pageNumber,
    required String status,
    required String token,
    required String postType,
  }) async =>
      await apiWrapper.makeRequest(
        'assets/?page=$pageNumber&userId=$userId&status=$status&postType=$postType',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  ///API to get the User's Locked Assets
  Future<ResponseModel> getUserLockedPosts({
    required bool loading,
    required int limit,
    required int offset,
    required String token,
  }) async =>
      await apiWrapper.makeRequest(
        'posts/locked?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  ///API to upload file to aws
  Future<ResponseModel> uploadFileToAws(
          {required bool loading,
          required dynamic file,
          required String token,
          required String url}) async =>
      await apiWrapper.makeRequest(
        url,
        Request.awsUpload,
        file,
        loading,
        {},
      );

  /// API to Get active stories
  Future<ResponseModel> getActiveStories({
    required bool loading,
    required String token,
  }) async =>
      await apiWrapper.makeRequest(
        'story/active',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to Get types of document.
  Future<ResponseModel> getDocumentTypes({
    required bool loading,
    required String token,
  }) async =>
      await apiWrapper.makeRequest(
        'documentType',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to Delete active story
  Future<ResponseModel> deleteActiveStory({
    required bool loading,
    required String token,
    required String storyId,
    required bool isFullStory,
  }) async =>
      await apiWrapper.makeRequest(
        'story?storyId=$storyId&isFullStory=$isFullStory',
        Request.delete,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to get blocked users
  Future<ResponseModel> getBlockedUsers({
    required bool loading,
    required String token,
    required int limit,
    required int offset,
  }) async =>
      await apiWrapper.makeRequest(
        'block/list?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to block/Unblock a user.
  Future<ResponseModel> blockUnblockUser({
    required bool loading,
    required String token,
    required String opponentUserId,
    required String trigger,
  }) async {
    final data = {
      'opponentUserId': '$opponentUserId',
      'trigger': '$trigger',
    };
    return await apiWrapper.makeRequest(
      'user/blockUnblock',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );
  }

  ///API to post the story
  Future<ResponseModel> postStory(
      {required bool loading,
      required int storyType,
      required List<StoryDataPost> storyData,
      required String token,
      required String currencyCode,
      required String currencySymbol}) async {
    var data = {
      'storyType': storyType,
      'storyData': storyData,
      'currency': {
        'currency_code': currencyCode,
        'symbol': currencySymbol == '\$' ? '\$' : currencySymbol
      }
    };
    return await apiWrapper.makeRequest(
      'story',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  ///API to post the asset
  Future<ResponseModel> postAsset(
      {required String assetType,
      required int postType,
      required String postedOn,
      required String userId,
      required String description,
      required bool sharedOnGroupFeed,
      required bool loading,
      required bool isValidPrice,
      required List<StoryDataPost> postData,
      required List<String> taggedUserIds,
      required int? videoDuration,
      required int mediaCount,
      required int mediaType,
      required bool sharedOnStory,
      required bool sharedOnPersonalFeed,
      required String token,
      required String currencyCode,
      required String postTo,
      required String currencySymbol}) async {
    final data = {
      'assetType': assetType,
      'postedOn': postedOn,
      'userId': userId,
      'sharedOnGroupFeed': sharedOnGroupFeed,
      'platform': Utility.platFormType(),
      'currency': {
        'currency_code': currencyCode,
        'symbol': currencySymbol == '\$' ? '\$' : currencySymbol
      },
      'postData': postData,
      'taggedUserIds': taggedUserIds,
      'videoDuration': videoDuration,
      'sharedOnStory': sharedOnStory,
      'sharedOnPersonalFeed': sharedOnPersonalFeed,
      'postTo': postTo,
      'postType': postType,
      'isValidPrice': isValidPrice,
      'description': description,
      'mediaCount': mediaCount,
      'mediaType': mediaType
    };
    log(data.toString());
    return await apiWrapper.makeRequest(
      'assets/',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to Refresh Token
  Future<ResponseModel> refreshToken({
    required String token,
    required String lan,
    required bool loading,
    required String refreshToken,
    required String accessToken,
  }) async {
    var data = {
      'refreshToken': refreshToken,
      'accessToken': accessToken,
    };
    final res = await apiWrapper.makeRequest(
      'refreshToken',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
    return res;
  }

  ///API to get the Orders
  Future<ResponseModel> getMyOrders({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String platform,
    required String trigger,
    required int limit,
    required int offset,
  }) async =>
      await apiWrapper.makeRequest(
        'virtualOrder?trigger=$trigger&offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': platform,
        },
      );

  ///API to get the subscribers list
  Future<ResponseModel> getMySubscribers({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String platform,
    required int limit,
    required int offset,
  }) async =>
      await apiWrapper.makeRequest(
        'mySubscribers?offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': platform,
        },
      );

  ///API to get the languages
  Future<ResponseModel> getLanguages({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String platform,
  }) async =>
      await apiWrapper.makeRequest(
        'languages',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': platform,
        },
      );

  ///API to Post Report A Problem
  Future<ResponseModel> postReportAProblem({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String platform,
    required String problemText,
    required List<String> problemImages,
  }) async {
    var data = {
      'problemText': problemText,
      'attachments': problemImages,
    };
    // var data = {
    //   'problemText': problemText,

    // };
    return await apiWrapper.makeRequest(
      'reportProblem',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
        'city': city,
        'country': country,
        'ipaddress': ipAddress,
        'latitude': lat,
        'longitude': lng,
        'platform': platform,
      },
    );
  }

  ///API to get the Billing History
  Future<ResponseModel> getBillingHistory({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String platform,
    required String billingType,
    required int offSet,
    required int limit,
  }) async =>
      await apiWrapper.makeRequest(
        'billing?billingType=$billingType&offset=$offSet&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': platform,
        },
      );

  ///API to Get FAQ
  Future<ResponseModel> getFAQ({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String platform,
    required String userType,
  }) async =>
      await apiWrapper.makeRequest(
        'faq?userType=$userType',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': platform,
        },
      );

  ///API to Get Wallet
  Future<ResponseModel> getWallet({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String userType,
    required String userId,
    required String platform,
  }) async =>
      await apiWrapper.makeRequest(
        'wallet?userType=$userType&userId=$userId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': platform,
        },
      );

  ///API to Get Wallet Transaction
  Future<ResponseModel> getWalletTransaction({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String walletId,
    required String platform,
    required int fetchSize,
    required String txnType,
  }) async =>
      await apiWrapper.makeRequest(
        'walletTransaction?walletId=$walletId&fetchSize=$fetchSize&txnType=$txnType',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': platform,
        },
      );

  /// API to post wallet
  ///
  Future<ResponseModel> postWallet({
    required String userId,
    required String userType,
    required String currency,
    required String token,
    required bool isLoading,
  }) async {
    final data = {
      'userId': userId,
      'userType': userType,
      'currency': currency,
    };
    return await apiWrapper.makeRequest(
      'wallet',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  ///API to Get MySubscriptions
  Future<ResponseModel> getMySubscriptions({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String status,
    required int offset,
    required int limit,
    required String platform,
  }) async =>
      await apiWrapper.makeRequest(
        'mySubscriptions?status=$status&offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': platform,
        },
      );

  ///API to Get type of models
  Future<ResponseModel> getCreatorType(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required int offset,
          required int limit}) async =>
      await apiWrapper.makeRequest(
        'group?offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': Utility.platFormType(),
        },
      );

  ///API to Get age group
  Future<ResponseModel> getAgeGroup(
          {required String token,
          required String lan,
          required bool loading,
          required String offset,
          required String limit}) async =>
      await apiWrapper.makeRequest(
        'ageGroups?offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan
        },
      );

  ///API to get video call reasons
  ///
  Future<ResponseModel> getReasons({
    required String token,
    required String lan,
    required int type,
  }) async =>
      await apiWrapper.makeRequest(
        '/reasons?type=$type',
        Request.get,
        null,
        false,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan
        },
      );

  // Api is use to user can recharge wallet
  //
  Future<ResponseModel> rechargeWallet({
    required String token,
    required String lan,
    required String paymentMethod,
    required String pgLinkId,
    required int type,
    required num amount,
    required bool isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'wallet/recharge',
        Request.post,
        {
          'paymentMethod': paymentMethod,
          'pgLinkId': pgLinkId,
          'type': type,
          'amount': amount,
        },
        isLoading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan
        },
      );

  ///API to get the Country link
  ///
  Future<ResponseModel> getCountryLink({
    required String token,
    required String lan,
    required bool loading,
    required String countryCode,
  }) async =>
      await apiWrapper.makeRequest(
        'country/link?countryCode=$countryCode',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
        },
      );

  ///Api to post cancel class
  ///
  Future<ResponseModel> cancelClass({
    required String token,
    required String lan,
    required String classId,
    required String reason,
    required bool isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'cancle_class/',
        Request.post,
        {
          'class_id': classId,
          'reason': reason,
        },
        isLoading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
        },
      );

  /// API to get teacher count
  ///
  Future<ResponseModel> getTeacherCount({
    required String token,
    required String lan,
    required String ageGroupId,
    required String subjectId,
    required String countryCode,
    required List<String> learnObjectivesIds,
    required bool isLoading,
  }) async =>
      await apiWrapper.makeRequest(
        'get_teacher_count/',
        Request.post,
        {
          'ageGroupId': ageGroupId,
          'subjectId': subjectId,
          'learnObjectivesIds': learnObjectivesIds,
          'countryCode': countryCode,
        },
        isLoading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'timezone': 'Asia/Kolkata',
          'lan': lan,
        },
      );

  /// API to get messages
  Future<ResponseModel?> getMessages({
    required String authorization,
    required String langCode,
    required String chatId,
    required String timeStamp,
    int? pageSize,
  }) async {
    var res = await apiWrapper.makeRequest(
      'messages?chatId=$chatId&timestamp=$timeStamp',
      Request.get,
      null,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': authorization,
        'lan': langCode,
      },
    );
    return res;
  }

  /// API to get unread count
  Future<ResponseModel?> getUnreadCount({
    required String authorization,
    required String lan,
    required String chatId,
    required bool loading,
  }) async {
    var url = '';
    if (chatId.isEmpty) {
      url = 'chat/unreadCount';
    } else {
      url = 'chat/unreadCount?chatId=$chatId';
    }
    var res = await apiWrapper.makeRequest(
      url,
      Request.get,
      null,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': authorization,
        'lan': lan,
      },
    );
    return res;
  }

  /// API to post message acknowledge
  Future<ResponseModel> postAcknowledge({
    required String authorization,
    required String lan,
    required String chatId,
    required num status,
  }) async =>
      await apiWrapper.makeRequest(
        'message/acknowledge',
        Request.post,
        {
          'chatId': '$chatId',
          'status': status,
        },
        false,
        {
          'Content-Type': 'application/json',
          'authorization': authorization,
          'lan': lan,
        },
      );

  /// API to delete a chat
  Future<ResponseModel?> deleteChat({
    required String authorization,
    required String langCode,
    required String chatID,
  }) async {
    final data = {
      'chatId': chatID,
    };

    return await apiWrapper.makeRequest(
      'chats',
      Request.delete,
      data,
      true,
      {
        'authorization': authorization,
        'lan': langCode,
      },
    );
  }

  /// API to get the chat media
  Future<ResponseModel?> chatMediaDoc({
    required String authorization,
    required String langCode,
    required String chatId,
  }) async =>
      await apiWrapper.makeRequest(
        'chatMediaDoc?chatId=$chatId',
        Request.get,
        null,
        true,
        {
          'authorization': authorization,
          'lan': langCode,
        },
      );

  /// API to mark a teacher as favorite or unfavorite
  Future<ResponseModel> markAsFavUnFav({
    required String authorization,
    required String langCode,
    required String parentId,
    required String trigger,
  }) async {
    final data = {'creatorId': parentId, 'trigger': trigger};
    return await apiWrapper.makeRequest(
      'favorite',
      Request.post,
      data,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': authorization,
        'lan': langCode,
      },
    );
  }

  /// API to get the list of favorite tutors
  Future<ResponseModel> getFavTutors({
    required String authorization,
    required String skip,
    required String limit,
    required bool loading,
    required String langCode,
    required String searchText,
  }) async =>
      await apiWrapper.makeRequest(
        '/favorite?offset=$skip&limit=$limit${searchText.isEmpty ? '' : '&searchText=$searchText'}',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': authorization,
          'lan': langCode,
        },
      );

  /// API to get the list of favorite tutors
  Future<ResponseModel> getTeacherAvailability({
    required String authorization,
    required String langCode,
    required String timeZone,
    required String ageGroupId,
    required String teacherId,
  }) async =>
      await apiWrapper.makeRequest(
        'teacher_availability?ageGroupId=$ageGroupId&teacherId=$teacherId',
        Request.get,
        null,
        false,
        {
          'Content-Type': 'application/json',
          'authorization': authorization,
          'timezone': timeZone,
          'lan': langCode,
        },
      );

  /// API to get Previous Class & Tutor
  Future<ResponseModel> getPreviousClassAndTutor({
    required String token,
    required String lan,
    required bool loading,
  }) async {
    var data = await apiWrapper.makeRequest(
      'previousClassNTutor',
      Request.get,
      null,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
      },
    );
    return data;
  }

  /// API to get creator subject
  Future<ResponseModel> getCreatorSubject({
    required String token,
    required String lan,
    required bool loading,
    required String creatorId,
    required String ageGroupId,
  }) async {
    var res = await apiWrapper.makeRequest(
      'creator/subjects?creatorId=$creatorId&ageGroupId=$ageGroupId',
      Request.get,
      null,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
      },
    );
    return res;
  }

  /// API to get Previous Class
  Future<ResponseModel> getPreviousClass({
    required String token,
    required String lan,
    required String offset,
    required String limit,
    required String fromDate,
    required String toDate,
    required List<String> subjectId,
    String? searchText,
    required bool loading,
  }) async {
    var url = '';
    if (searchText != null) {
      if (searchText.isNotEmpty) {
        if (subjectId.isNotEmpty) {
          url =
              'previousClass?offset=$offset&limit=$limit&subjectIds=${subjectId.join(',')}&searchText=$searchText';
        } else if (fromDate.isNotEmpty) {
          url =
              'previousClass?offset=$offset&limit=$limit&fromDate=$fromDate&searchText=$searchText';
        } else if (fromDate.isNotEmpty && subjectId.isNotEmpty) {
          url =
              'previousClass?offset=$offset&limit=$limit&fromDate=$fromDate&toDate=$toDate&subjectIds=${subjectId.join(',')}&searchText=$searchText';
        } else {
          url =
              'previousClass?offset=$offset&limit=$limit&searchText=$searchText';
        }
      } else {
        if (subjectId.isNotEmpty) {
          url =
              'previousClass?offset=$offset&limit=$limit&subjectIds=${subjectId.join(',')}';
        } else if (fromDate.isNotEmpty) {
          url = 'previousClass?offset=$offset&limit=$limit&fromDate=$fromDate';
        } else if (fromDate.isNotEmpty && subjectId.isNotEmpty) {
          url =
              'previousClass?offset=$offset&limit=$limit&fromDate=$fromDate&toDate=$toDate&subjectIds=${subjectId.join(',')}';
        } else {
          url = 'previousClass?offset=$offset&limit=$limit';
        }
      }
    } else {
      if (subjectId.isNotEmpty) {
        url =
            'previousClass?offset=$offset&limit=$limit&subjectIds=${subjectId.join(',')}';
      } else if (fromDate.isNotEmpty) {
        url = 'previousClass?offset=$offset&limit=$limit&fromDate=$fromDate';
      } else if (fromDate.isNotEmpty && subjectId.isNotEmpty) {
        url =
            'previousClass?offset=$offset&limit=$limit&fromDate=$fromDate&toDate=$toDate&subjectIds=${subjectId.join(',')}';
      } else {
        url = 'previousClass?offset=$offset&limit=$limit';
      }
    }

    final res = await apiWrapper.makeRequest(
      url,
      Request.get,
      null,
      loading,
      {'Content-Type': 'application/json', 'authorization': token, 'lan': lan},
    );
    return res;
  }

  ///Api to post Video Call Status
  ///
  Future<ResponseModel> videoCallStatus({
    required String token,
    required String lan,
    required String virtualOrderId,
    required String paymentType,
    required String pgLinkId,
    required String paymentMethod,
    required String extensionMin,
    required bool isLoading,
  }) async {
    var data = <String, dynamic>{};

    if (paymentType.isEmpty) {
      data = <String, dynamic>{
        'virtualOrderId': virtualOrderId,
        'pgLinkId': pgLinkId,
        'paymentMethod': paymentMethod,
        'extensionMin': num.tryParse(extensionMin) ?? 15,
      };
    } else {
      data = <String, dynamic>{
        'virtualOrderId': virtualOrderId,
        'paymentType': paymentType,
        'pgLinkId': pgLinkId,
        'paymentMethod': paymentMethod,
        'extensionMin': num.tryParse(extensionMin) ?? 15,
      };
    }
    return await apiWrapper.makeRequest(
      'virtualOrder/extension',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to get Wallet settings
  Future<ResponseModel> getWalletSettings({
    required String token,
    required String lan,
    required bool loading,
    required String countryCodeName,
  }) async {
    var res = await apiWrapper.makeRequest(
      'walletSetting?countryCodeName=$countryCodeName',
      Request.get,
      null,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
      },
    );
    return res;
  }

  /// API to post App Version
  ///
  Future<ResponseModel> appVersion({
    required String token,
    required String lan,
    required bool isLoading,
  }) async {
    final appInfo = await PackageInfo.fromPlatform();

    final data = {
      'deviceId': deviceId,
      'deviceMake': deviceMake,
      'deviceModel': deviceModel,
      'deviceOs': '$deviceOs',
      'deviceTypeCode': deviceTypeCode,
      'appVersion': '${appInfo.version}',
    };
    log(data.toString());
    return await apiWrapper.makeRequest(
      'appVersion',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to craete pre-orders
  ///
  Future<ResponseModel> createPreOrder({
    required String token,
    required bool isLoading,
    required num amount,
    required String currency,
    required String receipt,
    required String notes,
  }) async {
    final data = <String, dynamic>{
      'amount': amount,
      'currency': currency,
      if (receipt.isNotEmpty) 'receipt': receipt,
    };
    log(data.toString());
    return await apiWrapper.makeRequest(
      'razorpay/orders',
      Request.post,
      data,
      isLoading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }
}
