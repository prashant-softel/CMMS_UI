import 'dart:convert';

SubmitPurchaseOrderDataModel submitPurchaseOrderDataModel(String str) =>
    SubmitPurchaseOrderDataModel.fromJson(json.decode(str));

class SubmitPurchaseOrderDataModel {
  int? id;
  int? facilityID;
  int? purchaseID;
  int? order_type;
  int? location_ID;
  int? vendorID;
  String? requestDate;
  String? challan_no;
  String? challan_date;
  String? po_no;
  String? freight;
  String? received_on;
  String? no_pkg_received;
  String? lr_no;
  String? condition_pkg_received;
  String? vehicle_no;
  String? gir_no;
  String? job_ref;
  int? amount;
  int? currencyID;

  List<SubmitItems?>? items;
  SubmitPurchaseOrderDataModel({
    this.facilityID,
    this.items,
    this.id,
    this.purchaseID,
    this.order_type,
    this.location_ID,
    this.vendorID,
    this.requestDate,
    this.challan_no,
    this.challan_date,
    this.po_no,
    this.freight,
    this.received_on,
    this.no_pkg_received,
    this.lr_no,
    this.condition_pkg_received,
    this.vehicle_no,
    this.gir_no,
    this.job_ref,
    this.amount,
    this.currencyID,
  });

  factory SubmitPurchaseOrderDataModel.fromJson(Map<String, dynamic> json) {
    return SubmitPurchaseOrderDataModel(
      id: json['id'],
      facilityID: json['facilityID'],
      purchaseID: json['purchaseID'],
      order_type: json['order_type'],
      location_ID: json['location_ID'],
      vendorID: json['vendorID'],
      requestDate: json['requestDate'],
      challan_no: json['challan_no'],
      challan_date: json['challan_date'],
      po_no: json['po_no'],
      freight: json['freight'],
      received_on: json['received_on'],
      no_pkg_received: json['no_pkg_received'],
      lr_no: json['lr_no'],
      condition_pkg_received: json['condition_pkg_received'],
      vehicle_no: json['vehicle_no'],
      gir_no: json['gir_no'],
      job_ref: json['job_ref'],
      amount: json['amount'],
      currencyID: json['currencyID'],
      items: json["submitItems"] != null
          ? List<SubmitItems>.from(
              json["submitItems"]?.map((x) => SubmitItems.fromJson(x)))
          : [],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityID": facilityID,
        "purchaseID": purchaseID,
        "order_type": order_type,
        "location_ID": location_ID,
        "vendorID": vendorID,
        "requestDate": requestDate,
        "challan_no": challan_no,
        "challan_date": challan_date,
        "po_no": po_no,
        "freight": freight,
        "received_on": received_on,
        "no_pkg_received": no_pkg_received,
        "lr_no": lr_no,
        "condition_pkg_received": condition_pkg_received,
        "vehicle_no": vehicle_no,
        "gir_no": gir_no,
        "job_ref": job_ref,
        "amount": amount,
        "currencyID": currencyID,
        "submitItems": List<dynamic>.from(items!.map((x) => x)),
      };
}

class SubmitItems {
  SubmitItems({
    this.assetCode,
    this.assetItemID,
    this.ordered_qty,
    this.type,
    this.cost,
  });

  String? assetCode;
  int? assetItemID;
  int? ordered_qty;
  int? type;
  int? cost;

  factory SubmitItems.fromJson(Map<String, dynamic> json) => SubmitItems(
        assetCode: json["assetCode"],
        assetItemID: json["assetItemID"],
        ordered_qty: json["ordered_qty"],
        type: json["type"],
        cost: json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "assetCode": assetCode,
        "assetItemID": assetItemID,
        "ordered_qty": ordered_qty,
        "type": type,
        "cost": cost,
      };
}
