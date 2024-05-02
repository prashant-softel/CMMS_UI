class DashboardModel {
  String? module_name;

  CmDashboadDetails? cmDashboadDetails;
  DashboardModel({this.module_name, this.cmDashboadDetails});

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        module_name: json["module_name"],
        cmDashboadDetails:
            CmDashboadDetails.fromJson(json['cmDashboadDetails']),
      );

  Map<String, dynamic> toJson() => {
        "module_name": module_name,
        "cmDashboadDetails": cmDashboadDetails!.toJson(),
      };
}

class CmDashboadDetails {
  CmDashboadDetails(
      {this.approved,
      this.assigned,
      this.completed,
      this.created,
      this.issued,
      this.pending,
      this.rejected,
      this.submitted,
      this.total,
      this.wo_backlog,
      this.wo_delay,
      this.wo_on_time,
      this.item_list});
  int? created;
  int? submitted;
  int? assigned;
  int? rejected;
  int? approved;
  int? issued;
  int? total;
  int? completed;
  int? pending;
  int? wo_on_time;
  int? wo_delay;
  int? wo_backlog;
  List<Itemlist>? item_list;

  factory CmDashboadDetails.fromJson(Map<String, dynamic> parsedJson) =>
      CmDashboadDetails(
        created: parsedJson['created'],
        wo_on_time: parsedJson['wo_on_time'],
        wo_delay: parsedJson['wo_delay'],
        wo_backlog: parsedJson['wo_backlog'],
        submitted: parsedJson['submitted'],
        assigned: parsedJson['assigned'],
        rejected: parsedJson['rejected'],
        approved: parsedJson['approved'],
        issued: parsedJson['issued'],
        total: parsedJson['total'],
        completed: parsedJson['completed'],
        pending: parsedJson['pending'],
        item_list: List<Itemlist>.from(
            parsedJson["item_list"].map((x) => Itemlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "created": created,
        "wo_on_time": wo_on_time,
        "wo_delay": wo_delay,
        "wo_backlog": wo_backlog,
        "total": total,
        "approved": approved,
        "assigned": assigned,
        "rejected": rejected,
        "submitted": submitted,
        "issued": issued,
        "pending": pending,
        "completed": completed,
        "item_list": List<dynamic>.from(item_list!.map((x) => x.toJson())),
      };
}

class Itemlist {
  Itemlist(
      {this.asset_category,
      this.asset_name,
      this.end_date,
      this.facility_id,
      this.facility_name,
      this.latestJCApproval,
      this.latestJCPTWStatus,
      this.latestJCStatus,
      this.latestJCid,
      this.ptw_id,
      this.start_date,
      this.status,
      this.status_long,
      this.wo_number});
  int? facility_id;
  String? facility_name;
  int? wo_number;
  int? status;
  String? status_long;
  String? asset_category;
  String? asset_name;
  String? start_date;
  String? end_date;
  int? ptw_id;
  int? latestJCStatus;
  int? latestJCid;
  int? latestJCPTWStatus;
  int? latestJCApproval;

  factory Itemlist.fromJson(Map<String, dynamic> parsedJson) => Itemlist(
        facility_id: parsedJson['facility_id'],
        facility_name: parsedJson['facility_name'],
        wo_number: parsedJson['wo_number'],
        status: parsedJson['status'],
        status_long: parsedJson['status_long'],
        asset_category: parsedJson['asset_category'],
        asset_name: parsedJson['asset_name'],
        start_date: parsedJson['start_date'],
        end_date: parsedJson['end_date'],
        ptw_id: parsedJson['ptw_id'],
        latestJCStatus: parsedJson['latestJCStatus'],
        latestJCid: parsedJson['latestJCid'],
        latestJCPTWStatus: parsedJson['latestJCPTWStatus'],
        latestJCApproval: parsedJson['latestJCApproval'],
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "facility_name": facility_name,
        "wo_number": wo_number,
        "status": status,
        "status_long": status_long,
        "asset_category": asset_category,
        "asset_name": asset_name,
        "start_date": start_date,
        "end_date": end_date,
        "ptw_id": ptw_id,
        "latestJCStatus": latestJCStatus,
        "latestJCid": latestJCid,
        "latestJCPTWStatus": latestJCPTWStatus,
        "latestJCApproval": latestJCApproval,
      };
}
