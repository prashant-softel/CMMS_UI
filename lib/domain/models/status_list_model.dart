import 'dart:convert';

StatusList statusListFromJson(String str) =>
    StatusList.fromJson(json.decode(str));

String statusListToJson(StatusList data) => json.encode(data.toJson());

class StatusList {
  int? module_id;
  int? module_software_id;
  String? module_name;
  List<Status?>? status;

  StatusList({
    this.module_id,
    this.module_software_id,
    this.module_name,
    this.status,
  });

  factory StatusList.fromJson(Map<String, dynamic> json) => StatusList(
        module_id: json["module_id"],
        module_software_id: json["module_software_id"],
        module_name: json["module_name"],
        status: json["status"] == null
            ? []
            : List<Status>.from(
                json["status"].map(
                  (x) => Status.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "module_id": module_id,
        "module_software_id": module_software_id,
        "module_name": module_name,
        "status": status == null
            ? []
            : List<dynamic>.from(
                status!.map(
                  (x) => x?.toJson(),
                ),
              ),
      };
}

class Status {
  int? id;
  String? name = "";

  Status({
    this.id,
    this.name,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["status_id"],
        name: json["status_name"],
      );

  Map<String, dynamic> toJson() => {
        "status_id": id,
        "status_name": name,
      };
}
