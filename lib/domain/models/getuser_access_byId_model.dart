import 'dart:convert';

import 'package:get/get.dart';

GetAccessLevelByIdModel getaccessLevelModelFromJson(String str) =>
    GetAccessLevelByIdModel.fromJson(json.decode(str));

class GetAccessLevelByIdModel {
  int? user_id;
  String? user_name;
  List<GetAccessLevel>? access_list;

  GetAccessLevelByIdModel({this.user_id, this.user_name, this.access_list});

  factory GetAccessLevelByIdModel.fromJson(Map<String, dynamic> parsedJson) {
    var access_list = parsedJson['access_list'] as List;
    print(access_list.runtimeType);
    List<GetAccessLevel> accessLevel =
        access_list.map((i) => GetAccessLevel.fromJson(i)).toList();

    return GetAccessLevelByIdModel(
        user_id: parsedJson['user_id'],
        user_name: parsedJson['user_name'],
        access_list: accessLevel);
  }
}

class GetAccessLevel {
  RxInt feature_id = RxInt(0);
  RxString feature_name = RxString('');
  RxInt add = RxInt(0);
  RxInt edit = RxInt(0);
  RxInt delete = RxInt(0);
  RxInt view = RxInt(0);
  RxInt issue = RxInt(0);
  RxInt selfView = RxInt(0);
  RxInt approve = RxInt(0);

  GetAccessLevel(
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
  factory GetAccessLevel.fromJson(Map<String, dynamic> parsedJson) {
    return GetAccessLevel(
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
