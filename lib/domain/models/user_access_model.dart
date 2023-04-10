class AccessListModel {
  int? user_id;
  String? user_name;
  List<AccessList>? access_list;

  AccessListModel({this.user_id, this.user_name, this.access_list});

  factory AccessListModel.fromJson(Map<String, dynamic> parsedJson) {
    var access_list = parsedJson['access_list'] as List;
    print(access_list.runtimeType);
    List<AccessList> accessList =
        access_list.map((i) => AccessList.fromJson(i)).toList();

    return AccessListModel(
        user_id: parsedJson['user_id'],
        user_name: parsedJson['user_name'],
        access_list: accessList);
  }
}

class AccessList {
  int? feature_id;
  String? feature_name;
  int? add;
  int? edit;
  int? delete;
  int? view;
  int? issue;
  int? selfView;
  int? approve;

  AccessList(
      {this.feature_id,
      this.feature_name,
      this.add,
      this.delete,
      this.edit,
      this.issue,
      this.selfView,
      this.approve,
      this.view});

  factory AccessList.fromJson(Map<String, dynamic> parsedJson) {
    return AccessList(
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
