import 'dart:convert';



UpdateSOPModel addCreateSOPModelFromJson(String str) =>
    UpdateSOPModel.fromJson(json.decode(str));

String addCreateSOPModelToJson(UpdateSOPModel data) => json.encode(data.toJson());


class UpdateSOPModel {
  String? title;
  String? description;
  int? tbt_jobType;
  int? id;
  int? sop_fileId;
  String? sop_file_desc;
  String? tbt_remarks;
  int? jsa_fileId;

 
   UpdateSOPModel(
       {
         this.id,

         this.title,
      this.description,
         this.tbt_jobType,
         this.tbt_remarks,
      this.sop_fileId,
      this.sop_file_desc,
      this.jsa_fileId,

       });

  factory UpdateSOPModel.fromJson(Map<String, dynamic> json) =>
      UpdateSOPModel(
        title: json["title"],
        id: json["id"],
        description: json["description"],
        tbt_jobType: json['tbt_jobType'],
        tbt_remarks: json['tbt_remarks'],
        sop_fileId: json['sop_fileId'],
        sop_file_desc:json['sop_file_desc'],
        jsa_fileId: json['jsa_fileId'],


      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
        "description": description,
    "tbt_jobType": tbt_jobType,
    "tbt_remarks": tbt_remarks,
        "sop_fileId": sop_fileId,
        "sop_file_desc": sop_file_desc,
        "jsa_fileId": jsa_fileId,


      };
}

