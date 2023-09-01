class CreateReturnMrsModel {
  int? ID;
  int? facility_ID;
  String? setAsTemplate;
  String? remarks;
  String? activity;

  int? whereUsedType;
  int? whereUsedTypeId;
  List<CmmsItem>? cmmrsItems;

  CreateReturnMrsModel(
      {this.ID,
      this.activity,
      this.facility_ID,
      this.setAsTemplate,
      this.cmmrsItems,
      this.remarks,
      this.whereUsedType,
      this.whereUsedTypeId});

  factory CreateReturnMrsModel.fromJson(Map<String, dynamic> json) =>
      CreateReturnMrsModel(
        ID: json["ID"],
        facility_ID: json["facility_ID"],
        remarks: json["remarks"],
        setAsTemplate: json["setAsTemplate"],
        activity: json["activity"],
        whereUsedType: json["whereUsedType"],
        whereUsedTypeId: json["whereUsedTypeId"],
        cmmrsItems: List<CmmsItem>.from(
            json["cmmrsItems"].map((x) => CmmsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "facility_ID": facility_ID,
        "whereUsedTypeId": whereUsedTypeId,
        "whereUsedType": whereUsedType,
        "activity": activity,
        "setAsTemplate": setAsTemplate,
        "remarks": remarks,
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
  int? issued_qty;
  String? return_remarks;
  int? requested_qty;
  int? returned_qty;

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
