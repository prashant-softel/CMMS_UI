import 'dart:convert';

// Function to parse JSON string and return a list of GetDocUploadListModel objects
List<GetDocUploadListModel> getDocUploadListModelFromJson(String str) =>
    List<GetDocUploadListModel>.from(
        json.decode(str).map((x) => GetDocUploadListModel.fromJson(x)));

// Function to convert a list of GetDocUploadListModel objects to a JSON string
String docUploadListModelToJson(List<GetDocUploadListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDocUploadListModel {
  int? facilityID;
  String? facilityName;
  int? id;
  int? docMasterId;
  int? fileId;
  String? subDocName;
  DateTime? renewDate;
  String? addedBy;
  DateTime? addedAt;
  String? remarks;
  int? status;

  GetDocUploadListModel({
    this.facilityID,
    this.facilityName,
    this.id,
    this.docMasterId,
    this.fileId,
    this.subDocName,
    this.renewDate,
    this.addedBy,
    this.addedAt,
    this.remarks,
    this.status,
  });

  // Factory method to create a GetDocUploadListModel instance from JSON
  factory GetDocUploadListModel.fromJson(Map<String, dynamic> json) {
    return GetDocUploadListModel(
      facilityID: json['facilityID'],
      facilityName: json['facilityName'],
      id: json['id'],
      docMasterId: json['doc_master_id'],
      fileId: json['file_id'],
      subDocName: json['sub_doc_name'],
      renewDate: json['renew_date'] != null
          ? DateTime.parse(json['renew_date'])
          : null,
      addedBy: json['added_by'],
      status: json['status'],
      addedAt:
          json['added_at'] != null ? DateTime.parse(json['added_at']) : null,
      remarks: json['remarks'],
    );
  }

  // Method to convert an instance of GetDocUploadListModel to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['facilityID'] = this.facilityID;
    data['facilityName'] = this.facilityName;
    data['id'] = this.id;
    data['doc_master_id'] = this.docMasterId;
    data['file_id'] = this.fileId;
    data['sub_doc_name'] = this.subDocName;
    data['renew_date'] = this.renewDate?.toIso8601String();
    data['added_by'] = this.addedBy;
    data['added_at'] = this.addedAt?.toIso8601String();
    data['remarks'] = this.remarks;

    return data;
  }
}
