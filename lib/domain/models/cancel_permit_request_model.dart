class CancelPermitRequestModel {
  CancelPermitRequestModel({
    this.id,
    this.comment,
    this.conditionIds,
    this.fileIds,
  });
  int? id;
  String? comment;
  List<int?>? conditionIds;
  List<dynamic>? fileIds;

  factory CancelPermitRequestModel.fromJson(Map<String, dynamic> json) => CancelPermitRequestModel(
        id: json["id"],
        comment: json["comment"],
        conditionIds: json["conditionIds"]!=null? List<int>.from(json["conditionIds"].map((x) => x)):[],
        fileIds: json['fileIds']
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "conditionIds": List<dynamic>.from(conditionIds!.map((x) => x)),
        "fileIds": fileIds
      };
}
