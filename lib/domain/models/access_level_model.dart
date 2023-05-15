import 'dart:convert';

import 'package:get/get.dart';

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
  RxInt feature_id = RxInt(0);
  RxString feature_name = RxString('');
  RxInt add = RxInt(0);
  RxInt edit = RxInt(0);
  RxInt delete = RxInt(0);
  RxInt view = RxInt(0);
  RxInt issue = RxInt(0);
  RxInt selfView = RxInt(0);
  RxInt approve = RxInt(0);

  AccessLevel(
      {required int feature_id,
      required String feature_name,
      required int add,
      required int delete,
      required int edit,
      required int issue,
      required int selfView,
      required int approve,
      required int view}) {
    this.feature_id.value = feature_id;
    this.feature_name.value = feature_name;
    this.add.value = add;
    this.delete.value = delete;
    this.edit.value = edit;
    this.issue.value = issue;
    this.selfView.value = selfView;
    this.approve.value = approve;
    this.view.value = view;
  }
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
