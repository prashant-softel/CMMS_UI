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
  int? groupId;
  String? groupName;
  int? number_of_days;
  int? duration;
  int? max_cap;
  String? description;
  int? status;
  String? shortStatus;
  List<ImageDetails>? imageDetails;

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
    this.imageDetails,
    this.status,
    this.shortStatus,
  });

  factory TrainingCourseListModel.fromJson(Map<String, dynamic> json) =>
      TrainingCourseListModel(
        id: json["id"],
        name: json["name"],
        facilityId: json["facility_id"],
        categoryId: json["category_id"],
        categoryName: json["traning_category"],
        groupId: json["group_id"],
        groupName: json["targated_group"],
        number_of_days: json["number_of_days"],
        duration: json["duration"],
        max_cap: json["max_cap"],
        description: json["description"],
        status: json["status"],
        shortStatus: json["short_status"],
        imageDetails: json["imageDetails"] != null
            ? List<ImageDetails>.from(
                json["imageDetails"].map(
                  (x) => ImageDetails.fromJson(x),
                ),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "facility_id": facilityId,
        "category_id": categoryId,
        "traning_category": categoryName,
        "group_id": groupId,
        "targated_group": groupName,
        "number_of_days": number_of_days,
        "duration": duration,
        "max_cap": max_cap,
        "description": description,
      };
}

class ImageDetails {
  int? id;
  String? name;
  String? description;

  ImageDetails({
    this.id,
    this.name,
    this.description,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json) => ImageDetails(
        id: json["id"],
        name: json["fileName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": name,
        "description": description,
      };
}
