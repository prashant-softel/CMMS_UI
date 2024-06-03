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
  CmmsItem(
      {this.approval_required,
      this.asset_item_ID,
      this.issued_qty,
      this.requested_qty,
      this.is_faulty,
      this.return_remarks,
      this.returned_qty});

  int? asset_item_ID;
  int? approval_required;
  dynamic issued_qty;
  String? return_remarks;
  dynamic requested_qty;
  dynamic returned_qty;

  int? is_faulty;

  factory CmmsItem.fromJson(Map<String, dynamic> json) => CmmsItem(
        asset_item_ID: json["asset_item_ID"],
        approval_required: json["approval_required"],
        requested_qty: json["requested_qty"],
        issued_qty: json["issued_qty"],
        is_faulty: json["is_faulty"],
        return_remarks: json["return_remarks"],
        returned_qty: json["returned_qty"],
      );

  Map<String, dynamic> toJson() => {
        "issued_qty": issued_qty,
        "requested_qty": requested_qty,
        "asset_item_ID": asset_item_ID,
        "approval_required": approval_required,
        "is_faulty": is_faulty,
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
      this.returned_qty});

  int? mrsItemID;
  int? assetMasterItemID;
  int? returned_qty;
  String? return_remarks;
  String? sr_no;

  factory FaultyItemsCmms.fromJson(Map<String, dynamic> json) =>
      FaultyItemsCmms(
        sr_no: json["sr_no"],
        assetMasterItemID: json["assetMasterItemID"],
        mrsItemID: json["mrsItemID"],
        return_remarks: json["return_remarks"],
        returned_qty: json["returned_qty"],
      );

  Map<String, dynamic> toJson() => {
        "mrsItemID": mrsItemID,
        "assetMasterItemID": assetMasterItemID,
        "sr_no": sr_no,
        "return_remarks": return_remarks,
        "returned_qty": returned_qty,
      };
}
