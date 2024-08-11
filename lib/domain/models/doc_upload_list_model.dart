class GetDocUploadListModel {
  int? facilityID;
  String? facilityName;
  int? id;
  int? docMasterId;
  int? fileId;
  String? subDocName;
  List<DateTime>? renewDates; // Updated to hold a list of renew_date values
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
    this.renewDates,
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
      renewDates: json['renew_date'] != null
          ? [DateTime.parse(json['renew_date'])]
          : [],
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

    // Ensure renew_dates are not empty and remove duplicates
    if (renewDates != null && renewDates!.isNotEmpty) {
      renewDates = renewDates!.toSet().toList(); // Remove duplicates
      data['renew_date'] =
          renewDates!.map((date) => date.toIso8601String()).toList();
    } else {
      data['renew_date'] = null; // Set to null if empty
    }

    data['added_by'] = this.addedBy;
    data['added_at'] = this.addedAt?.toIso8601String();
    data['remarks'] = this.remarks;

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
