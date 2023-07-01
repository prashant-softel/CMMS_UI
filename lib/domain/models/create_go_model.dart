import 'dart:convert';

CreateGoModel createGoModelFromJson(String str) =>
    CreateGoModel.fromJson(json.decode(str));

class CreateGoModel {
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
  String? currency;
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
      this.currency,
      this.items});

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
      currency: json['currency'],
      items: json["items"] != null
          ? List<Items>.from(json["items"]?.map((x) => Items.fromJson(x)))
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
        "currency": currency,
        "items": List<dynamic>.from(items!.map((x) => x)),
      };
}

class Items {
  Items({
    this.assetItemID,
    this.cost,
    this.ordered_qty,
    this.asset_type_ID,
  });

  int? assetItemID;
  int? cost;
  int? ordered_qty;
  int? asset_type_ID;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        assetItemID: json["assetItemID"],
        cost: json["cost"],
        ordered_qty: json["ordered_qty"],
        asset_type_ID: json["asset_type_ID"],
      );

  Map<String, dynamic> toJson() => {
        "assetItemID": assetItemID,
        "cost": cost,
        "ordered_qty": ordered_qty,
        "asset_type_ID": asset_type_ID
      };
}
