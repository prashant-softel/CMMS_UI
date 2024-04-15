import 'dart:convert';

CreateGoModel createGoModelFromJson(String str) =>
    CreateGoModel.fromJson(json.decode(str));

class CreateGoModel {
  int? id;
  int? facility_id;
  int? order_type;
  int? location_ID;
  int? vendorID;
  String? purchaseDate;
  String? challan_no;
  String? challan_date;
  String? po_no;
  String? po_date;
  String? freight;
  String? receivedAt;
  String? no_pkg_received;
  String? lr_no;
  String? freight_value;
  String? inspection_report;

  String? condition_pkg_received;
  String? vehicle_no;
  String? gir_no;
  String? closedBy;
  String? job_ref;
  int? amount;
  int? currencyID;
  int? is_submit;

  List<Items?>? items;
  CreateGoModel(
      {this.facility_id,
      this.order_type,
      this.location_ID,
      this.vendorID,
      this.purchaseDate,
      this.challan_no,
      this.challan_date,
      this.po_no,
      this.po_date,
      this.freight,
      this.receivedAt,
      this.no_pkg_received,
      this.lr_no,
      this.freight_value,
      this.inspection_report,
      this.condition_pkg_received,
      this.vehicle_no,
      this.gir_no,
      this.closedBy,
      this.job_ref,
      this.amount,
      this.currencyID,
      this.items,
      this.id,
      this.is_submit});

  factory CreateGoModel.fromJson(Map<String, dynamic> json) {
    return CreateGoModel(
      facility_id: json['facility_id'],
      order_type: json['order_type'],
      location_ID: json['location_ID'],
      vendorID: json['vendorID'],
      purchaseDate: json['purchaseDate'],
      challan_no: json['challan_no'],
      challan_date: json['challan_date'],
      po_no: json['po_no'],
      po_date: json['po_date'],
      freight: json['freight'],
      receivedAt: json['receivedAt'],
      no_pkg_received: json['no_pkg_received'],
      lr_no: json['lr_no'],
      freight_value: json['freight_value'],
      inspection_report: json['inspection_report'],
      condition_pkg_received: json['condition_pkg_received'],
      vehicle_no: json['vehicle_no'],
      gir_no: json['gir_no'],
      closedBy: json['closedBy'],
      job_ref: json['job_ref'],
      amount: json['amount'],
      currencyID: json['currencyID'],
      id: json['id'],
      is_submit: json['is_submit'] == null ? 0 : json['is_submit'],
      items: json["go_items"] != null
          ? List<Items>.from(json["go_items"]?.map((x) => Items.fromJson(x)))
          : [],
    );
  }
  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "order_type": order_type,
        "location_ID": location_ID,
        "vendorID": vendorID,
        "purchaseDate": purchaseDate,
        "challan_no": challan_no,
        "challan_date": challan_date,
        "po_no": po_no,
        "po_date": po_date,
        "freight": freight,
        "receivedAt": receivedAt,
        "no_pkg_received": no_pkg_received,
        "lr_no": lr_no,
        "freight_value": freight_value,
        "inspection_report": inspection_report,
        "condition_pkg_received": condition_pkg_received,
        "vehicle_no": vehicle_no,
        "gir_no": gir_no,
        "closedBy": closedBy,
        "job_ref": job_ref,
        "amount": amount,
        "currencyID": currencyID,
        "id": id,
        "is_submit": is_submit == null ? 0 : is_submit,
        "go_items": List<dynamic>.from(items!.map((x) => x)),
      };
}

class Items {
  Items({
    this.goItemID,
    this.assetMasterItemID,
    this.cost,
    this.ordered_qty,
    this.paid_by_ID,
    this.requested_qty,
    this.accepted_qty,
    this.received_qty,
    this.lost_qty,
    this.damaged_qty,
    this.id,
    this.assetItem_Name,
    // this.locationID,
    this.spare_status,
    this.remarks,
    this.receive_later,
    this.asset_type_ID,
    this.paid_by_name,
    this.cat_name,
    this.asset_type,
    this.asset_code,
    this.sr_no,
  });
  int? id;
  int? assetMasterItemID;
  String? assetItem_Name;
  // int? locationID;
  double? cost;
  double? ordered_qty;
  double? received_qty;
  double? lost_qty;
  double? requested_qty;
  double? damaged_qty;
  double? accepted_qty;
  int? spare_status;
  String? remarks;
  int? receive_later;
  int? asset_type_ID;
  String? paid_by_name;
  int? paid_by_ID;
  String? cat_name;
  String? asset_type;
  String? asset_code;
  int? goItemID;
  String? sr_no;
  factory Items.fromJson(Map<String, dynamic> json) => Items(
        assetMasterItemID: json["assetMasterItemID"],
        goItemID: json["goItemID"],
        cost: json["cost"],
        requested_qty: json["requested_qty"],
        accepted_qty: json["accepted_qty"],
        received_qty: json["received_qty"],
        lost_qty: json["lost_qty"],
        damaged_qty: json["damaged_qty"],
        ordered_qty: json["ordered_qty"],
        paid_by_ID: json["paid_by_ID"],
        id: json['id'],
        assetItem_Name: json['assetItem_Name'],
        // locationID: json['location_ID'],
        spare_status: json['spare_status'],
        remarks: json['remarks'],
        receive_later: json['receive_later'],
        asset_type_ID: json['asset_type_ID'],
        paid_by_name: json['paid_by_name'],
        cat_name: json['cat_name'],
        asset_type: json['asset_type'],
        asset_code: json['asset_code'],
        sr_no: json['sr_no'],
      );

  Map<String, dynamic> toJson() => {
        "assetMasterItemID": assetMasterItemID,
        "goItemID": goItemID,
        "cost": cost,
        "ordered_qty": ordered_qty,
        "paid_by_ID": paid_by_ID,
        "requested_qty": requested_qty,
        "accepted_qty": accepted_qty,
        "received_qty": received_qty,
        "lost_qty": lost_qty,
        "damaged_qty": damaged_qty,
        "id": id == null ? 0 : id,
        "assetItem_Name": assetItem_Name == null ? "" : assetItem_Name,
        // // // "locationID": locationID == null ? 0 : locationID,
        "spare_status": spare_status == null ? 0 : spare_status,
        "remarks": remarks == null ? "" : remarks,
        "receive_later": receive_later == null ? 0 : receive_later,
        "asset_type_ID": asset_type_ID == null ? 0 : asset_type_ID,
        "paid_by_name": paid_by_name == null ? "" : paid_by_name,
        "cat_name": cat_name == null ? "" : cat_name,
        "asset_type": asset_type == null ? "" : asset_type,
        "asset_code": asset_code == null ? "" : asset_code,
        "sr_no": sr_no == null ? "" : sr_no,
      };
}
