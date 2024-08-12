import 'package:intl/intl.dart';

class GetDocUploadListModel {
  int? facilityID;
  String? facilityName;
  int? id;
  int? docMasterId;
  int? fileId;
  String? subDocName;
  List<DateTime>? renewDates; // Updated to hold a list of renew_date values
  String? created_by;
  DateTime? created_at;
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
    this.created_by,
    this.created_at,
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
      created_by: json['created_by'],
      status: json['status'],
      created_at: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      remarks: json['remarks'],
    );
  }

  // Method to convert an instance of GetDocUploadListModel to JSON
  Map<String, dynamic> toJson() {
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
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
          renewDates!.map((date) => dateFormatter.format(date)).toList();
    } else {
      data['renew_date'] = null; // Set to null if empty
    }

    data['created_by'] = this.created_by;
    data['created_at'] =
        this.created_at != null ? dateFormatter.format(this.created_at!) : null;
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

// Example usage
void main() {
  GetDocUploadListModel docUploadListDetails = GetDocUploadListModel(
    docMasterId: 123,
    subDocName: "Document Name",
    renewDates: [DateTime(2024, 8, 11)],
    created_at: DateTime(2024, 8, 10),
    created_by: "John Doe",
  );

  var cellsBuffer = [
    "id",
    '${docUploadListDetails.docMasterId ?? ''}',
    '${docUploadListDetails.subDocName ?? ''}',
    docUploadListDetails.renewDates == null ||
            docUploadListDetails.renewDates!.isEmpty
        ? ""
        : DateFormat('yyyy-MM-dd').format(docUploadListDetails.renewDates![0]),
    docUploadListDetails.created_at != null
        ? DateFormat('yyyy-MM-dd').format(docUploadListDetails.created_at!)
        : '',
    '${docUploadListDetails.created_by ?? ''}',
    'Actions',
  ];

  print(cellsBuffer);
}
