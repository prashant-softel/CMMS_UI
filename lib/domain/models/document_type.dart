// To parse this JSON data, do
//
//     final documentType = documentTypeFromJson(jsonString);

import 'dart:convert';

DocumentType documentTypeFromJson(String str) =>
    DocumentType.fromJson(json.decode(str) as Map<String, dynamic>);

String documentTypeToJson(DocumentType data) => json.encode(data.toJson());

class DocumentType {
  DocumentType({
    this.message,
    this.data,
  });

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? List<DocumentTypeData>.from((json['data'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    DocumentTypeData.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  String? message;
  List<DocumentTypeData>? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'data': List<dynamic>.from(data!.map<dynamic>((x) => x.toJson())),
      };
}

class DocumentTypeData {
  DocumentTypeData({
    this.id,
    this.name,
    this.backRequire,
    this.frontRequire,
    this.createdTs,
    this.createdDate,
  });

  factory DocumentTypeData.fromJson(Map<String, dynamic> json) =>
      DocumentTypeData(
        id: json['_id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        backRequire: json['backRequire'] as bool? ?? false,
        frontRequire: json['frontRequire'] as bool? ?? false,
        createdTs: json['createdTs'] as int? ?? 0,
        createdDate: json['createdDate'] as String? ?? '',
      );

  String? id;
  String? name;
  bool? backRequire;
  bool? frontRequire;
  int? createdTs;
  String? createdDate;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'name': name,
        'backRequire': backRequire,
        'frontRequire': frontRequire,
        'createdTs': createdTs,
        'createdDate': createdDate,
      };
}
