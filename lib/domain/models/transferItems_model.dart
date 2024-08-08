import 'dart:convert';

String tranferItemsToJson(List<TranferItems> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TranferItems {
  int facilityID;
  int fromActorID;
  int fromActorType;
  int toActorID;
  int toActorType;
  int assetItemID;
  int qty;
  int refType;
  int refID;
  String remarks;
  int mrsID;
  int mrsItemID;
  int transaction_id;
  dynamic longitude;
  dynamic latitude;
  TranferItems(
      {required this.assetItemID,
      required this.facilityID,
      required this.fromActorID,
      required this.fromActorType,
      required this.mrsID,
      required this.qty,
      required this.refID,
      required this.refType,
      required this.remarks,
      required this.toActorID,
      required this.toActorType,
      required this.mrsItemID,
      required this.transaction_id,
      this.latitude,
      this.longitude});

  factory TranferItems.fromJson(Map<String, dynamic> json) => TranferItems(
      assetItemID: json['assetItemID'],
      facilityID: json['facilityID'],
      fromActorID: json['fromActorID'],
      fromActorType: json['fromActorType'],
      mrsID: json['mrsID'],
      mrsItemID: json['mrsItemID'],
      qty: json['qty'],
      refID: json['refID'],
      refType: json['refType'],
      remarks: json['remarks'],
      toActorID: json['toActorID'],
      toActorType: json['toActorType'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      transaction_id: json['transaction_id']);

  Map<String, dynamic> toJson() => {
        "assetItemID": assetItemID,
        'facilityID': facilityID,
        'fromActorID': fromActorID,
        'fromActorType': fromActorType,
        'qty': qty,
        'refID': refID,
        'refType': refType,
        'remarks': remarks,
        'toActorID': toActorID,
        'longitude': longitude,
        'latitude': latitude,
        'toActorType': toActorType,
        'mrsID': mrsID,
        'mrsItemID': mrsItemID,
        'transaction_id': transaction_id
      };
}
