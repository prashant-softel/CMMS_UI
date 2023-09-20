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
  String? received_on;
  String? no_pkg_received;
  String? lr_no;
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
      this.received_on,
      this.no_pkg_received,
      this.lr_no,
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
      received_on: json['received_on'],
      no_pkg_received: json['no_pkg_received'],
      lr_no: json['lr_no'],
      condition_pkg_received: json['condition_pkg_received'],
      vehicle_no: json['vehicle_no'],
      gir_no: json['gir_no'],
      closedBy: json['closedBy'],
      job_ref: json['job_ref'],
      amount: json['amount'],
      currencyID: json['currencyID'],
      id: json['id'],
      is_submit: json['is_submit'],
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
        "received_on": received_on,
        "no_pkg_received": no_pkg_received,
        "lr_no": lr_no,
        "condition_pkg_received": condition_pkg_received,
        "vehicle_no": vehicle_no,
        "gir_no": gir_no,
        "closedBy": closedBy,
        "job_ref": job_ref,
        "amount": amount,
        "currencyID": currencyID,
        "id": id,
        "is_submit": is_submit,
        "go_items": List<dynamic>.from(items!.map((x) => x)),
      };
}

class Items {
  Items({
    this.goItemID,
    this.assetItemID,
    this.cost,
    this.ordered_qty,
    this.paid_by_ID,
    this.requested_qty,
    this.accepted_qty,
    this.received_qty,
    this.lost_qty,
    this.damaged_qty,
  });
  int? goItemID;
  int? assetItemID;
  int? cost;
  int? ordered_qty;
  int? paid_by_ID;
  int? requested_qty;
  int? accepted_qty;
  int? received_qty;
  int? lost_qty;
  int? damaged_qty;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        assetItemID: json["assetItemID"],
        goItemID: json["goItemID"],
        cost: json["cost"],
        requested_qty: json["requested_qty"],
        accepted_qty: json["accepted_qty"],
        received_qty: json["received_qty"],
        lost_qty: json["lost_qty"],
        damaged_qty: json["damaged_qty"],
        ordered_qty: json["ordered_qty"],
        paid_by_ID: json["paid_by_ID"],
      );

  Map<String, dynamic> toJson() => {
        "assetItemID": assetItemID,
        "goItemID": goItemID,
        "cost": cost,
        "ordered_qty": ordered_qty,
        "paid_by_ID": paid_by_ID,
        "requested_qty": requested_qty,
        "accepted_qty": accepted_qty,
        "received_qty": received_qty,
        "lost_qty": lost_qty,
        "damaged_qty": damaged_qty,
      };
}
