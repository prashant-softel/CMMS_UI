import 'dart:convert';
import 'package:cmms/domain/models/currency.dart';
import 'package:cmms/domain/models/popular_posts_response.dart';

FavouritesData favouritesDataFromJson(String str) =>
    FavouritesData.fromJson(json.decode(str) as Map<String, dynamic>);

String favouritesDataToJson(FavouritesData data) => json.encode(data.toJson());

class FavouritesData {
  FavouritesData({
    this.message,
    this.data,
  });

  factory FavouritesData.fromJson(Map<String, dynamic> json) => FavouritesData(
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? FavouritesDatum()
          : FavouritesDatum.fromJson(json['data'] as Map<String, dynamic>));

  String? message;
  FavouritesDatum? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data?.toJson(),
      };
}

class FavouritesDatum {
  factory FavouritesDatum.fromJson(Map<String, dynamic> json) =>
      FavouritesDatum(
        totalCount: json['totalCount'] as num? ?? 0,
        data: json['data'] == null
            ? []
            : List<Datum>.from((json['data'] as List<dynamic>).map<dynamic>(
                (dynamic x) => Datum.fromJson(x as Map<String, dynamic>))),
      );
  FavouritesDatum({
    this.totalCount,
    this.data,
  });

  num? totalCount;
  List<Datum>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'totalCount': totalCount,
        'data':
            List<dynamic>.from(data!.map<dynamic>((dynamic x) => x.toJson())),
      };
}

class Datum {
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json['userId'] as String? ?? '',
        username: json['username'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        postType: json['postType'] as String? ?? '',
        sharedOnPersonalFeed: json['sharedOnPersonalFeed'] as bool? ?? false,
        description: json['description'] as String? ?? '',
        postedAt: json['postedAt'] as num? ?? 0,
        price: json['price'] as String? ?? '',
        postData: json['postData'] == null
            ? []
            : List<PostData>.from((json['postData'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    PostData.fromJson(x as Map<String, dynamic>))),
        viewCount: json['viewCount'],
        commentCount: json['commentCount'] as num? ?? 0,
        totalTipReceived: json['totalTipReceived'] as String? ?? '',
        currency: json['currency'] == null
            ? Currency()
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
        postId: json['postId'] as String? ?? '',
        postedOn: json['postedOn'] as String? ?? '',
        allowComments: json['allowComments'] as bool? ?? false,
        allowDownload: json['allowDownload'] as bool? ?? false,
        allowShare: json['allowShare'] as bool? ?? false,
        isLike: json['isLike'] as num? ?? 0,
        totalLike: json['totalLike'] as num? ?? 0,
        isVisible: json['isVisible'] as num? ?? 0,
      );
  Datum({
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.postType,
    this.sharedOnPersonalFeed,
    this.description,
    this.postedAt,
    this.price,
    this.postData,
    this.viewCount,
    this.commentCount,
    this.totalTipReceived,
    this.currency,
    this.postId,
    this.postedOn,
    this.allowComments,
    this.allowDownload,
    this.allowShare,
    this.taggedUsers,
    this.isLike,
    this.totalLike,
    this.isVisible,
  });

  String? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? postType;
  bool? sharedOnPersonalFeed;
  String? description;
  num? postedAt;
  String? price;
  List<PostData>? postData;
  dynamic viewCount;
  num? commentCount;
  String? totalTipReceived;
  Currency? currency;
  String? postId;
  String? postedOn;
  bool? allowComments;
  bool? allowDownload;
  bool? allowShare;
  List<PopularTaggedUsers>? taggedUsers;
  num? isLike;
  num? totalLike;
  num? isVisible;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic,
        'postType': postType,
        'sharedOnPersonalFeed': sharedOnPersonalFeed,
        'description': description,
        'postedAt': postedAt,
        'price': price,
        'postData':
            List<dynamic>.from(postData!.map<dynamic>((x) => x.toJson())),
        'viewCount': viewCount,
        'commentCount': commentCount,
        'totalTipReceived': totalTipReceived,
        'currency': currency?.toJson(),
        'postId': postId,
        'postedOn': postedOn,
        'allowComments': allowComments,
        'allowDownload': allowDownload,
        'allowShare': allowShare,
        'taggedUsers':
            List<dynamic>.from(taggedUsers!.map<dynamic>((dynamic x) => x)),
        'isLike': isLike,
        'totalLike': totalLike,
        'isVisible': isVisible,
      };
}
