import 'dart:convert';


List<GetStatutoryList> getStatutoryListModelFromJson(String str) =>
    List<GetStatutoryList>.from(
        json.decode(str).map(GetStatutoryList.fromJson));

String getStatutoryListModelToJson(List<GetStatutoryList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStatutoryList {
  int? id;
  int? complianceId;
  dynamic issueDate;
  dynamic expiresOn;
  int? status;
  dynamic statusShort;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedBy;
  dynamic updatedAt;
  dynamic renewFrom;
  dynamic renewFromId;
  dynamic approvedBy;
  dynamic approvedAt;

  GetStatutoryList(
      {this.id,
      this.complianceId,
      this.issueDate,
      this.expiresOn,
      this.status,
      this.statusShort,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.renewFrom,
      this.renewFromId,
      this.approvedBy,
      this.approvedAt});

  // Factory method to create a GetStatutoryList instance from JSON
  factory GetStatutoryList.fromJson(Map<String, dynamic> json) {
    return GetStatutoryList(
      id: json['id'],
      complianceId: json['compliance_id'],
      issueDate: json['issue_date'],
      expiresOn: json['expires_on'],
      status: json['status'],
      statusShort: json['status_short'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      updatedBy: json['updated_by'],
      updatedAt: json['updated_at'],
      renewFrom: json['renew_from'],
      renewFromId: json['renew_from_id'],
      approvedBy: json['approved_by'],
      approvedAt: json['approved_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'complianceId': complianceId,
        'issueDate': issueDate,
        'expiresOn': expiresOn,
        'status': status,
        'statusShort': statusShort,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'updatedBy': updatedBy,
        'updatedAt': updatedAt,
        'renewFrom': renewFrom,
        'renewFromId': renewFromId,
        'approvedBy': approvedBy,
        'approvedAt': approvedAt,
      };
}
