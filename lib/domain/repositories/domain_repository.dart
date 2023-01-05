// coverage:ignore-file

import 'package:cmms/domain/domain.dart';

/// Abstract classes that define functionality for data and device layers.
///
/// Will be ignored for test since all are static values and would not change.
abstract class DomainRepository {
  /// Get the string value for the [key].
  ///LoginResponsewhich [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value);

  /// Clear data from local storage for [key].
  void clearData(dynamic key);

  /// Delete box
  void deleteBox();

  /// Get stored value
  String getStringValue(String key);

  /// Get the boolean value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key);

  /// [key] : The key whose value is needed.
  Future<String> getSecuredValue(String key);

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved in secure storage.
  /// [value] : The value which needs to be saved.
  void saveValueSecurely(String key, String value);

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key);

  /// Remove all data from secure storage.
  void deleteAllSecuredValues();

  //=============

  /// Guest Login
  Future<dynamic> guestLogin();

  /// User Login API call
  Future<dynamic> loginUser({
    required String email,
    required String password,
    required LoginType loginType,
    required String phoneNumber,
    required String countryCode,
    required String verificationId,
    required String token,
    required String appleId,
    required bool loading,
    String? googleId,
  });

  ///Api to get ratings
  ///
  Future<ResponseModel> getRatings({
    required String token,
    required String linkedWith,
    required bool isLoading,
  });

  /// API to get myClasses
  ///
  Future<ResponseModel> getMyClasses({
    required bool loading,
    required String token,
    required int offset,
    required int limit,
    required String filter,
  });

  /// API to get myClasses Details
  ///
  Future<ResponseModel> getMyClassesDetails({
    required String token,
    required bool loading,
    required String classId,
  });

  /// Get the previous tutor data
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
  });

  /// API to get favourites
  ///
  Future<ResponseModel> getFavourites({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  });

  ///Api to post review rating
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
  });

  /// User Signup API call
  Future<dynamic> signupUserModel({
    required SignUpType signUpType,
    required String firstName,
    required String googleId,
    required String facebookId,
    required String appleId,
    required String lastName,
    required String email,
    required String password,
    required String token,
    required String timezone,
    required String countryCode,
    required String phoneNumber,
    required String inviterReferralCode,
    required String countryCodeName,
  });

  /// Instant Class Request
  ///
  Future<ResponseModel> instantClassRequest({
    required ClassRequestBody classRequest,
    required String token,
  });

  /// Creator Signup API
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
  });

  /// Forgot Password API
  Future<dynamic> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
    required String token,
  });

  ///logout
  Future<void> logout({
    required String authToken,
    required String refreshToken,
  });

  /// Check Username is valid or not (1-Signup, 2-Login)
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
    required String token,
  });

  /// Validate Phone number
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
    required String token,
    required bool isLoading,
    required String trigger,
  });

  /// Send Verification code
  Future<dynamic> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String userId,
    required bool isUpdatingPhoneNumber,
    required String token,
    required bool isLoading,
  });

  /// Validate Verification code
  Future<ResponseModel> validateVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String code,
    required String verificationId,
    required String token,
    required bool loading,
  });

  /// Resend Verification code
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
    required String token,
  });

  /// Validate email code
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
    required String token,
    required bool isLoading,
  });

  /// Config App
  Future<dynamic> config({
    required String token,
  });

  /// Social verify
  Future<ResponseModel> socialVerify(
      {required String token,
      required bool loading,
      required String langCode,
      required String id,
      required SocialType type,
      required SocialTrigger trigger});

  /// API to get the cognito token
  Future<ResponseModel> getCognitoToken(
      {required String token, required bool loading});

  /// API to search a model by the name
  Future<ResponseModel> searchModel(
      {required String token,
      required String lan,
      required String searchText,
      required String offset,
      required String limit,
      required bool loading});

  /// API to get the popular posts
  Future<ResponseModel> getPopularPosts(
      {required String token,
      required String lan,
      required bool loading,
      required String pageNumber});

  /// API to get the IP of the user
  Future<String> getIp();

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
  });

  /// API to get the cognito identity
  Future<ResponseModel> getCognitoIdentity({
    required bool loading,
    required String region,
    required String identityId,
    required String cognitoToken,
  });

  /// API to get the popular hashtags
  Future<ResponseModel> getPopularHashtags({
    required String token,
    required String lan,
    required bool loading,
    int? set,
    int? limit,
    int? postLimit,
  });

  /// API to get the featured creators
  Future<ResponseModel> getFeaturedCreators(
      {required String token,
      required String lan,
      required String countryName,
      required bool loading,
      required int offset,
      required int limit,
      required String searchText});

  /// API to get user notification count.
  Future<ResponseModel> getNotificationCount({
    required String authToken,
    required String appName,
  });

  /// API to get the list of popular models
  Future<ResponseModel> getPopularModels({
    required String token,
    required bool loading,
    required String searchText,
    required String skip,
    required String limit,
    required String userId,
  });

  /// API to get the list of popular models
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
  });

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
  });

  /// API to bookmark a post
  Future<ResponseModel> bookmarkPost({
    required String token,
    required String postId,
    required String collectionId,
    required bool loading,
  });

  /// API to create a new collection
  Future<ResponseModel> createCollection({
    required String token,
    required String title,
    required bool loading,
    required String coverImage,
  });

  /// API to create a new collection
  Future<ResponseModel> getCollections({
    required String token,
    required String limit,
    required String offset,
    required bool loading,
  });

  /// API to unBookmark a post
  Future<ResponseModel> unBookmark({
    required String token,
    required bool isCollection,
    required List<String> postIds,
    required bool loading,
    required String collectionId,
  });

  /// API to report a post
  Future<ResponseModel> report({
    required String token,
    required String reportType,
    required String reportedId,
    required String reason,
    required bool loading,
  });

  /// API to get reasons to report
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
  });

  /// API to get list of people who have commented on a post
  Future<ResponseModel> getCommentsList({
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
  });

  /// API to get list of people who have commented on a post
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
  });

  /// API to get list of posts user have liked
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
  });

  /// API to get count of followers and followings
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
  });

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
  });

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
  });

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
  });

  /// API for Html Pages
  Future<ResponseModel> getHtmlPages({
    required String token,
    required String lan,
    required bool isLoading,
    required int type,
  });

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
    required dynamic socialMediaLink,
    required String timezone,
  });

  /// API to list the user stories.
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
  });

  /// API to get the user story data
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
  });

  /// API to view the creator's story
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
  });

  /// API to view the creator's story
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
  });

  /// user Account Delete api (Deactivate Account)
  Future<ResponseModel> deactivateAccount({
    required String token,
    required String lan,
    required bool deleteConfirmation,
    required String id,
    required String reason,
    required bool loading,
  });

  Future<ResponseModel> patchEmail({
    required String token,
    required String lan,
    required String newEmail,
    required bool loading,
  });

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
  });

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
  });

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
  });

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
  });

  /// API to get Latest posts
  Future<ResponseModel> getLatestPosts({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
  });

  /// API to get Collection Details posts
  Future<ResponseModel> getCollectionDetails({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
    required String collectionId,
  });

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
  });

  Future<ResponseModel> getFeaturedCollection({
    required String token,
    required String userId,
    required bool loading,
    required String limit,
    required String offset,
  });

  Future<ResponseModel> unfollowUser(
      {required String token,
      required String lan,
      required bool loading,
      required String ipAddress,
      required String city,
      required String country,
      required String lat,
      required String lng,
      required String userIdToFollow});

  Future<ResponseModel> getNotification({
    required String token,
    required bool loading,
    required int skip,
    required int limit,
    required String appName,
  });

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
  });

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
  });

  /// API to get the banner
  Future<ResponseModel> getBanners({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
  });

  ///API to get the preSignedUrl in order to upload the image to AWS
  Future<ResponseModel> getPreSignedUrl(
      {required bool loading,
      required String folder,
      required String fileName,
      required String token,
      required String bucketName});

  ///API to get hashtags
  Future<ResponseModel> hashtags(
      {required bool loading,
      required String hashtag,
      required String pageNumber,
      required String token});

  ///API to get hashtags
  Future<ResponseModel> uploadFileToAws(
      {required bool loading,
      required dynamic file,
      required String token,
      required String url});

  ///API to post a story
  Future<ResponseModel> postStory(
      {required bool loading,
      required int storyType,
      required List<StoryDataPost> storyData,
      required String token,
      required String currencyCode,
      required String currencySymbol});

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
      required String currencySymbol});

  /// API to uGet active stories
  Future<ResponseModel> getActiveStories({
    required bool loading,
    required String token,
  });

  /// API to Delete active story
  Future<ResponseModel> deleteActiveStory({
    required bool loading,
    required String token,
    required String storyId,
    required bool isFullStory,
  });

  /// API to get the user profile
  Future<ResponseModel> getUserProfile({
    required String token,
    required String lan,
    required bool loading,
    required String userId,
    required String status,
  });

  ///API to get the User's Assets
  Future<ResponseModel> getUserAssets({
    required bool loading,
    required String userId,
    required String pageNumber,
    required String status,
    required String token,
  });

  ///API to get the User's Locked Assets
  Future<ResponseModel> getUserLockedAssets({
    required bool loading,
    required String userId,
    required String pageNumber,
    required String status,
    required String token,
    required String postType,
  });

  /// API to Get types of document.
  Future<ResponseModel> getDocumentTypes({
    required bool loading,
    required String token,
  });

  /// API to post documents.
  Future<ResponseModel> postDocuments({
    required String token,
    required bool loading,
    required String backImage,
    required String documentTypeId,
    required String frontImage,
    required String userId,
  });

  /// API to get blocked users
  Future<ResponseModel> getBlockedUsers({
    required bool loading,
    required String token,
    required int limit,
    required int offset,
  });

  ///API to get the Orders
  Future<ResponseModel?> getMyOrders({
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
  });

  /// API to block/Unblock a user.
  Future<ResponseModel> blockUnblockUser({
    required bool loading,
    required String token,
    required String opponentUserId,
    required String trigger,
  });

  /// API  to get collection Info
  Future<ResponseModel> getCollectionInfo({
    required String token,
    required String collectionId,
    required bool loading,
  });

  /// API to patch collection Info
  Future<ResponseModel> patchCollection({
    required String token,
    required String collectionId,
    required String collectionName,
    required bool loading,
    required String collectionCover,
  });

  /// API to delete a collection
  Future<ResponseModel> deleteCollection({
    required String token,
    required bool isCollection,
    required String collectionId,
    required bool loading,
  });

  /// API to get bookmarks
  Future<ResponseModel> getBookmarks({
    required String token,
    required bool loading,
    required String limit,
    required String offset,
  });

  /// API to bookmark a post
  Future<ResponseModel> bookmarkPosts({
    required String token,
    required String collectionId,
    required List<String> postIds,
    required bool loading,
  });

  /// API to Refresh Token
  Future<ResponseModel> refreshToken({
    required String token,
    required String lan,
    required bool loading,
    required String refreshToken,
    required String accessToken,
  });

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
  });

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
  });

  ///API to get the User's Locked Assets
  Future<ResponseModel> getUserLockedPosts({
    required bool loading,
    required int limit,
    required int offset,
    required String token,
  });

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
  });

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
  });

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
  });

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
  });

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
  });

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
  });

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
      required int limit});

  /// API to get subjects
  Future<ResponseModel> getSubjects({
    required int offset,
    required int limit,
    required String token,
    required String dateOfBirth,
    required bool loading,
  });

  /// API to get interests
  Future<ResponseModel> getInterests({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  });

  /// API to get students
  ///
  Future<ResponseModel> getStudents({
    required String token,
    required String studentId,
    required bool isLoading,
    required int offset,
    required int limit,
    required int status,
  });

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
  });

  Future<ResponseModel> deleteStudent({
    required String token,
    required String reason,
    required List<String> studentIds,
    required bool isLoading,
  });

  /// API to patch student details.
  ///
  Future<ResponseModel> patchStudent({
    required String studentId,
    required String parentId,
    required String avatarId,
    required String firstName,
    required String lastName,
    required String ageGroupId,
    required String profilePic,
    required String birthDate,
    required String gender,
    required String token,
    required List<String> subjectIds,
    required List<String> interestIds,
    required bool isLoading,
  });

  /// API to get avatars
  ///
  Future<ResponseModel> getProfileAvatars({
    required int offset,
    required int limit,
    required String token,
    required bool loading,
  });

  /// API to get learning objectives
  ///
  Future<ResponseModel> getLearningObjectives({
    required String token,
    required bool isLoading,
    required int offset,
    required int limit,
    required int status,
  });

  /// Mark a student as default.
  ///
  Future<ResponseModel> markAStudentAsDefault({
    required String token,
    required String studentId,
    required bool markAsDefault,
    required bool isLoading,
  });

  /// API to get the age groups
  Future<ResponseModel> getAgeGroup(
      {required String token,
      required String lan,
      required bool loading,
      required String offset,
      required String limit});

  /// API to get the Learning Objective By Subject
  Future<ResponseModel> getLearningObjectiveBySubject({
    required String token,
    required bool loading,
    required List<String> subjectIds,
    required String ageGroupId,
  });

  /// API to delete asset.
  ///
  Future<ResponseModel> deleteAsset({
    required String token,
    required bool loading,
    required int status,
    required List<String> postIds,
  });

  /// Instant Class Status
  ///
  Future<ResponseModel> instantClassStatus({
    required String parentId,
    required String childId,
    required String token,
    required int status,
    required bool isLoading,
  });

  ///Api to get reasons
  ///
  Future<ResponseModel> getReasons({
    required String token,
    required String lan,
    required int type,
  });

  /// API to post wallet
  ///
  Future<ResponseModel> postWallet({
    required String userId,
    required String userType,
    required String currency,
    required String token,
    required bool isLoading,
  });

  /// Api is use to user can recharge wallet
  ///
  Future<ResponseModel> rechargeWallet({
    required String token,
    required String lan,
    required String paymentMethod,
    required String pgLinkId,
    required int type,
    required num amount,
    required bool isLoading,
  });

  ///API to get the Country link
  ///
  Future<ResponseModel> getCountryLink({
    required String token,
    required String lan,
    required bool loading,
    required String countryCode,
  });

  /// Api to post cancel class
  ///
  Future<ResponseModel> cancelClass({
    required String token,
    required String lan,
    required String classId,
    required String reason,
    required bool isLoading,
  });

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
  });

  Future<ResponseModel?> getMessages({
    required String authorization,
    required String langCode,
    required String chatId,
    required String timeStamp,
    int? pageSize,
  });

  Future<ResponseModel?> deleteChat({
    required String authorization,
    required String langCode,
    required String chatID,
  });

  Future<ResponseModel?> chatMediaDoc({
    required String authorization,
    required String langCode,
    required String chatId,
  });

  /// API to get the Previous Class
  Future<ResponseModel> getPreviousClass(
      {required String token,
      required String lan,
      required bool loading,
      required String offset,
      required String fromDate,
      required String toDate,
      String? searchText,
      required List<String> subjectId,
      required String limit});

  /// API to mark a teacher as favorite or unfavorite
  Future<ResponseModel> markAsFavUnFav(
      {required String authorization,
      required String langCode,
      required String parentId,
      required String trigger});

  /// API to get the list of favorite tutors
  Future<ResponseModel> getFavTutors(
      {required String authorization,
      required String skip,
      required String limit,
      required bool loading,
      required String searchText,
      required String langCode});

  /// API to get teacher's availability
  Future<ResponseModel> getTeacherAvailability(
      {required String authorization,
      required String langCode,
      required String timeZone,
      required String ageGroupId,
      required String teacherId});

  /// API to get previous Class and Tutor

  Future<ResponseModel> getPreviousClassAndTutor({
    required String token,
    required String lan,
    required bool loading,
  });

  /// API to patch virtual order.
  ///
  Future<ResponseModel> patchVirtualOrder({
    required String orderType,
    required String virtualOrderId,
    required String status,
    required String token,
    required bool loading,
  });

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
  });

  /// API to send message
  ///
  Future<ResponseModel> sendMessage({
    required String token,
    required SendMessage message,
    required bool isLoading,
  });

  /// API to get creator subject
  Future<ResponseModel> getCreatorSubject({
    required String token,
    required String lan,
    required bool loading,
    required String creatorId,
    required String ageGroupId,
  });

  /// API to get Wallet settings
  Future<ResponseModel> getWalletSettings({
    required String token,
    required String lan,
    required bool loading,
    required String countryCodeName,
  });

  /// API to get unread count
  Future<ResponseModel?> getUnreadCount({
    required String token,
    required String lan,
    required String chatId,
    required bool loading,
  });

  /// API to post message acknowledge
  Future<ResponseModel> postAcknowledge({
    required String authorization,
    required String lan,
    required String chatId,
    required num status,
  });

  /// API to post App Version
  Future<ResponseModel> appVersion({
    required String token,
    required String lan,
    required bool isLoading,
  });

  /// API to craete pre-orders
  ///
  Future<ResponseModel> createPreOrder({
    required String token,
    required bool isLoading,
    required num amount,
    required String currency,
    required String receipt,
    required String notes,
  });
}
