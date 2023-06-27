import 'dart:convert';

List<GetAssetDataModel> newPermitListFromJson(String str) =>
    List<GetAssetDataModel>.from(
        json.decode(str).map(GetAssetDataModel.fromJson));

String newPermitListToJson(List<GetAssetDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAssetDataModel {
  int? id;
  String? asset_type;
  // int? status;

  GetAssetDataModel({
    this.id,
    this.asset_type,
    // this.status,
  });

  GetAssetDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    asset_type = json['asset_type'];
    // status = json['status'];
  }

  Map<String, dynamic> toJson() => {
        // final Map<String, dynamic> data = new Map<String, dynamic>();
        // data['id'] = this.id;
        // data['asset_type'] = this.asset_type;
        // data['status'] = this.status;
        "id": id,
        "asset_type": asset_type,
        // "status": status

        // return data;
      };
}
