import 'dart:convert';



CreateSOPModel addCreateSOPModelFromJson(String str) =>
    CreateSOPModel.fromJson(json.decode(str));

String addCreateSOPModelToJson(CreateSOPModel data) => json.encode(data.toJson());


class CreateSOPModel {
  String? title;
  String? description;
  int? tbt_jobType;
  int? sop_fileId;
  String? sop_file_desc;
  int? jsa_fileId;

 
   CreateSOPModel(
       {
      this.title,
      this.description,
      this.tbt_jobType,
      this.sop_fileId,
      this.sop_file_desc,
      this.jsa_fileId,

       });

  factory CreateSOPModel.fromJson(Map<String, dynamic> json) =>
      CreateSOPModel(
        title: json["title"],
        description: json["description"],
        tbt_jobType: json['tbt_jobType'],
        sop_fileId: json['sop_fileId'],
        sop_file_desc:json['sop_file_desc'],
        jsa_fileId: json['jsa_fileId'],


      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "tbt_jobType": tbt_jobType,
        "sop_fileId": sop_fileId,
        "sop_file_desc": sop_file_desc,
        "jsa_fileId": jsa_fileId,


      };
}

