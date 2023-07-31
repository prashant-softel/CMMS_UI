import 'dart:convert';

List<PaiedModel> paidByFromJson(String str) =>
    List<PaiedModel>.from(json.decode(str).map(PaiedModel.fromJson));

String paidByToJson(List<PaiedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaiedModel {
  int? id;
  String? name;
  int? status;
  String? created_at;
  int? created_by;
  String? updated_at;
  int? updated_by;

  // int? status;

  PaiedModel({
    this.id,
    this.name,
    this.status,
    this.created_at,
    this.created_by,
    this.updated_at,
    this.updated_by,

    // this.status,
  });

  PaiedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['paid_by'];
    status = json['status'];
    created_at = json['created_at'];
    created_by = json['created_by'];
    updated_at = json['updated_at'];
    updated_by = json['updated_by'];

    // status = json['status'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "paid_by": name,
        "status": status,
        "created_at": created_at,
        "created_by": created_by,
        "updated_at": updated_at,
        "updated_by": updated_by
      };
}
