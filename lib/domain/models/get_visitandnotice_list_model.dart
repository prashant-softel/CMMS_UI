import 'dart:convert';

List<GetVisitAndNoticeList> GetVisitAndNoticeListModelFromJson(String str) =>
    List<GetVisitAndNoticeList>.from(
        json.decode(str).map(GetVisitAndNoticeList.fromJson));

String GetVisitAndNoticeListModelToJson(List<GetVisitAndNoticeList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetVisitAndNoticeList {
  int? id;
  String? date;
  String? month_name;
  int? month_id;
  int? govtAuthVisits;
  int? noOfFineByThirdParty;
  int? noOfShowCauseNoticesByThirdParty;
  int? noticesToContractor;
  int? amountOfPenaltiesToContractors;
  int? anyOther;
  int? status;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;

  GetVisitAndNoticeList({
    this.id,
    this.date,
    this.month_name,
    this.month_id,
    this.govtAuthVisits,
    this.noOfFineByThirdParty,
    this.noOfShowCauseNoticesByThirdParty,
    this.noticesToContractor,
    this.amountOfPenaltiesToContractors,
    this.anyOther,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  factory GetVisitAndNoticeList.fromJson(Map<String, dynamic> json) {
    return GetVisitAndNoticeList(
      id: json['id'],
      date: json['date'],
      month_name: json['month_name'],
      month_id: json['month_id'],
      govtAuthVisits: json['govtAuthVisits'],
      noOfFineByThirdParty: json['noOfFineByThirdParty'],
      noOfShowCauseNoticesByThirdParty:
          json['noOfShowCauseNoticesByThirdParty'],
      noticesToContractor: json['noticesToContractor'],
      amountOfPenaltiesToContractors: json['amountOfPenaltiesToContractors'],
      anyOther: json['anyOther'],
      status: json['status'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedBy: json['updatedBy'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'month_name': month_name,
        'month_id': month_id,
        'govtAuthVisits': govtAuthVisits,
        'noOfFineByThirdParty': noOfFineByThirdParty,
        'noOfShowCauseNoticesByThirdParty': noOfShowCauseNoticesByThirdParty,
        'noticesToContractor': noticesToContractor,
        'amountOfPenaltiesToContractors': amountOfPenaltiesToContractors,
        'anyOther': anyOther,
        'status': status,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'updatedBy': updatedBy,
        'updatedAt': updatedAt,
      };
}
