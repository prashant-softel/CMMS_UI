class CommentModel {
  CommentModel({
    this.comment,
    this.id,
  });
  int? id;
  String? comment;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
      };
}
