class DashboardModel {
  String? module_name;
  int? category_mc_count;
  int? category_pm_count;
  int? category_bm_count;
  int? category_total_count;
  CmDashboadDetails? cmDashboadDetails;
  DashboardModel(
      {this.module_name,
      this.cmDashboadDetails,
      this.category_bm_count,
      this.category_mc_count,
      this.category_pm_count,
      this.category_total_count});

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        module_name: json["module_name"],
        category_bm_count: json["category_bm_count"],
        category_mc_count: json["category_mc_count"],
        category_pm_count: json["category_pm_count"],
        category_total_count: json["category_total_count"],
        cmDashboadDetails:
            CmDashboadDetails.fromJson(json['cmDashboadDetails']),
      );

  Map<String, dynamic> toJson() => {
        "category_total_count": category_total_count,
        "category_bm_count": category_bm_count,
        "category_mc_count": category_mc_count,
        "category_pm_count": category_pm_count,
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
      this.low_stock_items,
      this.po_items_awaited,
      this.schedule_compliance_completed,
      this.schedule_compliance_pending,
      this.schedule_compliance_total,
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
  int? low_stock_items;
  int? po_items_awaited;
  int? schedule_compliance_total;
  int? schedule_compliance_completed;
  int? schedule_compliance_pending;
  List<Itemlist>? item_list;

  factory CmDashboadDetails.fromJson(Map<String, dynamic> parsedJson) =>
      CmDashboadDetails(
        created: parsedJson['created'],
        schedule_compliance_total: parsedJson['schedule_compliance_total'],
        schedule_compliance_completed:
            parsedJson['schedule_compliance_completed'],
        schedule_compliance_pending: parsedJson['schedule_compliance_pending'],
        low_stock_items: parsedJson['low_stock_items'],
        po_items_awaited: parsedJson['po_items_awaited'],
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
        "schedule_compliance_total": schedule_compliance_total,
        "schedule_compliance_completed": schedule_compliance_completed,
        "schedule_compliance_pending": schedule_compliance_pending,
        "low_stock_items": low_stock_items,
        "po_items_awaited": po_items_awaited,
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
      this.wo_decription,
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
  String? wo_decription;
  int? latestJCStatus;
  int? latestJCid;
  int? latestJCPTWStatus;
  int? latestJCApproval;

  factory Itemlist.fromJson(Map<String, dynamic> parsedJson) => Itemlist(
        facility_id: parsedJson['facility_id'],
        wo_decription: parsedJson['wo_decription'],
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
        "wo_decription": wo_decription,
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
