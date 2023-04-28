class PermitIssueModel {
  List<int>? id;
  String? message;

  PermitIssueModel({this.id, this.message});

  PermitIssueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].cast<int>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    return data;
  }
}