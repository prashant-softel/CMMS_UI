class CancelPermitRequestModel {
  CancelPermitRequestModel({
    this.id,
    this.comment,
    this.conditionIds,
    this.fileId,
  });
  int? id;
  String? comment;
  List<int?>? conditionIds;
  int? fileId;

  factory CancelPermitRequestModel.fromJson(Map<String, dynamic> json) => CancelPermitRequestModel(
        id: json["id"],
        comment: json["comment"],
        conditionIds: json["conditionIds"]!=null? List<int>.from(json["conditionIds"].map((x) => x)):[],
        fileId: json['fileId']
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "conditionIds": List<dynamic>.from(conditionIds!.map((x) => x)),
        "fileId": fileId
      };
}
