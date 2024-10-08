class CommentModel {
  CommentModel({
    this.comment,
    this.id,
    this.facilityId,
    this.action_taken,
  });
  int? id;
  int? facilityId;
  String? comment;
  String? action_taken;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        comment: json["comment"],
        facilityId: json["facilityId"],
        action_taken: json["action_taken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "facilityId": facilityId,
        "action_taken": action_taken,
      };
}

class CommentModelWithFlag {
  CommentModelWithFlag(
      {this.comment,
      this.id,
      this.action_taken,
      this.is_why_why_required,
      this.is_investigation_required});
  int? id;
  String? comment;
  String? action_taken;
  int? is_why_why_required;
  int? is_investigation_required;

  factory CommentModelWithFlag.fromJson(Map<String, dynamic> json) =>
      CommentModelWithFlag(
        id: json["id"],
        comment: json["comment"],
        action_taken: json["action_taken"],
        is_why_why_required: json["is_why_why_required"],
        is_investigation_required: json["is_investigation_required"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "action_taken": action_taken,
        "is_why_why_required": is_why_why_required,
        "is_investigation_required": is_investigation_required,
      };
}
