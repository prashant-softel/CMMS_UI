// import 'dart:convert';

// UpdateRequestOrderDataModel updateRequestOrderDataModel(String str) =>
//     UpdateRequestOrderDataModel.fromJson(json.decode(str));

// class UpdateRequestOrderDataModel {
//   int? request_order_id;
//   int? facilityID;
//   List<UpdateSubmitItems?>? items;
//   String? comments;

//   UpdateRequestOrderDataModel(
//       {this.request_order_id, this.facilityID, this.items, this.comments});

//   factory UpdateRequestOrderDataModel.fromJson(Map<String, dynamic> json) {
//     return UpdateRequestOrderDataModel(
//       request_order_id: json['request_order_id'],
//       facilityID: json['facilityID'],
//       items: json["request_order_items"] != null
//           ? List<UpdateSubmitItems>.from(json["request_order_items"]
//               ?.map((x) => UpdateSubmitItems.fromJson(x)))
//           : [],
//       comments: json['comment'],
//     );
//   }
//   Map<String, dynamic> toJson() => {
//         "facilityID": facilityID,
//         "request_order_items": List<dynamic>.from(items!.map((x) => x)),
//         "comment": comments,
//       };
// }

// class UpdateSubmitItems {
//   UpdateSubmitItems({
//     this.itemID,
//     this.assetItemID,
//     this.cost,
//     this.ordered_qty,
//     this.comment,
//   });

//   int? itemID;
//   int? assetItemID;
//   int? cost;
//   int? ordered_qty;
//   String? comment;

//   factory UpdateSubmitItems.fromJson(Map<String, dynamic> json) =>
//       UpdateSubmitItems(
//         itemID: json["itemID"],
//         assetItemID: json["assetItemID"],
//         cost: json["cost"],
//         ordered_qty: json["ordered_qty"],
//         comment: json["comment"],
//       );

//   Map<String, dynamic> toJson() => {
//         "itemID": itemID,
//         "assetItemID": assetItemID,
//         "cost": cost,
//         "ordered_qty": ordered_qty,
//         "comment": comment,
//       };
// }
