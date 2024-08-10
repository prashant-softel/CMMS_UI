import 'dart:convert';

UploadDocumentModel createDocumentUploadFromJson(String str) =>
    UploadDocumentModel.fromJson(json.decode(str));

class UploadDocumentModel {
  int? is_renew;
  int? facility_id;
  int? docMasterId;
  int? fileId;
  String? subDocName;
  String? renewDate;
  String? remarks;

  UploadDocumentModel({
    this.facility_id,
    this.docMasterId,
    this.fileId,
    this.subDocName,
    this.renewDate,
    this.remarks,
    this.is_renew,
  });

  factory UploadDocumentModel.fromJson(Map<String, dynamic> json) {
    return UploadDocumentModel(
      is_renew: json['is_renew'],
      facility_id: json['facility_id'],
      docMasterId: json['doc_master_id'],
      fileId: json['file_id'],
      subDocName: json['sub_doc_name'],
      renewDate: json['renew_date'],
      remarks: json['Remarks'],
    );
  }

  Map<String, dynamic> toJson() => {
        'is_renew': is_renew,
        'facility_id': facility_id,
        'doc_master_id': docMasterId,
        'file_id': fileId,
        'sub_doc_name': subDocName,
        'renew_date': renewDate,
        'Remarks': remarks,
      };
}
