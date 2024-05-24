import 'dart:convert';

List<TrainingCourseListModel> trainingCourseListFromJson(String str) =>
    List<TrainingCourseListModel>.from(
      json.decode(str).map(
            (x) => TrainingCourseListModel.fromJson(x),
          ),
    );

String trainingCourseListToJson(List<TrainingCourseListModel> data) =>
    json.encode(
      List<dynamic>.from(
        data.map((x) => x.toJson()),
      ),
    );

class TrainingCourseListModel {
  int? id;
  String? name;
  int? facilityId;
  int? categoryId;
  String? categoryName;
  String? groupId;
  String? groupName;
  int? number_of_days;
  int? duration;
  int? max_cap;
  String? description;


  TrainingCourseListModel({
    this.id,
    this.name,
    this.facilityId,
    this.categoryId,
    this.categoryName,
    this.groupId,
    this.groupName,
    this.number_of_days,
    this.duration,
    this.max_cap,
    this.description,
  });

  factory TrainingCourseListModel.fromJson(Map<String, dynamic> json) =>
      TrainingCourseListModel(
        id: json["id"],
        name: json["name"],
        facilityId: json["facility_id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        groupId: json["group_id"],
        groupName: json["group_name"],
        number_of_days: json["number_of_days"],
        duration: json["duration"],
        max_cap: json["max_cap"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "facility_id": facilityId,
        "category_id": categoryId,
        "category_name": categoryName,
        "group_id": groupId,
        "group_name": groupName,
        "number_of_days": number_of_days,
        "duration": duration,
        "max_cap": max_cap,
        "description": description,
      };
}
