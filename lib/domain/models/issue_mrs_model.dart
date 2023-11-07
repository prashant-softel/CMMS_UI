class IssueMrsModel {
  IssueMrsModel(
      {required this.ID,
      required this.cmmrsItems,
      required this.issue_comment});

  int ID;
  String issue_comment;
  List<CmmrsItemsModel> cmmrsItems;

  factory IssueMrsModel.fromJson(Map<String, dynamic> json) => IssueMrsModel(
        ID: json["ID"],
        issue_comment: json["issue_comment"],
        cmmrsItems: List<CmmrsItemsModel>.from(
            json["cmmrsItems"].map((x) => CmmrsItemsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "issue_comment": issue_comment,
        "cmmrsItems": List<dynamic>.from(cmmrsItems.map((x) => x.toJson())),
      };
}

class CmmrsItemsModel {
  CmmrsItemsModel(
      {required this.issued_qty,
      required this.asset_item_ID,
      required this.mrs_item_id,
      required this.material_id});

  int mrs_item_id;
  int issued_qty;
  int material_id;
  int asset_item_ID;
  factory CmmrsItemsModel.fromJson(Map<String, dynamic> json) =>
      CmmrsItemsModel(
        mrs_item_id: json["mrs_item_id"],
        material_id: json["material_id"],
        asset_item_ID: json["asset_item_ID"],
        issued_qty: json["issued_qty"],
      );

  Map<String, dynamic> toJson() => {
        "mrs_item_id": mrs_item_id,
        "issued_qty": issued_qty,
        "asset_item_ID": asset_item_ID,
        "material_id": material_id,
      };
}
