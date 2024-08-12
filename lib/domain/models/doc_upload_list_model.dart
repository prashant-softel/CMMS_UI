import 'package:intl/intl.dart';

class GetDocUploadListModel {
  int? facility_id;
  String? facility_name;
  int? id;
  int? docMasterId;
  int? fileId;
  String? subDocName;
  List<DateTime>? renewDates;
  String? created_by;
  DateTime? created_at;
  String? remarks;
  int? status;
  String? doc_master_name;
  String? file_path;
  String? Activation_status;

  GetDocUploadListModel({
    this.facility_id,
    this.facility_name,
    this.id,
    this.docMasterId,
    this.fileId,
    this.subDocName,
    this.renewDates,
    this.created_by,
    this.created_at,
    this.remarks,
    this.status,
    this.Activation_status,
    this.doc_master_name,
    this.file_path,
  });

  // Factory method to create a GetDocUploadListModel instance from JSON
  factory GetDocUploadListModel.fromJson(Map<String, dynamic> json) {
    return GetDocUploadListModel(
      facility_id: json['facility_id'],
      facility_name: json['facility_name'],
      id: json['id'],
      docMasterId: json['doc_master_id'],
      fileId: json['file_id'],
      subDocName: json['sub_doc_name'],
      renewDates: json['renew_date'] != null
          ? [DateTime.parse(json['renew_date'])]
          : [],
      created_by: json['created_by'],
      status: json['status'],
      created_at: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      remarks: json['remarks'],
      Activation_status: json['Activation_status'],
      doc_master_name: json['doc_master_name'],
      file_path: json['file_path'],
    );
  }

  // Method to convert an instance of GetDocUploadListModel to JSON
  Map<String, dynamic> toJson() {
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['facility_id'] = this.facility_id;
    data['facility_name'] = this.facility_name;
    data['id'] = this.id;
    data['doc_master_id'] = this.docMasterId;
    data['file_id'] = this.fileId;
    data['sub_doc_name'] = this.subDocName;

    // Ensure renew_dates are not empty and remove duplicates
    if (renewDates != null && renewDates!.isNotEmpty) {
      renewDates = renewDates!.toSet().toList(); // Remove duplicates
      data['renew_date'] =
          renewDates!.map((date) => dateFormatter.format(date)).toList();
    } else {
      data['renew_date'] = null; // Set to null if empty
    }

    data['created_by'] = this.created_by;
    data['created_at'] =
        this.created_at != null ? dateFormatter.format(this.created_at!) : null;
    data['remarks'] = this.remarks;
    data['Activation_status'] = this.Activation_status;
    data['doc_master_name'] = this.doc_master_name;
    data['file_path'] = this.file_path;

    return data;
  }

  // Method to add a renew_date to the list
  void addRenewDate(DateTime date) {
    renewDates ??= [];
    if (!renewDates!.contains(date)) {
      renewDates!.add(date);
    }
  }
}
