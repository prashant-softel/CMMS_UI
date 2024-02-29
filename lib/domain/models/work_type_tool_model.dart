class WorkTypeToolModel {
  WorkTypeToolModel(
      {this.id, this.Toolname, this.equipmentCategoryId, this.workTypeId});

  int? id;
  int? workTypeId;
  String? Toolname;
  int? equipmentCategoryId;

  factory WorkTypeToolModel.fromJson(Map<String, dynamic> json) =>
      WorkTypeToolModel(
        id: json["id"],
        workTypeId: json["workTypeId"],
        equipmentCategoryId: json["equipmentCategoryId"],
        Toolname: json["Toolname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workTypeId": workTypeId,
        "equipmentCategoryId": equipmentCategoryId,
        "Toolname": Toolname,
      };
}
