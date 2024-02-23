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
  int? id;
  int? sequence_no;
  String description;

  BodyInjeredTypeModel(
      {required this.name,
      required this.description,
      this.id,
      this.sequence_no});

  factory BodyInjeredTypeModel.fromJson(Map<String, dynamic> json) =>
      BodyInjeredTypeModel(
          name: json['name'],
          description: json['description'],
          sequence_no: json['sequence_no'],
          id: json['id']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'sequence_no': sequence_no,
        'id': id,
        'description': description,
      };
}
