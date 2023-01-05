import 'dart:developer';

import 'package:cmms/app/app.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  /// Delete the box
  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  /// return bool value
  @override
  bool getBoolValue(String key) => throw UnimplementedError();

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    throw UnimplementedError();
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    throw UnimplementedError();
  }

  /// Guest Login
  @override
  Future<ResponseModel> guestLogin() async {
    var response = await connectHelper.guestLogin();
    return response;
  }

  /// Login Api
  @override
  Future<ResponseModel> loginUser(
          {required String email,
          required String password,
          required LoginType loginType,
          required String countryCode,
          required String phoneNumber,
          required bool loading,
          String? verificationId,
          String? googleId,
          String? appleId,
          required String token}) async =>
      await connectHelper.loginUser(
        email,
        password,
        token,
        loginType,
        phoneNumber,
        countryCode,
        googleId,
        verificationId,
        loading,
        appleId,
      );

  /// Logout Api
  @override
  Future<void> logout(
      {required String authToken, required String refreshToken}) async {
    var response = await connectHelper.logout(authToken, refreshToken);
    log(response.data);
    log(response.errorCode.toString());
    log(response.hasError.toString());
    if (!response.hasError) {
      // RouteManagement.goToOffLogin(false);
      // Utility.showMessage(
      //     response.data, MessageType.success, () => null, 'okay'.tr);
    } else {
      Utility.showMessage(
          response.data, MessageType.error, () => null, 'okay'.tr);
    }
  }

  /// Signup API
  @override
  Future<ResponseModel> signupUserModel({
    required SignUpType signUpType,
    required String firstName,
    required String lastName,
    required String email,
    required String googleId,
    required String facebookId,
    required String appleId,
    required String password,
    required String token,
    required String timezone,
    required String countryCode,
    required String phoneNumber,
    required String inviterReferralCode,
    required String countryCodeName,
  }) async =>
      await connectHelper.signupUserModel(
          signUpType: signUpType,
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          appleId: appleId,
          facebookId: facebookId,
          googleId: googleId,
          token: token,
          timezone: timezone,
          countryCode: countryCode,
          phoneNumber: phoneNumber,
          inviterReferralCode: inviterReferralCode,
          countryCodeName: countryCodeName);

  /// ForgotPassword API
  @override
  Future<ResponseModel> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
    required String token,
  }) async =>
      await connectHelper.forgotPassword(
          emailOrPhoneNo, type, countryCode, token);

  /// Check username
  @override
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
    required String token,
  }) async =>
      await connectHelper.checkUsername(trigger, username, token);

  /// Validate phone number
  @override
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
    required String token,
    required String trigger,
    required bool isLoading,
  }) async =>
      await connectHelper.validatePhoneNumberApi(
        phoneNumber,
        countryCode,
        token,
        trigger,
        isLoading,
      );

  /// Send Verification code
  @override
  Future<ResponseModel> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String userId,
    required bool isUpdatingPhoneNumber,
    required String token,
    required bool isLoading,
  }) async {
    var response = await connectHelper.sendVerificationCode(
      phoneNumber,
      countryCode,
      userId,
      trigger,
      isUpdatingPhoneNumber,
      token,
      isLoading,
    );
    var sendVerificationCodeResponse =
        sendVerificationCodeResponseFromJson(response.data);
    debugPrint(
        'SendVerificationCode Response message: ${sendVerificationCodeResponse.message}');
    return response;
  }

  /// Validate Verification code
  @override
  Future<ResponseModel> validateVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String code,
    required String verificationId,
    required String token,
    required bool loading,
  }) async {
    var response = await connectHelper.validateVerificationCode(
      phoneNumber,
      countryCode,
      trigger,
      code,
      verificationId,
      token,
      loading,
    );
    return response;
  }

  /// Resend Verification code
  @override
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
    required String token,
  }) async {
    var response = await connectHelper.resendVerificationCode(
      emailOrPhone,
      type,
      countryCode,
      trigger,
      token,
    );
    return response;
  }

  /// Validate Email
  @override
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
    required String token,
    required bool isLoading,
  }) async {
    var response =
        await connectHelper.validateEmail(emailId, type, token, isLoading);
    return response;
  }

  /// Config App
  @override
  Future<ResponseModel> config({required String token}) async =>
      await connectHelper.config(token);

  @override
  Future<ResponseModel> socialVerify(
      {required String token,
      required bool loading,
      required String langCode,
      required String id,
      required SocialType type,
      required SocialTrigger trigger}) async {
    var response = await connectHelper.socialVerify(
        token: token,
        loading: loading,
        langCode: langCode,
        id: id,
        type: type,
        trigger: trigger);
    return response;
  }

  @override
  Future<ResponseModel> getCognitoToken(
      {required String token, required bool loading}) async {
    var response =
        await connectHelper.getCognitoToken(token: token, loading: loading);
    return response;
  }

  /// API to search a model by the name
  @override
  Future<ResponseModel> searchModel(
      {required String token,
      required String lan,
      required String searchText,
      required String offset,
      required String limit,
      required bool loading}) async {
    var response = await connectHelper.searchModel(
        token: token,
        lan: lan,
        searchText: searchText,
        offset: offset,
        limit: limit,
        loading: loading);
    return response;
  }

  /// API to get the popular posts
  @override
  Future<ResponseModel> getPopularPosts(
      {required String token,
      required String lan,
      required bool loading,
      required String pageNumber}) async {
    var response = await connectHelper.getPopularPosts(
        token: token, lan: lan, loading: loading, pageNumber: pageNumber);
    return response;
  }

  /// API to get the Banners
  @override
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
      await connectHelper.getBanners(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
      );

  /// API to get the IP of the user
  @override
  Future<String> getIp() async => await connectHelper.getIp();

  /// API to get the profile data
  @override
  Future<ResponseModel> getProfile(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String userId,
          required String status}) async =>
      await connectHelper.getProfile(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          userId: userId,
          status: status);

  /// API to get Cognito Identity.
  @override
  Future<ResponseModel> getCognitoIdentity(
          {required bool loading,
          required String region,
          required String identityId,
          required String cognitoToken}) async =>
      await connectHelper.getCognitoIdentity(
        loading: loading,
        region: region,
        identityId: identityId,
        cognitoToken: cognitoToken,
      );

  @override
  Future<ResponseModel> getPopularHashtags(
          {required String token,
          required String lan,
          required bool loading,
          int? set,
          int? limit,
          int? postLimit}) async =>
      await connectHelper.getPopularHashtags(
        token: token,
        lan: lan,
        loading: loading,
        limit: limit,
        postLimit: postLimit,
        set: set,
      );

  /// API to get the list of featured creators
  @override
  Future<ResponseModel> getFeaturedCreators(
          {required String token,
          required String lan,
          required bool loading,
          required int offset,
          required String countryName,
          required int limit,
          required String searchText}) async =>
      await connectHelper.getFeaturedCreators(
          token: token,
          countryName: countryName,
          lan: lan,
          loading: loading,
          offset: offset,
          limit: limit,
          searchText: searchText);

  @override
  Future<ResponseModel> getNotificationCount({
    required String authToken,
    required String appName,
  }) async =>
      await connectHelper.getNotificationCount(
        authToken: authToken,
        appName: appName,
      );

  @override
  Future<ResponseModel> getPopularModels(
          {required String token,
          required bool loading,
          required String searchText,
          required String skip,
          required String limit,
          required String userId}) async =>
      await connectHelper.getPopularModels(
          token: token,
          loading: loading,
          searchText: searchText,
          skip: skip,
          limit: limit,
          userId: userId);

  /// API to like or dislike a post
  @override
  Future<ResponseModel> likeDislikePost(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String userId,
          required String assetId,
          required bool like}) async =>
      await connectHelper.likeDislikePost(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          userId: userId,
          assetId: assetId,
          like: like);

  /// API to get a list of like dislike
  @override
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
      await connectHelper.getLikeDislike(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          lat: lat,
          lng: lng,
          assetId: assetId,
          userId: userId,
          limit: limit,
          offset: offset);

  /// API to bookmark a post
  @override
  Future<ResponseModel> bookmarkPost(
          {required String token,
          required String postId,
          required String collectionId,
          required bool loading}) async =>
      await connectHelper.bookmarkPost(
          token: token,
          postId: postId,
          collectionId: collectionId,
          loading: loading);

  /// API to create a collection if not available
  @override
  Future<ResponseModel> createCollection(
          {required String token,
          required String title,
          required String coverImage,
          required bool loading}) async =>
      await connectHelper.createCollection(
          coverImage: coverImage, token: token, title: title, loading: loading);

  @override
  Future<ResponseModel> getCollections(
          {required String token,
          required String limit,
          required String offset,
          required bool loading}) async =>
      await connectHelper.getCollections(
          token: token, limit: limit, offset: offset, loading: loading);

  @override
  Future<ResponseModel> unBookmark(
          {required String token,
          required bool isCollection,
          required List<String> postIds,
          required String collectionId,
          required bool loading}) async =>
      await connectHelper.unBookmark(
        token: token,
        isCollection: isCollection,
        postIds: postIds,
        loading: loading,
        collectionId: collectionId,
      );

  @override
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
      await connectHelper.getReasonsToReport(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          type: type);

  @override
  Future<ResponseModel> report(
          {required String token,
          required String reportType,
          required String reportedId,
          required String reason,
          required bool loading}) async =>
      await connectHelper.reportAPost(
          token: token,
          reportType: reportType,
          reportedId: reportedId,
          reason: reason,
          loading: loading);

  /// API to get the list of people who have commented on a post
  @override
  Future<ResponseModel> getCommentsList(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String limit,
          required String skip,
          required String assetId}) async =>
      await connectHelper.getCommentList(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          limit: limit,
          skip: skip,
          assetId: assetId);

  /// API to add a comment
  @override
  Future<ResponseModel> addComment(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String comment,
          required String assetId}) async =>
      await connectHelper.addComment(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          comment: comment,
          assetId: assetId);

  @override
  Future<ResponseModel> userLikedPosts(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String limit,
          required String offset}) async =>
      await connectHelper.userLikedPosts(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          limit: limit,
          offset: offset);

  @override
  Future<ResponseModel> getFollowCount(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String userId}) async =>
      await connectHelper.getFollowCount(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          userId: userId);

  @override
  Future<ResponseModel> followUser(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String userIdToFollow}) async =>
      await connectHelper.followUser(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          userIdToFollow: userIdToFollow);

  @override
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
  }) async =>
      await connectHelper.followHashTag(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        hashTag: hashTag,
        trigger: trigger,
      );

  @override
  Future<ResponseModel> getUserSavedAddresses(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng}) async =>
      await connectHelper.getUserSavedAddresses(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng);

  @override
  Future<ResponseModel> saveAddress(
          {required String token,
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
          required String bodyNote}) async =>
      await connectHelper.saveAddress(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          bodyAddress: bodyAddress,
          bodyState: bodyState,
          bodyCity: bodyCity,
          bodyZipCode: bodyZipCode,
          bodyCountry: bodyCountry,
          bodyLat: bodyLat,
          bodyLng: bodyLng,
          bodyNote: bodyNote);

  @override
  Future<ResponseModel> getHtmlPages(
          {required String token,
          required String lan,
          required bool isLoading,
          required int type}) async =>
      await connectHelper.getHtmlPage(
        token: token,
        lan: lan,
        loading: isLoading,
        type: type,
      );

  @override
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
    required dynamic socialMediaLink,
    required String timezone,
  }) async =>
      await connectHelper.editUserProfile(
        token: token,
        lan: lan,
        bannerImage: bannerImage,
        profilePic: profilePic,
        bio: bio,
        firstName: firstName,
        lastName: lastName,
        isNSFWAllow: isNSFWAllow,
        isLoading: isLoading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        currencyCode: currencyCode,
        currencySymbol: currencySymbol,
        price: price,
        socialMediaLink: socialMediaLink,
        timezone: timezone,
      );

  @override
  Future<ResponseModel> stories(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String limit,
          required String offset}) async =>
      await connectHelper.stories(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          limit: limit,
          offset: offset);

  @override
  Future<ResponseModel> storyData(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String userId}) async =>
      await connectHelper.storyData(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          userId: userId);

  @override
  Future<ResponseModel> viewStory(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String storyId}) async =>
      await connectHelper.viewStory(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          storyId: storyId);

  @override
  Future<ResponseModel> updatePassword(
          {required String token,
          required String lan,
          required String city,
          required String country,
          required String ipAddress,
          required String lat,
          required String lng,
          required bool loading,
          required String oldPassword,
          required String newPassword}) async =>
      await connectHelper.updatePassword(
          token: token,
          lan: lan,
          city: city,
          country: country,
          ipAddress: ipAddress,
          lat: lat,
          lng: lng,
          loading: loading,
          oldPassword: oldPassword,
          newPassword: newPassword);

  @override
  Future<ResponseModel> deactivateAccount(
          {required String token,
          required String lan,
          required bool deleteConfirmation,
          required String id,
          required String reason,
          required bool loading}) async =>
      await connectHelper.deactivateAccount(
        token: token,
        lan: lan,
        deleteConfirmation: deleteConfirmation,
        id: id,
        reason: reason,
        loading: loading,
      );

  @override
  Future<ResponseModel> patchEmail({
    required String token,
    required String lan,
    required String newEmail,
    required bool loading,
  }) async =>
      await connectHelper.patchEmail(
        token: token,
        lan: lan,
        newEmail: newEmail,
        loading: loading,
      );

  @override
  Future<ResponseModel?> signupCreatorModel({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
    required String token,
    required String countryCode,
    required String phoneNumber,
    required UserType userType,
    required String profilePic,
    required String dateOfBirth,
    required Gender gender,
    required String inviteReferralCode,
    required String socialMediaLink,
    required bool isNsfwAllow,
  }) async =>
      await connectHelper.signupCreatorModel(
        email,
        password,
        firstName,
        lastName,
        userName,
        token,
        countryCode,
        phoneNumber,
        userType,
        profilePic,
        dateOfBirth,
        gender,
        inviteReferralCode,
        socialMediaLink,
        isNsfwAllow,
      );

  @override
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
      await connectHelper.getFollowers(
          token: token,
          lan: lan,
          city: city,
          country: country,
          ipAddress: ipAddress,
          lat: lat,
          lng: lng,
          loading: loading,
          limit: limit,
          userId: userId,
          offset: offset);

  @override
  Future<ResponseModel> getFollowings({
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
      await connectHelper.getFollowing(
        token: token,
        lan: lan,
        city: city,
        country: country,
        ipAddress: ipAddress,
        lat: lat,
        lng: lng,
        loading: loading,
        limit: limit,
        userId: userId,
        offset: offset,
      );

  /// API to patch default address
  @override
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
  }) async =>
      await connectHelper.patchDefaultAddress(
          token: token,
          lan: lan,
          city: city,
          country: country,
          ipaddress: ipaddress,
          latitude: latitude,
          longitude: longitude,
          platform: platform,
          addressId: addressId,
          loading: loading);

  /// API to delete address
  @override
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
      await connectHelper.deleteAddress(
        token: token,
        lan: lan,
        city: city,
        country: country,
        ipaddress: ipaddress,
        latitude: latitude,
        longitude: longitude,
        platform: platform,
        addressId: addressId,
        loading: loading,
      );

  @override
  Future<ResponseModel> getLatestPosts({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
  }) async =>
      await connectHelper.getLatestPosts(
        token: token,
        loading: loading,
        limit: limit,
        offset: offset,
      );

  @override
  Future<ResponseModel> getCollectionDetails({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
    required String collectionId,
  }) async =>
      await connectHelper.getCollectionDetails(
        token: token,
        loading: loading,
        limit: limit,
        offset: offset,
        collectionId: collectionId,
      );

  @override
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
  }) async =>
      await connectHelper.editAddress(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        platform: platform,
        bodyAddress: bodyAddress,
        bodyState: bodyState,
        bodyCity: bodyCity,
        bodyZipCode: bodyZipCode,
        bodyCountry: bodyCountry,
        bodyLat: bodyLat,
        bodyLng: bodyLng,
        bodyNote: bodyNote,
        addressId: addressId,
      );

  /// API  to get featured collection
  @override
  Future<ResponseModel> getFeaturedCollection({
    required String token,
    required String userId,
    required bool loading,
    required String limit,
    required String offset,
  }) async =>
      await connectHelper.getFeaturedCollection(
        token: token,
        userId: userId,
        loading: loading,
        limit: limit,
        offset: offset,
      );

  @override
  Future<ResponseModel> unfollowUser(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String userIdToFollow}) async =>
      await connectHelper.unfollowUser(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        userIdToFollow: userIdToFollow,
      );

  @override
  Future<ResponseModel> getNotification(
          {required String token,
          required bool loading,
          required int skip,
          required String appName,
          required int limit}) async =>
      await connectHelper.getNotification(
        token: token,
        loading: loading,
        skip: skip,
        appName: appName,
        limit: limit,
      );

  @override
  Future<ResponseModel> getPurchasedPosts(
          {required String token,
          required String lan,
          required bool loading,
          required String ipAddress,
          required String city,
          required String country,
          required String lat,
          required String lng,
          required String limit,
          required String offset}) async =>
      await connectHelper.getPurchasedPosts(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        limit: limit,
        offset: offset,
      );

  @override
  Future<ResponseModel> getPreSignedUrl(
          {required bool loading,
          required String folder,
          required String fileName,
          required String token,
          required String bucketName}) async =>
      await connectHelper.getPreSignedUrl(
          loading: loading,
          folder: folder,
          fileName: fileName,
          token: token,
          bucketName: bucketName);

  @override
  Future<ResponseModel> hashtags(
          {required bool loading,
          required String hashtag,
          required String pageNumber,
          required String token}) async =>
      await connectHelper.hashtags(
          loading: loading,
          hashtag: hashtag,
          pageNumber: pageNumber,
          token: token);

  @override
  Future<ResponseModel> uploadFileToAws(
          {required bool loading,
          required dynamic file,
          required String token,
          required String url}) async =>
      await connectHelper.uploadFileToAws(
          loading: loading, file: file, token: token, url: url);

  @override
  Future<ResponseModel> getActiveStories({
    required bool loading,
    required String token,
  }) async =>
      await connectHelper.getActiveStories(
        loading: loading,
        token: token,
      );

  @override
  Future<ResponseModel> postStory(
          {required bool loading,
          required int storyType,
          required List<StoryDataPost> storyData,
          required String token,
          required String currencyCode,
          required String currencySymbol}) async =>
      await connectHelper.postStory(
          loading: loading,
          storyType: storyType,
          storyData: storyData,
          token: token,
          currencyCode: currencyCode,
          currencySymbol: currencySymbol);

  @override
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
          required String currencySymbol}) async =>
      await connectHelper.postAsset(
          assetType: assetType,
          postType: postType,
          postedOn: postedOn,
          userId: userId,
          description: description,
          sharedOnGroupFeed: sharedOnGroupFeed,
          loading: loading,
          isValidPrice: isValidPrice,
          postData: postData,
          taggedUserIds: taggedUserIds,
          videoDuration: videoDuration,
          mediaCount: mediaCount,
          mediaType: mediaType,
          sharedOnStory: sharedOnStory,
          sharedOnPersonalFeed: sharedOnPersonalFeed,
          token: token,
          currencyCode: currencyCode,
          postTo: postTo,
          currencySymbol: currencySymbol);

  @override
  Future<ResponseModel> deleteActiveStory(
          {required bool loading,
          required String token,
          required String storyId,
          required bool isFullStory}) async =>
      await connectHelper.deleteActiveStory(
          loading: loading,
          token: token,
          storyId: storyId,
          isFullStory: isFullStory);

  @override
  Future<ResponseModel> getUserProfile(
          {required String token,
          required String lan,
          required bool loading,
          required String userId,
          required String status}) async =>
      await connectHelper.getUserProfile(
        token: token,
        lan: lan,
        loading: loading,
        userId: userId,
        status: status,
      );

  @override
  Future<ResponseModel> getUserAssets(
          {required bool loading,
          required String userId,
          required String pageNumber,
          required String status,
          required String token}) async =>
      await connectHelper.getUserAssets(
        loading: loading,
        userId: userId,
        pageNumber: pageNumber,
        status: status,
        token: token,
      );

  @override
  Future<ResponseModel> getUserLockedAssets(
          {required bool loading,
          required String userId,
          required String pageNumber,
          required String status,
          required String token,
          required String postType}) async =>
      await connectHelper.getUserLockedAssets(
        loading: loading,
        userId: userId,
        pageNumber: pageNumber,
        status: status,
        token: token,
        postType: postType,
      );

  @override
  Future<ResponseModel> getDocumentTypes({
    required bool loading,
    required String token,
  }) async =>
      await connectHelper.getDocumentTypes(
        loading: loading,
        token: token,
      );

  @override
  Future<ResponseModel> postDocuments({
    required String token,
    required bool loading,
    required String backImage,
    required String documentTypeId,
    required String frontImage,
    required String userId,
  }) async =>
      await connectHelper.postDocuments(
        token: token,
        loading: loading,
        backImage: backImage,
        documentTypeId: documentTypeId,
        frontImage: frontImage,
        userId: userId,
      );

  @override
  Future<ResponseModel> getBlockedUsers({
    required bool loading,
    required String token,
    required int limit,
    required int offset,
  }) async =>
      await connectHelper.getBlockedUsers(
        loading: loading,
        token: token,
        limit: limit,
        offset: offset,
      );

  @override
  Future<ResponseModel> blockUnblockUser({
    required bool loading,
    required String token,
    required String opponentUserId,
    required String trigger,
  }) async =>
      await connectHelper.blockUnblockUser(
        loading: loading,
        token: token,
        opponentUserId: opponentUserId,
        trigger: trigger,
      );

  @override
  Future<ResponseModel> getCollectionInfo({
    required String token,
    required String collectionId,
    required bool loading,
  }) async =>
      await connectHelper.getCollectionInfo(
        token: token,
        collectionId: collectionId,
        loading: loading,
      );

  @override
  Future<ResponseModel> patchCollection({
    required String token,
    required String collectionId,
    required String collectionName,
    required bool loading,
    required String collectionCover,
  }) async =>
      await connectHelper.patchCollection(
        token: token,
        collectionId: collectionId,
        collectionName: collectionName,
        loading: loading,
        collectionCover: collectionCover,
      );

  @override
  Future<ResponseModel> deleteCollection({
    required String token,
    required bool isCollection,
    required String collectionId,
    required bool loading,
  }) async =>
      await connectHelper.deleteCollection(
        token: token,
        isCollection: isCollection,
        collectionId: collectionId,
        loading: loading,
      );

  @override
  Future<ResponseModel> getBookmarks(
          {required String token,
          required bool loading,
          required String limit,
          required String offset}) async =>
      await connectHelper.getBookmarks(
        token: token,
        loading: loading,
        limit: limit,
        offset: offset,
      );

  @override
  Future<ResponseModel> bookmarkPosts(
          {required String token,
          required String collectionId,
          required List<String> postIds,
          required bool loading}) async =>
      await connectHelper.bookmarkPosts(
        token: token,
        postIds: postIds,
        collectionId: collectionId,
        loading: loading,
      );

  @override
  Future<ResponseModel> refreshToken({
    required String token,
    required String lan,
    required bool loading,
    required String refreshToken,
    required String accessToken,
  }) async =>
      await connectHelper.refreshToken(
        loading: loading,
        lan: lan,
        refreshToken: refreshToken,
        accessToken: accessToken,
        token: token,
      );

  ///API to get the Orders
  @override
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
      await connectHelper.getMyOrders(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        platform: platform,
        trigger: trigger,
        limit: limit,
        offset: offset,
      );

  ///API to get the Orders
  @override
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
      await connectHelper.getMySubscribers(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        platform: platform,
        limit: limit,
        offset: offset,
      );

  ///API to get the languages
  @override
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
      await connectHelper.getLanguages(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        platform: platform,
      );

  @override
  Future<ResponseModel> getUserLockedPosts({
    required bool loading,
    required int limit,
    required int offset,
    required String token,
  }) async =>
      await connectHelper.getUserLockedPosts(
        loading: loading,
        limit: limit,
        offset: offset,
        token: token,
      );

  ///API to Post Report A Problem
  @override
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
  }) async =>
      await connectHelper.postReportAProblem(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        platform: platform,
        problemText: problemText,
        problemImages: problemImages,
      );

  ///API to get the Billing History
  @override
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
      await connectHelper.getBillingHistory(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        platform: platform,
        billingType: billingType,
        offSet: offSet,
        limit: limit,
      );

  ///API to Get FAQ
  @override
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
      await connectHelper.getFAQ(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        platform: platform,
        userType: userType,
      );

  ///API to Get Wallet
  @override
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
      await connectHelper.getWallet(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        userType: userType,
        userId: userId,
        platform: platform,
      );

  ///API to Get Wallet Transaction
  @override
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
      await connectHelper.getWalletTransaction(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        walletId: walletId,
        platform: platform,
        fetchSize: fetchSize,
        txnType: txnType,
      );

  ///API to Get MySubscriptions
  @override
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
      await connectHelper.getMySubscriptions(
        token: token,
        lan: lan,
        loading: loading,
        ipAddress: ipAddress,
        city: city,
        country: country,
        lat: lat,
        lng: lng,
        status: status,
        offset: offset,
        limit: limit,
        platform: platform,
      );

  @override
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
      await connectHelper.getCreatorType(
          token: token,
          lan: lan,
          loading: loading,
          ipAddress: ipAddress,
          city: city,
          country: country,
          lat: lat,
          lng: lng,
          offset: offset,
          limit: limit);

  @override
  Future<ResponseModel> getInterests({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) async =>
      await connectHelper.getInterests(
        offset: offset,
        limit: limit,
        token: token,
        loading: loading,
      );

  @override
  Future<ResponseModel> getSubjects({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
    required String dateOfBirth,
  }) async =>
      await connectHelper.getSubjects(
        offset: offset,
        limit: limit,
        token: token,
        loading: loading,
        dateOfBirth: dateOfBirth,
      );

  @override
  Future<ResponseModel> postStudent({
    required String parentId,
    required String avatarId,
    required String firstName,
    required String lastName,
    required String ageGroupId,
    required String birthDate,
    required String gender,
    required String token,
    required List<String> subjectIds,
    required List<String> interestIds,
    required bool isLoading,
    required String profilePic,
  }) async =>
      await connectHelper.postStudent(
        parentId: parentId,
        avatarId: avatarId,
        firstName: firstName,
        lastName: lastName,
        ageGroupId: ageGroupId,
        birthDate: birthDate,
        gender: gender,
        token: token,
        profilePic: profilePic,
        subjectIds: subjectIds,
        interestIds: interestIds,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel> getRatings({
    required String token,
    required String linkedWith,
    required bool isLoading,
  }) async =>
      await connectHelper.getRatings(
        token: token,
        linkedWith: linkedWith,
        isLoading: isLoading,
      );

  /// API to get myClasses Details
  ///
  @override
  Future<ResponseModel> getMyClassesDetails({
    required String token,
    required bool loading,
    required String classId,
  }) async =>
      await connectHelper.getMyClassesDetails(
        loading: loading,
        classId: classId,
        token: token,
      );

  /// API to get myClasses
  ///
  @override
  Future<ResponseModel> getMyClasses({
    required String token,
    required bool loading,
    required int offset,
    required int limit,
    required String filter,
  }) async =>
      await connectHelper.getMyClasses(
        loading: loading,
        offset: offset,
        limit: limit,
        token: token,
        filter: filter,
      );

  /// Get the previous tutor data
  @override
  Future<ResponseModel> getPreviousTutorData({
    required bool loading,
    required String offset,
    required String token,
    required String limit,
    required String searchText,
    required String fromDate,
    required String toDate,
    required List<String> subjectId,
    required int rating,
  }) async =>
      await connectHelper.getPreviousTutorData(
        loading: loading,
        offset: offset,
        limit: limit,
        token: token,
        fromDate: fromDate,
        searchText: searchText,
        subjectId: subjectId,
        toDate: toDate,
        rating: rating,
      );

  @override
  Future<ResponseModel> getFavourites({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) async =>
      await connectHelper.getFavourites(
        offset: offset,
        limit: limit,
        token: token,
        loading: loading,
      );

  @override
  Future<ResponseModel> reviewRatingPost({
    required String token,
    required String virtualOrderId,
    required String linkedWith,
    // required String parameterId,
    // required double rating,
    required String review,
    required bool isLoading,
    required RateWithParameter ratingList,
  }) async =>
      await connectHelper.reviewRatingPost(
        token: token,
        virtualOrderId: virtualOrderId,
        linkedWith: linkedWith,
        // parameterId: parameterId,
        // rating: rating,
        ratingList: ratingList,
        review: review,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel> getStudents({
    required String token,
    required bool isLoading,
    required int offset,
    required int limit,
    required int status,
    required String studentId,
  }) async =>
      await connectHelper.getStudents(
        token: token,
        isLoading: isLoading,
        offset: offset,
        limit: limit,
        status: status,
        studentId: studentId,
      );

  @override
  Future<ResponseModel> deleteStudent(
          {required String token,
          required String reason,
          required List<String> studentIds,
          required bool isLoading}) async =>
      await connectHelper.deleteStudent(
        token: token,
        reason: reason,
        studentIds: studentIds,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel> patchStudent(
          {required String studentId,
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
          required bool isLoading}) async =>
      await connectHelper.patchStudent(
        studentId: studentId,
        parentId: parentId,
        avatarId: avatarId,
        firstName: firstName,
        lastName: lastName,
        ageGroupId: ageGroupId,
        birthDate: birthDate,
        profilePic: profilePic,
        gender: gender,
        token: token,
        subjectIds: subjectIds,
        interestIds: interestIds,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel> getProfileAvatars({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) async =>
      await connectHelper.getProfileAvatars(
        offset: offset,
        limit: limit,
        token: token,
        loading: loading,
      );

  @override
  Future<ResponseModel> getLearningObjectives({
    required String token,
    required bool isLoading,
    required int offset,
    required int limit,
    required int status,
  }) async =>
      await connectHelper.getLearningObjectives(
        token: token,
        isLoading: isLoading,
        offset: offset,
        limit: limit,
        status: status,
      );

  @override
  Future<ResponseModel> markAStudentAsDefault({
    required String token,
    required String studentId,
    required bool markAsDefault,
    required bool isLoading,
  }) async =>
      await connectHelper.markAStudentAsDefault(
        token: token,
        studentId: studentId,
        markAsDefault: markAsDefault,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel> getAgeGroup(
          {required String token,
          required String lan,
          required bool loading,
          required String offset,
          required String limit}) async =>
      await connectHelper.getAgeGroup(
          token: token,
          lan: lan,
          loading: loading,
          offset: offset,
          limit: limit);

  @override
  Future<ResponseModel> getLearningObjectiveBySubject({
    required String token,
    required bool loading,
    required List<String> subjectIds,
    required String ageGroupId,
  }) async =>
      await connectHelper.getLearningObjectiveBySubject(
        token: token,
        loading: loading,
        subjectIds: subjectIds,
        ageGroupId: ageGroupId,
      );

  @override
  Future<ResponseModel> deleteAsset({
    required String token,
    required bool loading,
    required int status,
    required List<String> postIds,
  }) async =>
      await connectHelper.deleteAsset(
        token: token,
        loading: loading,
        status: status,
        postIds: postIds,
      );

  @override
  Future<ResponseModel> instantClassRequest({
    required ClassRequestBody classRequest,
    required String token,
  }) async =>
      await connectHelper.instantClassRequest(
        classRequest: classRequest,
        token: token,
      );

  @override
  Future<ResponseModel> instantClassStatus({
    required String parentId,
    required String childId,
    required String token,
    required int status,
    required bool isLoading,
  }) async =>
      await connectHelper.instantClassStatus(
        parentId: parentId,
        childId: childId,
        token: token,
        isLoading: isLoading,
        status: status,
      );

  @override
  Future<ResponseModel> getReasons({
    required String token,
    required String lan,
    required int type,
  }) async =>
      await connectHelper.getReasons(
        token: token,
        lan: lan,
        type: type,
      );

  @override
  Future<ResponseModel> postWallet({
    required String userId,
    required String userType,
    required String currency,
    required String token,
    required bool isLoading,
  }) async =>
      await connectHelper.postWallet(
        userId: userId,
        userType: userType,
        currency: currency,
        token: token,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel> rechargeWallet({
    required String token,
    required String lan,
    required String paymentMethod,
    required String pgLinkId,
    required int type,
    required num amount,
    required bool isLoading,
  }) async =>
      await connectHelper.rechargeWallet(
        token: token,
        lan: lan,
        paymentMethod: paymentMethod,
        pgLinkId: pgLinkId,
        type: type,
        amount: amount,
        isLoading: isLoading,
      );

  ///API to get the Country link
  ///
  @override
  Future<ResponseModel> getCountryLink({
    required String token,
    required String lan,
    required bool loading,
    required String countryCode,
  }) async =>
      await connectHelper.getCountryLink(
        token: token,
        lan: lan,
        loading: loading,
        countryCode: countryCode,
      );

  @override
  Future<ResponseModel> cancelClass({
    required String token,
    required String lan,
    required String classId,
    required String reason,
    required bool isLoading,
  }) async =>
      await connectHelper.cancelClass(
        token: token,
        lan: lan,
        classId: classId,
        reason: reason,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel> getTeacherCount({
    required String token,
    required String lan,
    required String ageGroupId,
    required String subjectId,
    required String countryCode,
    required List<String> learnObjectivesIds,
    required bool isLoading,
  }) async =>
      await connectHelper.getTeacherCount(
        token: token,
        lan: lan,
        ageGroupId: ageGroupId,
        subjectId: subjectId,
        countryCode: countryCode,
        learnObjectivesIds: learnObjectivesIds,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel?> getMessages({
    required String authorization,
    required String langCode,
    required String chatId,
    required String timeStamp,
    int? pageSize,
  }) async =>
      await connectHelper.getMessages(
        authorization: authorization,
        chatId: chatId,
        timeStamp: timeStamp,
        langCode: langCode,
        pageSize: pageSize,
      );

  ///API to delete a chat
  @override
  Future<ResponseModel?> deleteChat({
    required String authorization,
    required String langCode,
    required String chatID,
  }) async =>
      await connectHelper.deleteChat(
        authorization: authorization,
        chatID: chatID,
        langCode: langCode,
      );

  @override
  Future<ResponseModel?> chatMediaDoc({
    required String authorization,
    required String langCode,
    required String chatId,
  }) async =>
      await connectHelper.chatMediaDoc(
        authorization: authorization,
        chatId: chatId,
        langCode: langCode,
      );

  @override
  Future<ResponseModel> getPreviousClass(
          {required String token,
          required String lan,
          required String offset,
          required String limit,
          required String fromDate,
          required String toDate,
          required List<String> subjectId,
          String? searchText,
          required bool loading}) async =>
      await connectHelper.getPreviousClass(
          token: token,
          lan: lan,
          loading: loading,
          searchText: searchText,
          fromDate: fromDate,
          toDate: toDate,
          offset: offset,
          limit: limit,
          subjectId: subjectId);

  @override
  Future<ResponseModel> markAsFavUnFav(
          {required String authorization,
          required String langCode,
          required String parentId,
          required String trigger}) async =>
      await connectHelper.markAsFavUnFav(
          authorization: authorization,
          langCode: langCode,
          parentId: parentId,
          trigger: trigger);

  @override
  Future<ResponseModel> getFavTutors({
    required String authorization,
    required String skip,
    required String limit,
    required bool loading,
    required String langCode,
    required String searchText,
  }) async =>
      await connectHelper.getFavTutors(
        authorization: authorization,
        skip: skip,
        limit: limit,
        loading: loading,
        langCode: langCode,
        searchText: searchText,
      );

  @override
  Future<ResponseModel> getTeacherAvailability(
          {required String authorization,
          required String langCode,
          required String timeZone,
          required String ageGroupId,
          required String teacherId}) async =>
      await connectHelper.getTeacherAvailability(
          authorization: authorization,
          langCode: langCode,
          timeZone: timeZone,
          ageGroupId: ageGroupId,
          teacherId: teacherId);

  /// API to get previous Class and Tutor
  @override
  Future<ResponseModel> getPreviousClassAndTutor({
    required String token,
    required String lan,
    required bool loading,
  }) async =>
      await connectHelper.getPreviousClassAndTutor(
        token: token,
        lan: lan,
        loading: loading,
      );

  @override
  Future<ResponseModel> patchVirtualOrder({
    required String orderType,
    required String virtualOrderId,
    required String status,
    required String token,
    required bool loading,
  }) async =>
      await connectHelper.patchVirtualOrder(
        orderType: orderType,
        virtualOrderId: virtualOrderId,
        status: status,
        token: token,
        loading: loading,
      );

  ///Api to post Video Call Status
  ///
  @override
  Future<ResponseModel> videoCallStatus({
    required String token,
    required String lan,
    required String virtualOrderId,
    required String paymentType,
    required String pgLinkId,
    required String paymentMethod,
    required String extensionMin,
    required bool isLoading,
  }) async =>
      await connectHelper.videoCallStatus(
        token: token,
        lan: lan,
        virtualOrderId: virtualOrderId,
        paymentType: paymentType,
        pgLinkId: pgLinkId,
        paymentMethod: paymentMethod,
        extensionMin: extensionMin,
        isLoading: isLoading,
      );

  /// API to send message
  ///
  @override
  Future<ResponseModel> sendMessage({
    required String token,
    required SendMessage message,
    required bool isLoading,
  }) async =>
      await connectHelper.sendMessage(
        token: token,
        message: message,
        isLoading: isLoading,
      );

  /// API to get creator subject
  @override
  Future<ResponseModel> getCreatorSubject({
    required String token,
    required String lan,
    required bool loading,
    required String creatorId,
    required String ageGroupId,
  }) async =>
      await connectHelper.getCreatorSubject(
        token: token,
        lan: lan,
        loading: loading,
        creatorId: creatorId,
        ageGroupId: ageGroupId,
      );

  /// API to get Wallet settings
  @override
  Future<ResponseModel> getWalletSettings({
    required String token,
    required String lan,
    required bool loading,
    required String countryCodeName,
  }) async =>
      await connectHelper.getWalletSettings(
        token: token,
        lan: lan,
        loading: loading,
        countryCodeName: countryCodeName,
      );

  /// API to get unread count
  @override
  Future<ResponseModel?> getUnreadCount({
    required String token,
    required String lan,
    required String chatId,
    required bool loading,
  }) async =>
      await connectHelper.getUnreadCount(
        authorization: token,
        lan: lan,
        loading: loading,
        chatId: chatId,
      );

  /// API to post message acknowledge
  @override
  Future<ResponseModel> postAcknowledge({
    required String authorization,
    required String lan,
    required String chatId,
    required num status,
  }) async =>
      await connectHelper.postAcknowledge(
        authorization: authorization,
        lan: lan,
        chatId: chatId,
        status: status,
      );

  /// API to post App Version
  @override
  Future<ResponseModel> appVersion({
    required String token,
    required String lan,
    required bool isLoading,
  }) async =>
      await connectHelper.appVersion(
        token: token,
        lan: lan,
        isLoading: isLoading,
      );

  @override
  Future<ResponseModel> createPreOrder({
    required String token,
    required bool isLoading,
    required num amount,
    required String currency,
    required String receipt,
    required String notes,
  }) async =>
      await connectHelper.createPreOrder(
        token: token,
        isLoading: isLoading,
        amount: amount,
        currency: currency,
        receipt: receipt,
        notes: notes,
      );
}
