import 'dart:convert';

List<ViewDocUpload> viewDocUploadModelFromJson(String str) =>
    List<ViewDocUpload>.from(
        json.decode(str).map((x) => ViewDocUpload.fromJson(x)));

String viewDocUploadModelToJson(ViewDocUpload data) =>
    json.encode(data.toJson());

class ViewDocUpload {
  int? id;
  int? facilityId;
  int? docMasterId;
  int? fileId;
  String? facilityName;
  String? subDocName;
  DateTime? renewDate;
  String? addedBy;
  DateTime? addedAt;
  String? remarks;

  ViewDocUpload({
    this.id,
    this.facilityId,
    this.docMasterId,
    this.fileId,
    this.facilityName,
    this.subDocName,
    this.renewDate,
    this.addedBy,
    this.addedAt,
    this.remarks,
  });

  factory ViewDocUpload.fromJson(Map<String, dynamic> json) => ViewDocUpload(
        id: json['id'],
        facilityId: json['facility_id'],
        docMasterId: json['doc_master_id'],
        fileId: json['file_id'],
        facilityName: json['facility_name'],
        subDocName: json['sub_doc_name'],
        renewDate: json['renew_date'] != null
            ? DateTime.parse(json['renew_date'])
            : null,
        addedBy: json['added_by'],
        addedAt:
            json['added_at'] != null ? DateTime.parse(json['added_at']) : null,
        remarks: json['remarks'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'facility_id': facilityId,
        'doc_master_id': docMasterId,
        'file_id': fileId,
        'facility_name': facilityName,
        'sub_doc_name': subDocName,
        'renew_date': renewDate?.toIso8601String(),
        'added_by': addedBy,
        'added_at': addedAt?.toIso8601String(),
        'remarks': remarks,
      };
}
