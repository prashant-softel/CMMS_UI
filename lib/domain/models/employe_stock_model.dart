import 'dart:convert';

EmployeeStockListModel employeeStockListModelFromJson(String str) =>
    EmployeeStockListModel.fromJson(json.decode(str));

class EmployeeStockListModel {
  int? emp_ID;
  String? emp_name;
  List<CmmrsItemsModel>? cmmrsItems;

  EmployeeStockListModel({this.emp_ID, this.emp_name, this.cmmrsItems});

  factory EmployeeStockListModel.fromJson(Map<String, dynamic> parsedJson) {
    var cmmrsItems = parsedJson['cmmrsItems'] as List;
    print(cmmrsItems.runtimeType);
    List<CmmrsItemsModel> cmmrsItem =
        cmmrsItems.map((i) => CmmrsItemsModel.fromJson(i)).toList();

    return EmployeeStockListModel(
        emp_ID: parsedJson['emp_ID'],
        emp_name: parsedJson['emp_name'],
        cmmrsItems: cmmrsItem);
  }
}

class CmmrsItemsModel {
  int? id;
  String? name;
  dynamic quantity;

  CmmrsItemsModel({this.id, this.name, this.quantity});

  factory CmmrsItemsModel.fromJson(Map<String, dynamic> parsedJson) {
    return CmmrsItemsModel(
      id: parsedJson['asset_item_ID'],
      name: parsedJson['item_name'],
      quantity: parsedJson['quantity'],
    );
  }
}
