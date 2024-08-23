class CommentModel {
  CommentModel({
    this.comment,
    this.id,
    this.facilityId,
  });
  int? id;
  int? facilityId;
  String? comment;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        comment: json["comment"],
        facilityId: json["facilityId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "facilityId": facilityId,
      };
}

class CommentModelWithFlag {
  CommentModelWithFlag(
      {this.comment,
      this.id,
      this.is_why_why_required,
      this.is_investigation_required});
  int? id;
  String? comment;
  int? is_why_why_required;
  int? is_investigation_required;

  factory CommentModelWithFlag.fromJson(Map<String, dynamic> json) =>
      CommentModelWithFlag(
        id: json["id"],
        comment: json["comment"],
        is_why_why_required: json["is_why_why_required"],
        is_investigation_required: json["is_investigation_required"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "is_why_why_required": is_why_why_required,
        "is_investigation_required": is_investigation_required,
      };
}
