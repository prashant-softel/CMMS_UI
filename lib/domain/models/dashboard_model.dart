import 'package:cmms/app/utils/utility.dart';

class DashboardModel {
  String? module_name;
  int? category_mc_count;
  int? category_pm_count;
  int? category_bm_count;
  int? category_total_count;
  CmDashboadDetails? cmDashboadDetails;

  DashboardModel({
    this.module_name,
    this.cmDashboadDetails,
    this.category_bm_count,
    this.category_mc_count,
    this.category_pm_count,
    this.category_total_count,
  });

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

  void addPrefixToItems() {
    String prefix = '';
    if (module_name == 'Preventive Maintenance') {
      prefix = 'PMT';
    } else if (module_name == 'Breakdown Maintenance') {
      prefix = 'BM';
    } else if (module_name == 'Module Cleaning') {
      prefix = 'MC';
    } else if (module_name == 'Incident Report') {
      prefix = 'IR';
    } else if (module_name == 'Stock Management') {
      prefix = 'SM';
    }

    cmDashboadDetails?.addPrefixToItems(prefix);
  }
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
      this.item_list,
      this.stockConsumptionBySites,
      this.stockConsumptionByGoods,
      this.stockAvailbleBySites,
      this.stockAvailbleByGoods,
      this.stockOverview,
      this.waterUsedTotal});

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
  List<AllChartview>? stockOverview;
  List<AllChartview>? stockConsumptionByGoods;
  List<AllChartview>? stockConsumptionBySites;
  List<AllChartview>? stockAvailbleByGoods;
  List<AllChartview>? stockAvailbleBySites;
  List<WaterUsedTotal>? waterUsedTotal;

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
        item_list: parsedJson['item_list'] != null
            ? List<Itemlist>.from(
                parsedJson['item_list'].map((x) => Itemlist.fromJson(x)))
            : null,
        waterUsedTotal: parsedJson['waterUsedTotal'] != null
            ? List<WaterUsedTotal>.from(parsedJson['waterUsedTotal']
                .map((x) => WaterUsedTotal.fromJson(x)))
            : null,
        stockOverview: parsedJson['stockOverview'] != null
            ? List<AllChartview>.from(parsedJson['stockOverview']
                .map((x) => AllChartview.fromJson(x)))
            : null,
        stockConsumptionByGoods: parsedJson['stockConsumptionByGoods'] != null
            ? List<AllChartview>.from(parsedJson['stockConsumptionByGoods']
                .map((x) => AllChartview.fromJson(x)))
            : null,
        stockConsumptionBySites: parsedJson['stockConsumptionBySites'] != null
            ? List<AllChartview>.from(parsedJson['stockConsumptionBySites']
                .map((x) => AllChartview.fromJson(x)))
            : null,
        stockAvailbleByGoods: parsedJson['stockAvailbleByGoods'] != null
            ? List<AllChartview>.from(parsedJson['stockAvailbleByGoods']
                .map((x) => AllChartview.fromJson(x)))
            : null,
        stockAvailbleBySites: parsedJson['stockAvailbleBySites'] != null
            ? List<AllChartview>.from(parsedJson['stockAvailbleBySites']
                .map((x) => AllChartview.fromJson(x)))
            : null,
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
        'item_list': item_list != null
            ? List<dynamic>.from(item_list!.map((x) => x.toJson()))
            : null,
        'waterUsedTotal': waterUsedTotal != null
            ? List<dynamic>.from(waterUsedTotal!.map((x) => x.toJson()))
            : null,
        'stockOverview': stockOverview != null
            ? List<dynamic>.from(stockOverview!.map((x) => x.toJson()))
            : null,
        'stockConsumptionByGoods': stockConsumptionByGoods != null
            ? List<dynamic>.from(
                stockConsumptionByGoods!.map((x) => x.toJson()))
            : null,
        'stockAvailbleByGoods': stockAvailbleByGoods != null
            ? List<dynamic>.from(stockAvailbleByGoods!.map((x) => x.toJson()))
            : null,
        'stockAvailbleBySites': stockAvailbleBySites != null
            ? List<dynamic>.from(stockAvailbleBySites!.map((x) => x.toJson()))
            : null,
      };

  void addPrefixToItems(String prefix) {
    if (item_list != null) {
      for (var item in item_list!) {
        item.addPrefix(prefix);
      }
    }
  }
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
      this.wo_number,
      this.go_id,
      this.grNo,
      this.goNo,
      this.product_name,
      this.requested_qty,
      this.gr_date,
      this.ordered_qty,
      this.go_date,
      this.unit_amount,
      this.total_amount,
      this.grn_date,
      this.grn_qty,
      this.incident_datetime,
      this.location_of_incident,
      this.restoration_datetime,
      this.severity,
      this.title,
      this.type_of_incident,
      this.totalWaterUsed,
      this.end_Date_done,
      this.mC_Type,
      this.no_of_cleaned,
      this.plan_id,
      this.scheduled});

  int? facility_id;
  String? facility_name;
  String? wo_number;
  int? status;
  int? plan_id;
  String? status_long;
  String? asset_category;
  String? asset_name;
  String? start_date;
  String? end_date;
  int? ptw_id;
  dynamic mC_Type;
  dynamic no_of_cleaned;
  String? end_Date_done;
  dynamic totalWaterUsed;
  String? wo_decription;
  int? latestJCStatus;
  int? latestJCid;
  int? latestJCPTWStatus;
  int? latestJCApproval;
  dynamic go_id;
  dynamic grNo;
  dynamic goNo;
  dynamic product_name;
  dynamic requested_qty;
  dynamic gr_date;
  dynamic ordered_qty;
  dynamic go_date;
  dynamic unit_amount;
  dynamic total_amount;
  dynamic grn_date;
  dynamic grn_qty;
  dynamic scheduled;
  String? title;
  String? type_of_incident;
  String? location_of_incident;
  String? severity;
  String? incident_datetime;
  String? restoration_datetime;

  factory Itemlist.fromJson(Map<String, dynamic> parsedJson) => Itemlist(
        facility_id: parsedJson['facility_id'],
        title: parsedJson['title'],
        location_of_incident: parsedJson['location_of_incident'],
        type_of_incident: parsedJson['type_of_incident'],
        severity: parsedJson['severity'],
        incident_datetime: parsedJson['incident_datetime'] == null
            ? parsedJson['incident_datetime']
            : Utility.getFormatedyearMonthDay(parsedJson['incident_datetime']),
        restoration_datetime: parsedJson['restoration_datetime'] == null
            ? parsedJson['restoration_datetime']
            : Utility.getFormatedyearMonthDay(
                parsedJson['restoration_datetime']),
        wo_decription: parsedJson['wo_decription'],
        facility_name: parsedJson['facility_name'],
        wo_number: parsedJson['wo_number'].toString(),
        status: parsedJson['status'],
        plan_id: parsedJson['plan_id'],
        status_long: parsedJson['status_long'],
        asset_category: parsedJson['asset_category'],
        asset_name: parsedJson['assetsname'],
        start_date: parsedJson['start_date'],
        end_date: parsedJson['end_date'],
        ptw_id: parsedJson['ptw_id'],
        latestJCStatus: parsedJson['latestJCStatus'],
        latestJCid: parsedJson['latestJCid'],
        latestJCPTWStatus: parsedJson['latestJCPTWStatus'],
        latestJCApproval: parsedJson['latestJCApproval'],
        go_id: parsedJson["go_id"],
        grNo: parsedJson["grNo"],
        goNo: parsedJson["goNo"],
        product_name: parsedJson["product_name"],
        requested_qty: parsedJson["requested_qty"],
        scheduled:
            parsedJson['scheduled'] == null ? 0 : parsedJson['scheduled'],
        gr_date: parsedJson['gr_date'] == null
            ? parsedJson['gr_date']
            : Utility.getFormatedyearMonthDay(parsedJson['gr_date']),
        ordered_qty: parsedJson["ordered_qty"],
        go_date: parsedJson['go_date'] == null
            ? parsedJson['go_date']
            : Utility.getFormatedyearMonthDay(parsedJson['go_date']),
        unit_amount: parsedJson["unit_amount"],
        total_amount: parsedJson["total_amount"],
        grn_date: parsedJson['grn_date'], // == null
        // ? parsedJson['grn_date']
        // : Utility.getFormatedyearMonthDay(parsedJson['grn_date']),
        grn_qty: parsedJson["grn_qty"],
        totalWaterUsed: parsedJson['totalWaterUsed'] == null
            ? ""
            : parsedJson['totalWaterUsed'],
        end_Date_done: parsedJson['end_Date_done'], //== null
        // ? parsedJson['end_Date_done']
        // : Utility.getFormatedyearMonthDay(parsedJson['end_Date_done']),
        mC_Type: parsedJson['mC_Type'] == null ? "" : parsedJson['mC_Type'],
        no_of_cleaned: parsedJson['no_of_cleaned'] == null
            ? 0
            : parsedJson['no_of_cleaned'],
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "scheduled": scheduled,
        "plan_id": plan_id,
        "no_of_cleaned": no_of_cleaned,
        "mC_Type": mC_Type,
        "end_Date_done": end_Date_done,
        "totalWaterUsed": totalWaterUsed,
        "title": title,
        "location_of_incident": location_of_incident,
        "type_of_incident": type_of_incident,
        "severity": severity,
        "incident_datetime": incident_datetime,
        "restoration_datetime": restoration_datetime,
        "wo_decription": wo_decription,
        "facility_name": facility_name,
        "wo_number": wo_number,
        "status": status,
        "status_long": status_long,
        "asset_category": asset_category,
        "assetsname": asset_name,
        "start_date": start_date,
        "end_date": end_date,
        "ptw_id": ptw_id,
        "latestJCStatus": latestJCStatus,
        "latestJCid": latestJCid,
        "latestJCPTWStatus": latestJCPTWStatus,
        "latestJCApproval": latestJCApproval,
        "go_id": go_id,
        "grNo": grNo,
        "goNo": goNo,
        "product_name": product_name,
        "requested_qty": requested_qty,
        "gr_date": gr_date,
        "ordered_qty": ordered_qty,
        "go_date": go_date,
        "unit_amount": unit_amount,
        "total_amount": total_amount,
        "grn_date": grn_date,
        "grn_qty": grn_qty,
      };

  void addPrefix(String prefix) {
    wo_number = '$prefix$wo_number';
  }
}

class AllChartview {
  AllChartview({
    this.key,
    this.value,
  });

  dynamic value;
  String? key;

  factory AllChartview.fromJson(Map<String, dynamic> parsedJson) =>
      AllChartview(
        key: parsedJson['key'] == null ? "" : parsedJson['key'],
        value: parsedJson['value'],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class WaterUsedTotal {
  WaterUsedTotal(
      {this.site_name,
      this.totalWaterUsed,
      this.plan_days,
      this.no_of_cleaned});
  String? site_name;
  int? totalWaterUsed;
  int? plan_days;
  int? no_of_cleaned;

  factory WaterUsedTotal.fromJson(Map<String, dynamic> parsedJson) =>
      WaterUsedTotal(
        site_name: parsedJson['site_name'],
        totalWaterUsed: parsedJson['totalWaterUsed'],
        plan_days: parsedJson['plan_days'],
        no_of_cleaned: parsedJson['no_of_cleaned'],
      );

  Map<String, dynamic> toJson() => {
        "site_name": site_name,
        "totalWaterUsed": totalWaterUsed,
        "plan_days": plan_days,
        "no_of_cleaned": no_of_cleaned,
      };
}
