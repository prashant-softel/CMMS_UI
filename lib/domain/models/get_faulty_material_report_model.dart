import 'dart:convert';

List<FaultyMaterialReportModel> FaultyMaterialReportModelFromJson(String str) =>
    List<FaultyMaterialReportModel>.from(
        json.decode(str).map((x) => FaultyMaterialReportModel.fromJson(x)));

class FaultyMaterialReportModel {
  int? id;
  int? fromActorID;
  String? fromActorType;
  int? toActorID;
  String? toActorType;
  int? assetItemID;
  int? qty;
  int? facility_id;
  String? referedby;
  int? reference_ID;
  String? remarks;
  int? nature_Of_Transaction;
  int? asset_Item_Status;
  int? flag;
  String? lastInsetedDateTime;
  String? facilityName;
  int? facility_Is_Block;
  String? facility_Is_Block_of_name;
  dynamic emp_name;
  String? asset_code;
  int? item_condition;
  String? serial_number;
  String? replaceSerialNo;
  String? asset_name;
  int? asset_type_ID;
  int? item_category_ID;
  int? actorID;

  FaultyMaterialReportModel(
      {this.actorID,
      this.assetItemID,
      this.asset_Item_Status,
      this.asset_code,
      this.asset_name,
      this.asset_type_ID,
      this.emp_name,
      this.facilityName,
      this.facility_Is_Block,
      this.facility_Is_Block_of_name,
      this.facility_id,
      this.flag,
      this.fromActorID,
      this.fromActorType,
      this.id,
      this.item_category_ID,
      this.item_condition,
      this.lastInsetedDateTime,
      this.nature_Of_Transaction,
      this.qty,
      this.referedby,
      this.reference_ID,
      this.remarks,
      this.replaceSerialNo,
      this.serial_number,
      this.toActorID,
      this.toActorType});

  factory FaultyMaterialReportModel.fromJson(Map<String, dynamic> parsedJson) {
    return FaultyMaterialReportModel(
      toActorType: parsedJson['toActorType'],
      toActorID: parsedJson['toActorID'],
      serial_number: parsedJson['serial_number'],
      replaceSerialNo: parsedJson['replaceSerialNo'],
      remarks: parsedJson['remarks'],
      reference_ID: parsedJson['reference_ID'],
      referedby: parsedJson['referedby'],
      qty: parsedJson['qty'],
      nature_Of_Transaction: parsedJson['nature_Of_Transaction'],
      lastInsetedDateTime: parsedJson['lastInsetedDateTime'],
      item_condition: parsedJson['item_condition'],
      item_category_ID: parsedJson['item_category_ID'],
      id: parsedJson['id'],
      fromActorType: parsedJson['fromActorType'],
      fromActorID: parsedJson['fromActorID'],
      flag: parsedJson['flag'],
      facility_id: parsedJson['facility_id'],
      facility_Is_Block_of_name: parsedJson['facility_Is_Block_of_name'],
      facility_Is_Block: parsedJson['facility_Is_Block'],
      facilityName: parsedJson['facilityName'],
      emp_name: parsedJson['emp_name'],
      asset_type_ID: parsedJson['asset_type_ID'],
      asset_name: parsedJson['asset_name'],
      asset_code: parsedJson['asset_code'],
      asset_Item_Status: parsedJson['asset_Item_Status'],
      assetItemID: parsedJson['assetItemID'],
      actorID: parsedJson['actorID'],
    );
  }
  Map<String, dynamic> toJson() => {
        "toActorType": toActorType,
        "toActorID": toActorID,
        "serial_number": serial_number,
        "replaceSerialNo": replaceSerialNo,
        "remarks": remarks,
        "reference_ID": reference_ID,
        "referedby": referedby,
        "qty": qty,
        "nature_Of_Transaction": nature_Of_Transaction,
        "lastInsetedDateTime": lastInsetedDateTime,
        "item_condition": item_condition,
        "item_category_ID": item_category_ID,
        "id": id,
        "fromActorType": fromActorType,
        "fromActorID": fromActorID,
        "flag": flag,
        "facility_id": facility_id,
        "facility_Is_Block_of_name": facility_Is_Block_of_name,
        "facility_Is_Block": facility_Is_Block,
        "facilityName": facilityName,
        "emp_name": emp_name,
        "asset_type_ID": asset_type_ID,
        "asset_name": asset_name,
        "asset_code": asset_code,
        "asset_Item_Status": asset_Item_Status,
        "assetItemID": assetItemID,
        "actorID": actorID,
      };
}
