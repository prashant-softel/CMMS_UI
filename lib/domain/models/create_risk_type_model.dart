class CreateRiskTypeModel {
  String name;
  String description;

  CreateRiskTypeModel({
    required this.name,
    required this.description,
  });

  factory CreateRiskTypeModel.fromJson(Map<String, dynamic> json) =>
      CreateRiskTypeModel(
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}

class BodyInjeredTypeModel {
  String name;
  String description;

  BodyInjeredTypeModel({
    required this.name,
    required this.description,
  });

  factory BodyInjeredTypeModel.fromJson(Map<String, dynamic> json) =>
      BodyInjeredTypeModel(
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}
