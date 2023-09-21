class ExtendPermitModel {
  ExtendPermitModel({
    this.id,
    this.extend_by_minutes,
    this.comment,
    this.conditionIds,
    this.fileIds,
  });
  int? id;
  int? extend_by_minutes;
  String? comment;
  List<int?>? conditionIds;
  List<dynamic>? fileIds;

  factory ExtendPermitModel.fromJson(Map<String, dynamic> json) => ExtendPermitModel(
        id: json["id"],
        extend_by_minutes: json['extend_by_minutes'],
        comment: json["comment"],
        conditionIds: json["conditionIds"]!=null? List<int>.from(json["conditionIds"].map((x) => x)):[],
        fileIds: json['fileIds']!=null? List<int>.from(json["fileIds"].map((x) => x)):[],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "extend_by_minutes": extend_by_minutes,
        "comment": comment,
        "conditionIds": List<dynamic>.from(conditionIds!.map((x) => x)),
        "fileIds": List<dynamic>.from(fileIds!.map((x) => x)),
      };
}
