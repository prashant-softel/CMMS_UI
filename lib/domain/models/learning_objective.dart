// // To parse this JSON data, do
// //
// //     final learningObjective = learningObjectiveFromJson(jsonString);

// import 'dart:convert';

// LearningObjectiveReponse learningObjectiveFromJson(String str) =>
//     LearningObjectiveReponse.fromJson(json.decode(str) as Map<String, dynamic>);

// String learningObjectiveToJson(LearningObjectiveReponse data) =>
//     json.encode(data.toJson());

// class LearningObjectiveReponse {
//   LearningObjectiveReponse({
//     this.message,
//     this.data,
//     // this.totalCount,
//   });

//   factory LearningObjectiveReponse.fromJson(Map<String, dynamic> json) =>
//       LearningObjectiveReponse(
//         message: json['message'] as String? ?? '',
//         data: List<LearningObjectiveData>.from((json['data'] as List<dynamic>)
//             .map<dynamic>((dynamic x) =>
//                 LearningObjectiveData.fromJson(x as Map<String, dynamic>))),
//         // totalCount: json['totalCount'] as int? ?? 0,
//       );

//   String? message;
//   List<LearningObjectiveData>? data;
//   // int? totalCount;

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'message': message,
//         'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
//         // 'totalCount': totalCount,
//       };
// }

// class LearningObjectiveData {
//   LearningObjectiveData({
//     this.id,
//     this.learningObjective,
//   });

//   factory LearningObjectiveData.fromJson(Map<String, dynamic> json) =>
//       LearningObjectiveData(
//         id: json['_id'] as String? ?? '',
//         learningObjective: json['learningObjective'] as String? ?? '',
//       );

//   String? id;
//   String? learningObjective;

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         '_id': id,
//         'learningObjective': learningObjective!,
//       };
// }

// To parse this JSON data, do
//
//     final learningObjectiveReponse = learningObjectiveReponseFromJson(jsonString);

import 'dart:convert';

LearningObjectiveReponse learningObjectiveFromJson(String str) =>
    LearningObjectiveReponse.fromJson(json.decode(str) as Map<String, dynamic>);

String learningObjectiveToJson(LearningObjectiveReponse data) =>
    json.encode(data.toJson());

class LearningObjectiveReponse {
  LearningObjectiveReponse({
    this.message,
    this.data,
  });

  factory LearningObjectiveReponse.fromJson(Map<String, dynamic> json) =>
      LearningObjectiveReponse(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? []
            : List<LearningObjectiveData>.from((json['data']
                        as List<dynamic>? ??
                    <dynamic>[])
                .map<dynamic>((dynamic x) =>
                    LearningObjectiveData.fromJson(x as Map<String, dynamic>))),
      );

  String? message;
  List<LearningObjectiveData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class LearningObjectiveData {
  LearningObjectiveData({
    this.learningObjectives,
    this.id,
    this.subject,
  });

  factory LearningObjectiveData.fromJson(Map<String, dynamic> json) =>
      LearningObjectiveData(
        learningObjectives: json['learningObjectives'] == null
            ? []
            : List<LearningObjectives>.from((json['learningObjectives']
                        as List<dynamic>? ??
                    <dynamic>[])
                .map<dynamic>((dynamic x) =>
                    LearningObjectives.fromJson(x as Map<String, dynamic>))),
        id: json['_id'] as String? ?? '',
        subject: json['subject'] as String? ?? '',
      );

  List<LearningObjectives>? learningObjectives;
  String? id;
  String? subject;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'learningObjectives': List<dynamic>.from(
            learningObjectives!.map<dynamic>((x) => x.toJson())),
        '_id': id,
        'subject': subject,
      };
}

class LearningObjectives {
  LearningObjectives({
    this.id,
    this.learningObjective,
  });

  factory LearningObjectives.fromJson(Map<String, dynamic> json) =>
      LearningObjectives(
        id: json['_id'] as String? ?? '',
        learningObjective: json['learningObjective'] as String? ?? '',
      );

  String? id;
  String? learningObjective;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'learningObjective': learningObjective,
      };
}
