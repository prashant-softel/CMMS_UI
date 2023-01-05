// coverage:ignore-file
import 'package:cmms/app/app.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Repositories that communicate with the platform e.g. GPS
class DeviceRepository extends DomainRepository {
  /// initialize flutter secure storage
  final _flutterSecureStorage = const FlutterSecureStorage();

  /// initialize the hive box
  Future<void> init({bool isTest = false}) async {
    if (isTest) {
      Hive.init('HIVE_TEST');
      await Hive.openBox<dynamic>(StringConstants.appName);
    } else {
      await Hive.initFlutter();
      await Hive.openBox<dynamic>(
        StringConstants.appName,
      );
    }
  }

  /// Returns the box in which the data is stored.
  Box _getBox() => Hive.box<dynamic>(StringConstants.appName);

  @override
  void clearData(dynamic key) {
    _getBox().delete(key);
  }

  /// Delete the box
  @override
  void deleteBox() {
    Hive.box<void>(StringConstants.appName).clear();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    var box = _getBox();
    var defaultValue = '';
    if (key == DeviceConstants.localLang) {
      defaultValue = DataConstants.defaultLang;
    }
    String? value = box.get(key, defaultValue: defaultValue) as String;
    return value;
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    _getBox().put(key, value);
  }

  /// return bool value
  @override
  bool getBoolValue(String key) =>
      _getBox().get(key, defaultValue: false) as bool;

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    try {
      var value = await _flutterSecureStorage.read(key: key);
      if (value == null || value.isEmpty) {
        value = '';
      }
      return value;
    } catch (error) {
      return '';
    }
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    _flutterSecureStorage.write(key: key, value: value);
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    _flutterSecureStorage.delete(key: key);
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    _flutterSecureStorage.deleteAll();
  }

  ///Guest Login
  @override
  Future<GuestLoginModel> guestLogin() {
    throw UnimplementedError();
  }

  ///  Login API call
  ///
  @override
  Future<LoginResponse> loginUser(
      {required String email,
      required String password,
      required LoginType loginType,
      required String token,
      required String phoneNumber,
      required String countryCode,
      required bool loading,
      required String appleId,
      String? googleId,
      String? verificationId}) {
    throw UnimplementedError();
  }

  /// Logout api
  @override
  Future<void> logout({
    required String authToken,
    required String refreshToken,
  }) {
    throw UnimplementedError();
  }

  /// Signup Api
  @override
  Future<SignupResponse> signupUserModel({
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
  }) {
    throw UnimplementedError();
  }

  /// Forgot Password API
  @override
  Future<ForgotPasswordResponse> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// Check username API
  @override
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// validate phone number API
  @override
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
    required String token,
    required bool isLoading,
    required String trigger,
  }) {
    throw UnimplementedError();
  }

  /// Send Verification Code
  @override
  Future<ResponseModel> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String userId,
    required bool isUpdatingPhoneNumber,
    required String token,
    required bool isLoading,
  }) {
    throw UnimplementedError();
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
  }) {
    throw UnimplementedError();
  }

  /// Resend Verification code
  @override
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// Validate email
  @override
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
    required String token,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  /// Config App
  @override
  Future<ConfigResponse> config({required String token}) {
    throw UnimplementedError();
  }

  /// API to verify the social account
  @override
  Future<ResponseModel> socialVerify(
      {required String token,
      required bool loading,
      required String langCode,
      required String id,
      required SocialType type,
      required SocialTrigger trigger}) {
    throw UnimplementedError();
  }

  /// API to get the cognito token
  @override
  Future<ResponseModel> getCognitoToken(
      {required String token, required bool loading}) {
    throw UnimplementedError();
  }

  /// API to search a model by the name
  @override
  Future<ResponseModel> searchModel(
      {required String token,
      required String lan,
      required String searchText,
      required String offset,
      required String limit,
      required bool loading}) {
    throw UnimplementedError();
  }

  /// API to get the popular posts
  @override
  Future<ResponseModel> getPopularPosts(
      {required String token,
      required String lan,
      required bool loading,
      required String pageNumber}) {
    throw UnimplementedError();
  }

  /// API to get the IP of the user
  @override
  Future<String> getIp() {
    throw UnimplementedError();
  }

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
      required String status}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getCognitoIdentity(
      {required bool loading,
      required String region,
      required String identityId,
      required String cognitoToken}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getPopularHashtags(
      {required String token,
      required String lan,
      required bool loading,
      int? set,
      int? limit,
      int? postLimit}) {
    throw UnimplementedError();
  }

  /// API to get the list of featured creators
  @override
  Future<ResponseModel> getFeaturedCreators(
      {required String token,
      required String lan,
      required bool loading,
      required int offset,
      required String countryName,
      required int limit,
      required String searchText}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getNotificationCount({
    required String authToken,
    required String appName,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getPopularModels(
      {required String token,
      required bool loading,
      required String searchText,
      required String skip,
      required String limit,
      required String userId}) {
    throw UnimplementedError();
  }

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
      required bool like}) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> bookmarkPost(
      {required String token,
      required String postId,
      required String collectionId,
      required bool loading}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> createCollection({
    required String token,
    required String title,
    required bool loading,
    required String coverImage,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getCollections(
      {required String token,
      required String limit,
      required String offset,
      required bool loading}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> unBookmark(
      {required String token,
      required bool isCollection,
      required List<String> postIds,
      required String collectionId,
      required bool loading}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getReasonsToReport(
      {required String token,
      required String lan,
      required bool loading,
      required String ipAddress,
      required String city,
      required String country,
      required String lat,
      required String lng,
      required String type}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> report(
      {required String token,
      required String reportType,
      required String reportedId,
      required String reason,
      required bool loading}) {
    throw UnimplementedError();
  }

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
      required String assetId}) {
    throw UnimplementedError();
  }

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
      required String assetId}) {
    throw UnimplementedError();
  }

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
      required String offset}) {
    throw UnimplementedError();
  }

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
      required String userId}) {
    throw UnimplementedError();
  }

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
      required String userIdToFollow}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getUserSavedAddresses(
      {required String token,
      required String lan,
      required bool loading,
      required String ipAddress,
      required String city,
      required String country,
      required String lat,
      required String lng}) {
    throw UnimplementedError();
  }

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
      required String bodyNote}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getHtmlPages(
      {required String token,
      required String lan,
      required bool isLoading,
      required int type}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> editUserProfile(
      {required String token,
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
      required String price,
      required String currencyCode,
      required String currencySymbol,
      required String lat,
      required dynamic socialMediaLink,
      required String timezone,
      required String lng}) {
    throw UnimplementedError();
  }

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
      required String offset}) {
    throw UnimplementedError();
  }

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
      required String userId}) {
    throw UnimplementedError();
  }

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
      required String storyId}) {
    throw UnimplementedError();
  }

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
      required String newPassword}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> deactivateAccount({
    required String token,
    required String lan,
    required bool deleteConfirmation,
    required String id,
    required String reason,
    required bool loading,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> patchEmail({
    required String token,
    required String lan,
    required String newEmail,
    required bool loading,
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) async {
    throw UnimplementedError();
  }

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
  }) async {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getLatestPosts({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getFeaturedCollection({
    required String token,
    required String userId,
    required bool loading,
    required String limit,
    required String offset,
  }) {
    throw UnimplementedError();
  }

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
      required String userIdToFollow}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getNotification(
      {required String token,
      required bool loading,
      required int skip,
      required String appName,
      required int limit}) {
    throw UnimplementedError();
  }

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
      required String offset}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getBanners(
      {required String token,
      required String lan,
      required bool loading,
      required String ipAddress,
      required String city,
      required String country,
      required String lat,
      required String lng}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getPreSignedUrl(
      {required bool loading,
      required String folder,
      required String fileName,
      required String token,
      required String bucketName}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> hashtags(
      {required bool loading,
      required String hashtag,
      required String pageNumber,
      required String token}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> uploadFileToAws(
      {required bool loading,
      required dynamic file,
      required String token,
      required String url}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> followHashTag(
      {required String token,
      required String lan,
      required bool loading,
      required String ipAddress,
      required String city,
      required String country,
      required String lat,
      required String lng,
      required String hashTag,
      required String trigger}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> postStory(
      {required bool loading,
      required int storyType,
      required List<StoryDataPost> storyData,
      required String token,
      required String currencyCode,
      required String currencySymbol}) {
    throw UnimplementedError();
  }

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
      required String currencySymbol}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getActiveStories(
      {required bool loading, required String token}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> deleteActiveStory(
      {required bool loading,
      required String token,
      required String storyId,
      required bool isFullStory}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getUserProfile({
    required String token,
    required String lan,
    required bool loading,
    required String userId,
    required String status,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getUserAssets(
      {required bool loading,
      required String userId,
      required String pageNumber,
      required String status,
      required String token}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getUserLockedAssets({
    required bool loading,
    required String userId,
    required String pageNumber,
    required String status,
    required String token,
    required String postType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getDocumentTypes({
    required bool loading,
    required String token,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> postDocuments({
    required String token,
    required bool loading,
    required String backImage,
    required String documentTypeId,
    required String frontImage,
    required String userId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getBlockedUsers(
      {required bool loading,
      required String token,
      required int limit,
      required int offset}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> blockUnblockUser(
      {required bool loading,
      required String token,
      required String opponentUserId,
      required String trigger}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getCollectionDetails(
      {required String token,
      required bool loading,
      required String limit,
      required String offset,
      required String collectionId}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getCollectionInfo(
      {required String token,
      required String collectionId,
      required bool loading}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> patchCollection(
      {required String token,
      required String collectionId,
      required String collectionName,
      required String collectionCover,
      required bool loading}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> deleteCollection(
      {required String token,
      required bool isCollection,
      required String collectionId,
      required bool loading}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getBookmarks(
      {required String token,
      required bool loading,
      required String limit,
      required String offset}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> bookmarkPosts(
      {required String token,
      required String collectionId,
      required List<String> postIds,
      required bool loading}) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> refreshToken(
      {required String token,
      required String lan,
      required bool loading,
      required String refreshToken,
      required String accessToken}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getUserLockedPosts(
      {required bool loading,
      required int limit,
      required int offset,
      required String token}) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getMySubscriptions(
      {required String token,
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
      required String platform}) {
    throw UnimplementedError();
  }

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
      required int limit}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getInterests({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) {
    throw UnimplementedError();
  }

  /// API to get favourites
  ///
  @override
  Future<ResponseModel> getFavourites({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getSubjects({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
    required String dateOfBirth,
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getRatings({
    required String token,
    required String linkedWith,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  /// Get the previous tutor data
  @override
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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getStudents(
      {required String token,
      required bool isLoading,
      required int offset,
      required String studentId,
      required int limit,
      required int status}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> deleteStudent(
      {required String token,
      required String reason,
      required List<String> studentIds,
      required bool isLoading}) {
    throw UnimplementedError();
  }

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
      required String token,
      required List<String> subjectIds,
      required List<String> interestIds,
      required String profilePic,
      required bool isLoading}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getProfileAvatars({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getLearningObjectives({
    required String token,
    required bool isLoading,
    required int offset,
    required int limit,
    required int status,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> markAStudentAsDefault({
    required String token,
    required String studentId,
    required bool markAsDefault,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getAgeGroup(
      {required String token,
      required String lan,
      required bool loading,
      required String offset,
      required String limit}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getLearningObjectiveBySubject({
    required String token,
    required bool loading,
    required List<String> subjectIds,
    required String ageGroupId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> deleteAsset({
    required String token,
    required bool loading,
    required int status,
    required List<String> postIds,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> instantClassRequest({
    required ClassRequestBody classRequest,
    required String token,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> instantClassStatus({
    required String parentId,
    required String childId,
    required String token,
    required bool isLoading,
    required int status,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getReasons({
    required String token,
    required String lan,
    required int type,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> postWallet({
    required String userId,
    required String userType,
    required String currency,
    required String token,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> rechargeWallet({
    required String token,
    required String lan,
    required String paymentMethod,
    required String pgLinkId,
    required int type,
    required num amount,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  ///API to get the Country link
  ///
  @override
  Future<ResponseModel> getCountryLink({
    required String token,
    required String lan,
    required bool loading,
    required String countryCode,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> cancelClass({
    required String token,
    required String lan,
    required String classId,
    required String reason,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getTeacherCount({
    required String token,
    required String lan,
    required String ageGroupId,
    required String subjectId,
    required String countryCode,
    required List<String> learnObjectivesIds,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel?> getMessages({
    required String authorization,
    required String langCode,
    required String chatId,
    required String timeStamp,
    int? pageSize,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel?> chatMediaDoc(
      {required String authorization,
      required String langCode,
      required String chatId}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel?> deleteChat(
      {required String authorization,
      required String langCode,
      required String chatID}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getPreviousClass({
    required String token,
    required String lan,
    required bool loading,
    required String offset,
    required String fromDate,
    required String toDate,
    required String limit,
    required List<String> subjectId,
    String? searchText,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> markAsFavUnFav(
      {required String authorization,
      required String langCode,
      required String parentId,
      required String trigger}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getFavTutors(
      {required String authorization,
      required String skip,
      required String limit,
      required bool loading,
      required String searchText,
      required String langCode}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getTeacherAvailability(
      {required String authorization,
      required String langCode,
      required String timeZone,
      required String ageGroupId,
      required String teacherId}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getPreviousClassAndTutor(
      {required String token, required String lan, required bool loading}) {
    throw UnimplementedError();
  }

  /// API to get myClasses
  ///
  @override
  Future<ResponseModel> getMyClasses({
    required String token,
    required bool loading,
    required int offset,
    required int limit,
    required String filter,
  }) {
    throw UnimplementedError();
  }

  /// API to get myClasses Details
  ///
  @override
  Future<ResponseModel> getMyClassesDetails({
    required String token,
    required bool loading,
    required String classId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> patchVirtualOrder({
    required String orderType,
    required String virtualOrderId,
    required String status,
    required String token,
    required bool loading,
  }) {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> sendMessage({
    required String token,
    required SendMessage message,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  /// API to get creator subject
  @override
  Future<ResponseModel> getCreatorSubject({
    required String token,
    required String lan,
    required bool loading,
    required String creatorId,
    required String ageGroupId,
  }) {
    throw UnimplementedError();
  }

  /// API to get Wallet settings
  @override
  Future<ResponseModel> getWalletSettings({
    required String token,
    required String lan,
    required bool loading,
    required String countryCodeName,
  }) {
    throw UnimplementedError();
  }

  /// API to get unread count
  @override
  Future<ResponseModel> getUnreadCount({
    required String token,
    required String lan,
    required bool loading,
    required String chatId,
  }) {
    throw UnimplementedError();
  }

  /// API to post message acknowledge
  @override
  Future<ResponseModel> postAcknowledge({
    required String authorization,
    required String lan,
    required String chatId,
    required num status,
  }) {
    throw UnimplementedError();
  }

  /// API to post App Version
  @override
  Future<ResponseModel> appVersion({
    required String token,
    required String lan,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> createPreOrder({
    required String token,
    required bool isLoading,
    required num amount,
    required String currency,
    required String receipt,
    required String notes,
  }) {
    throw UnimplementedError();
  }
}
