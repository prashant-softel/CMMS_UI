class UpdateWarrantyClaim {
  int? id;
  int? facilityId;
  String? comment;
  List<dynamic>? uploadfile_ids;

  UpdateWarrantyClaim({
    this.id,
    this.facilityId,
    this.comment,
    this.uploadfile_ids,
  });

  factory UpdateWarrantyClaim.fromJson(Map<String, dynamic> json) =>
      UpdateWarrantyClaim(
        id: json['id'],
        facilityId: json['facilityId'],
        comment: json['comment'],
        uploadfile_ids: json["uploadfile_ids"] != null
            ? List<int>.from(json["uploadfile_ids"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'facilityId': facilityId,
        'comment': comment,
        "uploadfile_ids": List<dynamic>.from(uploadfile_ids!.map((x) => x)),
      };
}
