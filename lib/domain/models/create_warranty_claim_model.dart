import 'dart:convert';

CreateWarrantyClaimModel createWarrantyClaimModelFromJson(String str) =>
    CreateWarrantyClaimModel.fromJson(json.decode(str));

String createWarrantyClaimModelToJson(CreateWarrantyClaimModel data) =>
    json.encode(data.toJson());

class CreateWarrantyClaimModel {
  int? id;
  int? facilityId;
  int? equipmentId;
  int? goodsOrderId;
  // String? affectedPart;
  String? orderReference;
  String? affectedSrNo;
  int? costOfReplacement;
  int? currencyId;
  String? requestToSupplier;
  String? warrantyStartAt;
  String? currentTime;
  String? warrantyEndAt;
  String? warrantyClaimTitle;
  String? warrantyDescription;
  String? correctiveActionByBuyer;
  String? severity;
  String? comment;
  int? approverId;
  int? approxdailyloss;
  String? failureTime;
  List<dynamic>? uploadfile_ids;
  List<dynamic>? affectedParts;

  List<int?>? additionalEmailEmployees;
  List<ExternalEmails?>? externalEmails;
  List<SupplierActions?>? supplierActions;

  int? status;

  CreateWarrantyClaimModel(
      {this.facilityId,
      this.id,
      this.equipmentId,
      this.goodsOrderId,
      // this.affectedPart,
      this.orderReference,
      this.affectedSrNo,
      this.costOfReplacement,
      this.currencyId,
      this.severity,
      this.requestToSupplier,
      this.warrantyStartAt,
      this.currentTime,
      this.warrantyEndAt,
      this.warrantyClaimTitle,
      this.warrantyDescription,
      this.correctiveActionByBuyer,
      this.approverId,
      this.failureTime,
      this.additionalEmailEmployees,
      this.externalEmails,
      this.supplierActions,
      this.affectedParts,
      this.status,
      this.uploadfile_ids,
      this.comment,
      this.approxdailyloss});

  factory CreateWarrantyClaimModel.fromJson(Map<String, dynamic> json) =>
      CreateWarrantyClaimModel(
        id: json["id"],
        facilityId: json["facilityId"],
        equipmentId: json["equipmentId"],
        goodsOrderId: json["goodsOrderId"],
        // affectedPart: json['affectedPart'],
        orderReference: json['orderReference'],
        affectedSrNo: json['affectedSrNo'],
        costOfReplacement: json['costOfReplacement'],
        currencyId: json['currencyId'],
        approxdailyloss: json['approxdailyloss'],
        severity: json['severity'],
        requestToSupplier: json['requestToSupplier'],
        currentTime: json['date_of_claim'],
        warrantyStartAt: json['warrantyStartAt'],
        warrantyEndAt: json['warrantyEndAt'],
        warrantyClaimTitle: json['warrantyClaimTitle'],
        warrantyDescription: json['warrantyDescription'],
        correctiveActionByBuyer: json['correctiveActionByBuyer'],
        approverId: json['approverId'],
        failureTime: json['failureTime'],
        comment: json['comment'],
        additionalEmailEmployees: json["additionalEmailEmployees"] != null
            ? List<int>.from(json["additionalEmailEmployees"].map((x) => x))
            : [],
        externalEmails: json["externalEmails"] != null
            ? List<ExternalEmails>.from(
                json["externalEmails"]?.map((x) => ExternalEmails.fromJson(x)))
            : [],
        supplierActions: json["supplierActions"] != null
            ? List<SupplierActions>.from(json["supplierActions"]
                ?.map((x) => SupplierActions.fromJson(x)))
            : [],
        affectedParts: json["affectedParts"] != null
            ? List<int>.from(json["affectedParts"]?.map((x) => x))
            : [],
        uploadfile_ids: json["uploadfile_ids"] != null
            ? List<int>.from(json["uploadfile_ids"].map((x) => x))
            : [],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityId": facilityId,
        "equipmentId": equipmentId,
        "goodsOrderId": goodsOrderId,
        // "affectedPart": affectedPart,
        "orderReference": orderReference,
        "affectedSrNo": affectedSrNo,
        "severity": severity,
        "costOfReplacement": costOfReplacement,
        "currencyId": currencyId,
        "approxdailyloss": approxdailyloss,
        "requestToSupplier": requestToSupplier,
        "date_of_claim": currentTime,
        "warrantyStartAt": warrantyStartAt,
        "warrantyEndAt": warrantyEndAt,
        "warrantyClaimTitle": warrantyClaimTitle,
        "warrantyDescription": warrantyDescription,
        "correctiveActionByBuyer": correctiveActionByBuyer,
        "approverId": approverId,
        "comment": comment,
        "failureTime": failureTime,
        "additionalEmailEmployees":
            List<dynamic>.from(additionalEmailEmployees!.map((x) => x)),
        "externalEmails": List<dynamic>.from(externalEmails!.map((x) => x)),
        "supplierActions": List<dynamic>.from(supplierActions!.map((x) => x)),
        "uploadfile_ids": List<dynamic>.from(uploadfile_ids!.map((x) => x)),
        "affectedParts": List<dynamic>.from(affectedParts!.map((x) => x)),
        "status": status,
      };
}

class ExternalEmails {
  ExternalEmails({
    this.name,
    this.email,
    this.mobile,
    this.role,
  });

  String? name;
  String? role;
  String? email;
  int? mobile;

  factory ExternalEmails.fromJson(Map<String, dynamic> json) => ExternalEmails(
      name: json["name"],
      role: json["role"],
      email: json["email"],
      mobile: json['mobile']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "email": email,
        "mobile": mobile,
      };
}

class SupplierActions {
  SupplierActions({
    this.name,
    // this.is_required,
    this.required_by_date,
    this.srNumber,
  });

  String? name;
  // bool? is_required;
  String? required_by_date;
  String? srNumber;

  factory SupplierActions.fromJson(Map<String, dynamic> json) =>
      SupplierActions(
        name: json["name"],
        // is_required: json["is_required"],
        required_by_date: json["required_by_date"],
        srNumber: json['srNumber'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        // "is_required": is_required,
        "required_by_date": required_by_date,
        "srNumber": srNumber
      };
}

// class AffectedParts {
//   AffectedParts({
//     this.name,
//   });

//   String? name;

//   factory AffectedParts.fromJson(Map<String, dynamic> json) => AffectedParts(
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//       };
// }

String addExternalEmailsToJson(ExternalEmails data) =>
    json.encode(data.toJson());
String addSupplierActionsToJson(SupplierActions data) =>
    json.encode(data.toJson());
