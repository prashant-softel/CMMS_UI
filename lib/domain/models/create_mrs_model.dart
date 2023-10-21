class CreateMrsModel {
  int? ID;
  int? isEditMode;
  int? facility_ID;
  String? setAsTemplate;
  String? activity;
  int? whereUsedType;
  int? whereUsedTypeId;
  String? remarks;
  int? from_actor_type_id;
  int? from_actor_id;
  int? to_actor_type_id;
  int? to_actor_id;
  List<Equipments>? equipments;
  CreateMrsModel(
      {this.ID,
      this.activity,
      this.equipments,
      this.isEditMode,
      this.facility_ID,
      this.remarks,
      this.setAsTemplate,
      this.whereUsedType,
      this.whereUsedTypeId,
      this.from_actor_id,
      this.from_actor_type_id,
      this.to_actor_id,
      this.to_actor_type_id});

  factory CreateMrsModel.fromJson(Map<String, dynamic> json) => CreateMrsModel(
        ID: json["ID"],
        activity: json["activity"],
        isEditMode: json["isEditMode"],
        facility_ID: json["facility_ID"],
        remarks: json["remarks"],
        setAsTemplate: json["setAsTemplate"],
        whereUsedType: json["whereUsedType"],
        whereUsedTypeId: json["whereUsedRefID"],
        from_actor_id: json["from_actor_id"],
        from_actor_type_id: json["from_actor_type_id"],
        to_actor_id: json["to_actor_id"],
        to_actor_type_id: json["to_actor_type_id"],
        equipments: List<Equipments>.from(
            json["cmmrsItems"].map((x) => Equipments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": ID,
        // "approved_date": approved_date,
        "activity": activity,
        "facility_ID": facility_ID,
        "isEditMode": isEditMode,
        // "requestd_date": requestd_date,
        // "requested_by_Id": requested_by_Id,
        "remarks": remarks,
        "setAsTemplate": setAsTemplate,
        "whereUsedType": whereUsedType,
        "whereUsedRefID": whereUsedTypeId,
        "from_actor_id": from_actor_id,
        "from_actor_type_id": from_actor_type_id,
        "to_actor_id": to_actor_id,
        "to_actor_type_id": to_actor_type_id,

        "cmmrsItems": List<dynamic>.from(equipments!.map((x) => x.toJson())),
      };
}

class Equipments {
  Equipments(
      {this.asset_code,
      this.asset_type_ID,
      this.equipmentID,
      this.id,
      this.issued_qty,
      this.requested_qty});

  int? id;
  int? equipmentID;
  int? asset_type_ID;
  String? asset_code;
  int? requested_qty;
  int? issued_qty;

  int? returned_qty;
  int? used_qty;
  int? available_qty;
  factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
        id: json["id"],
        equipmentID: json["asset_item_ID"],
        asset_type_ID: json["asset_type_ID"],
        asset_code: json["asset_code"],
        requested_qty: json["requested_qty"],
        issued_qty: json["issued_qty"],
      );

  Map<String, dynamic> toJson() => {
        "issued_qty": issued_qty,
        "requested_qty": requested_qty,
        "asset_code": asset_code,
        "asset_type_ID": asset_type_ID,
        "asset_item_ID": equipmentID,
        "id": id,
      };
}
