class CreateReturnMrsModel {
  int? ID;
  int? isEditMode;
  int? facility_ID;
  int? requested_by_emp_ID;
  String? returnDate;
  String? setAsTemplate;
  int? asset_item_ID;
  int? item_condition;
  String? return_remarks;

  List<Equipments>? equipments;

  CreateReturnMrsModel(
      {this.ID,
      this.equipments,
      this.isEditMode,
      this.facility_ID,
      this.setAsTemplate,
      this.asset_item_ID,
      this.item_condition,
      this.requested_by_emp_ID,
      this.returnDate,
      this.return_remarks});

  factory CreateReturnMrsModel.fromJson(Map<String, dynamic> json) =>
      CreateReturnMrsModel(
        ID: json["ID"],
        isEditMode: json["isEditMode"],
        facility_ID: json["facility_ID"],
        requested_by_emp_ID: json["requested_by_emp_ID"],
        returnDate: json["returnDate"],
        return_remarks: json["return_remarks"],
        setAsTemplate: json["setAsTemplate"],
        asset_item_ID: json["asset_item_ID"],
        item_condition: json["item_condition"],
        equipments: List<Equipments>.from(
            json["cmmrsItems"].map((x) => Equipments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "requested_by_emp_ID": requested_by_emp_ID,
        "facility_ID": facility_ID,
        "isEditMode": isEditMode,
        "returnDate": returnDate,
        "return_remarks": return_remarks,
        "setAsTemplate": setAsTemplate,
        "asset_item_ID": asset_item_ID,
        "item_condition": item_condition,
        "cmmrsItems": List<dynamic>.from(equipments!.map((x) => x.toJson())),
      };
}

class Equipments {
  Equipments(
      {this.approval_required,
      this.asset_code,
      this.asset_type_ID,
      this.equipmentID,
      this.id,
      this.issued_qty,
      this.requested_qty,
      this.is_faulty,
      this.return_remarks,
      this.returned_qty});

  int? id;
  int? equipmentID;
  int? approval_required;
  int? asset_type_ID;
  String? asset_code;
  int? requested_qty;
  int? issued_qty;

  int? returned_qty;
  int? is_faulty;
  String? return_remarks;

  factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
        id: json["id"],
        equipmentID: json["equipmentID"],
        approval_required: json["approval_required"],
        asset_type_ID: json["asset_type_ID"],
        asset_code: json["asset_code"],
        requested_qty: json["requested_qty"],
        issued_qty: json["issued_qty"],
        is_faulty: json["is_faulty"],
        return_remarks: json["return_remarks"],
        returned_qty: json["returned_qty"],
      );

  Map<String, dynamic> toJson() => {
        "issued_qty": issued_qty,
        "requested_qty": requested_qty,
        "asset_code": asset_code,
        "asset_type_ID": asset_type_ID,
        "approval_required": approval_required,
        "equipmentID": equipmentID,
        "id": id,
        "is_faulty": is_faulty,
        "return_remarks": return_remarks,
        "returned_qty": returned_qty,
      };
}
