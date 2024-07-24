class CreateReturnMrsModel {
  int? ID;
  int? facility_ID;
  String? setAsTemplate;
  String? remarks;
  String? activity;

  int? whereUsedType;
  int? whereUsedTypeId;
  int? from_actor_type_id;
  int? from_actor_id;
  int? to_actor_type_id;
  int? to_actor_id;

  List<CmmsItem>? cmmrsItems;
  List<FaultyItemsCmms>? faultyItems;

  CreateReturnMrsModel(
      {this.ID,
      this.facility_ID,
      this.setAsTemplate,
      this.cmmrsItems,
      this.remarks,
      this.whereUsedType,
      this.whereUsedTypeId,
      this.from_actor_id,
      this.from_actor_type_id,
      this.to_actor_id,
      this.to_actor_type_id,
      this.activity,
      this.faultyItems});

  factory CreateReturnMrsModel.fromJson(Map<String, dynamic> json) =>
      CreateReturnMrsModel(
        ID: json["ID"],
        facility_ID: json["facility_ID"],
        activity: json["activity"],
        from_actor_id: json["from_actor_id"],
        to_actor_id: json["to_actor_id"],
        from_actor_type_id: json["from_actor_type_id"],
        to_actor_type_id: json["to_actor_type_id"],
        remarks: json["remarks"],
        setAsTemplate: json["setAsTemplate"],
        whereUsedType: json["whereUsedType"],
        whereUsedTypeId: json["whereUsedRefID"],
        faultyItems: List<FaultyItemsCmms>.from(
            json["faultyItems"].map((x) => FaultyItemsCmms.fromJson(x))),
        cmmrsItems: List<CmmsItem>.from(
            json["cmmrsItems"].map((x) => CmmsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "to_actor_type_id": to_actor_type_id,
        "from_actor_type_id": from_actor_type_id,
        "to_actor_id": to_actor_id,
        "from_actor_id": from_actor_id,
        "facility_ID": facility_ID,
        "activity": activity,
        "whereUsedRefID": whereUsedTypeId,
        "whereUsedType": whereUsedType,
        "setAsTemplate": setAsTemplate,
        "remarks": remarks,
        "faultyItems": List<dynamic>.from(faultyItems!.map((x) => x.toJson())),
        "cmmrsItems": List<dynamic>.from(cmmrsItems!.map((x) => x.toJson())),
      };
}

class CmmsItem {
  CmmsItem({this.mrs_item_ID, this.return_remarks, this.returned_qty});

  String? return_remarks;
  dynamic returned_qty;

  int? mrs_item_ID;

  factory CmmsItem.fromJson(Map<String, dynamic> json) => CmmsItem(
        mrs_item_ID: json["mrs_item_ID"],
        return_remarks: json["return_remarks"],
        returned_qty: json["returned_qty"],
      );

  Map<String, dynamic> toJson() => {
        "mrs_item_ID": mrs_item_ID,
        "return_remarks": return_remarks,
        "returned_qty": returned_qty,
      };
}

class FaultyItemsCmms {
  FaultyItemsCmms(
      {this.mrsItemID,
      this.assetMasterItemID,
      this.sr_no,
      this.return_remarks,
      this.returned_qty,
      this.assetsID});

  int? mrsItemID;
  int? assetMasterItemID;
  int? returned_qty;
  String? return_remarks;
  String? sr_no;
  int? assetsID;

  factory FaultyItemsCmms.fromJson(Map<String, dynamic> json) =>
      FaultyItemsCmms(
        sr_no: json["serial_number"],
        assetMasterItemID: json["assetMasterItemID"],
        mrsItemID: json['mrs_item_ID'] == null ? 0 : json['mrs_item_ID'],
        return_remarks: json["return_remarks"],
        returned_qty: json["returned_qty"],
        assetsID: json["faulty_item_asset_id"],
      );

  Map<String, dynamic> toJson() => {
        "assetMasterItemID": assetMasterItemID,
        "serial_number": sr_no,
        "return_remarks": return_remarks,
        "returned_qty": returned_qty,
        "faulty_item_asset_id": assetsID,
        "mrs_item_ID": mrsItemID == null ? 0 : mrsItemID,
      };
}
