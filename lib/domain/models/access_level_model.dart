import 'dart:convert';

AccessLevelModel accessLevelModelFromJson(String str) =>
    AccessLevelModel.fromJson(json.decode(str));

class AccessLevelModel {
  int? role_id;
  String? role_name;
  List<AccessLevel>? access_list;

  AccessLevelModel({this.role_id, this.role_name, this.access_list});

  factory AccessLevelModel.fromJson(Map<String, dynamic> parsedJson) {
    var access_list = parsedJson['access_list'] as List;
    print(access_list.runtimeType);
    List<AccessLevel> accessLevel =
        access_list.map((i) => AccessLevel.fromJson(i)).toList();

    return AccessLevelModel(
        role_id: parsedJson['role_id'],
        role_name: parsedJson['role_name'],
        access_list: accessLevel);
  }
}

class AccessLevel {
  int? feature_id;
  String? feature_name;
  int? add;
  int? edit;
  int? delete;
  int? view;
  int? issue;
  int? selfView;
  int? approve;

  AccessLevel(
      {this.feature_id,
      this.feature_name,
      this.add,
      this.delete,
      this.edit,
      this.issue,
      this.selfView,
      this.approve,
      this.view});

  factory AccessLevel.fromJson(Map<String, dynamic> parsedJson) {
    return AccessLevel(
      feature_id: parsedJson['feature_id'],
      feature_name: parsedJson['feature_name'],
      add: parsedJson['add'],
      delete: parsedJson['delete'],
      edit: parsedJson['edit'],
      issue: parsedJson['issue'],
      selfView: parsedJson['selfView'],
      view: parsedJson['view'],
      approve: parsedJson['approve'],
    );
  }
}
