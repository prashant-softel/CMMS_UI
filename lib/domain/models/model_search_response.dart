import 'dart:convert';

ModelSearchResp modelSearchRespFromJson(String str) =>
    ModelSearchResp.fromJson(json.decode(str) as Map<String, dynamic>);

String modelSearchRespToJson(ModelSearchResp data) =>
    json.encode(data.toJson());

class ModelSearchResp {
  ModelSearchResp({
    this.message,
    this.data,
  });

  factory ModelSearchResp.fromJson(Map<String, dynamic> json) =>
      ModelSearchResp(
          message: json['message'] as String? ?? '',
          data: json['data'] != null
              ? List<ModelsData>.from(
                  (json['data'] as List<dynamic>).map<dynamic>(
                    (dynamic x) => ModelsData.fromJson(
                      x as Map<String, dynamic>,
                    ),
                  ),
                )
              : []);

  String? message;
  List<ModelsData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': data,
      };
}

class ModelsData {
  ModelsData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
    this.username,
    this.isFollow,
  });

  factory ModelsData.fromJson(Map<String, dynamic> json) => ModelsData(
        id: json['_id'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        profilePic: json['profilePic'] as String? ?? '',
        username: json['username'] as String? ?? '',
        isFollow: json['isFollow'] as bool? ?? false,
      );

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePic;
  String? username;
  bool? isFollow;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'profilePic': profilePic,
        'username': username,
        'isFollow': isFollow,
      };
}
