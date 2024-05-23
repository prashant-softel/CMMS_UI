class AddTrainingCourse {
  int? id;
  String? name;
  int? categoryId;
  int? groupId;
  int? numberOfdays;
  int? duration;
  int? maxCap;
  String? description;
  dynamic uploadfile_ids;
  int? facilityId;

  AddTrainingCourse({
    this.id,
    this.name,
    this.categoryId,
    this.groupId,
    this.numberOfdays,
    this.duration,
    this.maxCap,
    this.description,
    this.uploadfile_ids,
    this.facilityId,
  });

  factory AddTrainingCourse.fromJson(Map<String, dynamic> json) =>
      AddTrainingCourse(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        groupId: json["group_id"],
        numberOfdays: json["number_of_days"],
        duration: json["duration"],
        maxCap: json["max_cap"],
        description: json["description"],
        uploadfile_ids: json["uploadfile_ids"],
        facilityId: json["facility_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "group_id": groupId,
        "number_of_days": numberOfdays,
        "duration": duration,
        "max_cap": maxCap,
        "description": description,
        "uploadfile_ids": uploadfile_ids,
        "facility_id": facilityId,
      };
}
