class AproveExtendPermitModel {
  AproveExtendPermitModel(
      {this.comment, this.id, this.jobId, this.permitId, this.ptwStatus});
  int? id;
  String? comment;
  String? permitId;
  String? ptwStatus;
  int? jobId;

  factory AproveExtendPermitModel.fromJson(Map<String, dynamic> json) =>
      AproveExtendPermitModel(
        id: json["id"],
        comment: json["comment"],
        permitId: json["permitId"],
        jobId: json["jobId"],
        ptwStatus: json["ptwStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "permitId": permitId,
        "jobId": jobId,
        "ptwStatus": ptwStatus,
      };
}
