// class TypeModel {
//   final String name;
//   final String id;

//   TypeModel({required this.name, required this.id});
// }

class TypeModel {
  final String name;
  final String? id;

  TypeModel({required this.name, this.id});

  TypeModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}

// class TypeModel {
//   final String name;
//   final String id;

//   TypeModel({required this.name, required this.id});
// }

class GenderModel {
  final String name;
  final String? id;

  GenderModel({required this.name, this.id});

  GenderModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}
