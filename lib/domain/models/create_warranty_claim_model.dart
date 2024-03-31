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
  String? warrantyEndAt;
  String? warrantyClaimTitle;
  String? warrantyDescription;
  String? correctiveActionByBuyer;
  String? severity;
  int? approverId;
  String? failureTime;

  List<int?>? additionalEmailEmployees;
  List<ExternalEmails?>? externalEmails;
  List<SupplierActions?>? supplierActions;
  List<AffectedParts?>? affectedParts;

  int? status;

  CreateWarrantyClaimModel({
    this.facilityId,
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
  });

  factory CreateWarrantyClaimModel.fromJson(Map<String, dynamic> json) =>
      CreateWarrantyClaimModel(
        facilityId: json["facilityId"],
        equipmentId: json["equipmentId"],
        goodsOrderId: json["goodsOrderId"],
        // affectedPart: json['affectedPart'],
        orderReference: json['orderReference'],
        affectedSrNo: json['affectedSrNo'],
        costOfReplacement: json['costOfReplacement'],
        currencyId: json['currencyId'],
        severity: json['severity'],
        requestToSupplier: json['requestToSupplier'],
        warrantyStartAt: json['warrantyStartAt'],
        warrantyEndAt: json['warrantyEndAt'],
        warrantyClaimTitle: json['warrantyClaimTitle'],
        warrantyDescription: json['warrantyDescription'],
        correctiveActionByBuyer: json['correctiveActionByBuyer'],
        approverId: json['approverId'],
        failureTime: json['failureTime'],
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
            ? List<AffectedParts>.from(
                json["affectedParts"]?.map((x) => AffectedParts.fromJson(x)))
            : [],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        "facilityId": facilityId,
        "equipmentId": equipmentId,
        "goodsOrderId": goodsOrderId,
        // "affectedPart": affectedPart,
        "orderReference": orderReference,
        "affectedSrNo": affectedSrNo,
        "severity": severity,
        "costOfReplacement": costOfReplacement,
        "currencyId": currencyId,
        "requestToSupplier": requestToSupplier,
        "warrantyStartAt": warrantyStartAt,
        "warrantyEndAt": warrantyEndAt,
        "warrantyClaimTitle": warrantyClaimTitle,
        "warrantyDescription": warrantyDescription,
        "correctiveActionByBuyer": correctiveActionByBuyer,
        "approverId": approverId,
        "failureTime": failureTime,
        "additionalEmailEmployees":
            List<dynamic>.from(additionalEmailEmployees!.map((x) => x)),
        "externalEmails": List<dynamic>.from(externalEmails!.map((x) => x)),
        "supplierActions": List<dynamic>.from(supplierActions!.map((x) => x)),
        "affectedParts": List<dynamic>.from(affectedParts!.map((x) => x)),
        "status": status,
      };
}

class ExternalEmails {
  ExternalEmails({this.name, this.email, this.mobile});

  String? name;
  String? email;
  int? mobile;

  factory ExternalEmails.fromJson(Map<String, dynamic> json) => ExternalEmails(
      name: json["name"], email: json["email"], mobile: json['mobile']);

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "mobile": mobile};
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

class AffectedParts {
  AffectedParts({
    this.name,
  });

  String? name;

  factory AffectedParts.fromJson(Map<String, dynamic> json) => AffectedParts(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

String addExternalEmailsToJson(ExternalEmails data) =>
    json.encode(data.toJson());
String addSupplierActionsToJson(SupplierActions data) =>
    json.encode(data.toJson());
