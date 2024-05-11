class TrainingCourse {
  TrainingCourse({
    this.id,
    this.name,
    this.categoryId,
    this.categoryName,
    this.groupId,
    this.groupName,
    this.numberOfDays,
    this.duration,
    this.maximumCapicity,
    this.description,
  });

  int? id;
  String? name;
  int? categoryId;
  String? categoryName;
  int? groupId;
  String? groupName;
  int? numberOfDays;
  int? duration;
  int? maximumCapicity;
  String? description;

  factory TrainingCourse.fromJson(Map<String, dynamic> json) => TrainingCourse(
        id: json["id"],
        name: json["name"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        groupId: json["groupId"],
        groupName: json["groupName"],
        numberOfDays: json["numberOfDays"],
        duration: json["duration"],
        maximumCapicity: json["maximumCapicity"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "categoryId": categoryId,
    "categoryName": categoryName,
    "groupId": groupId,
    "groupName": groupName,
    "numberOfDays": numberOfDays,
    "duration": duration,
    "maximumCapicity": maximumCapicity,
    "description": description,
  };
}
