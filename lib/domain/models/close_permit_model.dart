class ClosePermitModel {
  ClosePermitModel({
    this.id,
    this.comment,
    this.conditionIds,
    this.fileIds,
  });
  int? id;
  String? comment;
  List<int?>? conditionIds;
  List<dynamic>? fileIds;

  factory ClosePermitModel.fromJson(Map<String, dynamic> json) => ClosePermitModel(
        id: json["id"],
        comment: json["comment"],
        conditionIds: json["conditionIds"]!=null? List<int>.from(json["conditionIds"].map((x) => x)):[],
        fileIds: json['fileIds']!=null? List<int>.from(json["fileIds"].map((x) => x)):[],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "conditionIds": List<dynamic>.from(conditionIds!.map((x) => x)),
        "fileIds": List<dynamic>.from(fileIds!.map((x) => x)),
      };
}
