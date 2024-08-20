import 'package:cmms/domain/models/create_warranty_claim_model.dart';

class UpdateWarrantyClaim {
  int? id;
  int? facilityId;
  int? type;
  String? comment;
  List<dynamic>? uploadfile_ids;
  List<SupplierActions?>? supplierActions;

  UpdateWarrantyClaim({
    this.id,
    this.facilityId,
    this.type,
    this.comment,
    this.uploadfile_ids,
    this.supplierActions,
  });

  factory UpdateWarrantyClaim.fromJson(Map<String, dynamic> json) =>
      UpdateWarrantyClaim(
        id: json['id'],
        facilityId: json['facilityId'],
        type: json['claim_status'],
        comment: json['comment'],
        supplierActions: json["supplierActions"] != null
            ? List<SupplierActions>.from(json["supplierActions"]
                ?.map((x) => SupplierActions.fromJson(x)))
            : [],
        uploadfile_ids: json["uploadfile_ids"] != null
            ? List<int>.from(json["uploadfile_ids"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'facilityId': facilityId,
        'claim_status': type,
        'comment': comment,
        "supplierActions": List<dynamic>.from(supplierActions!.map((x) => x)),
        "uploadfile_ids": List<dynamic>.from(uploadfile_ids!.map((x) => x)),
      };
}
