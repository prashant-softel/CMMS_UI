import 'dart:convert';

List<GetChecklistInspection> getChecklistInspectionFromJson(String str) =>
    List<GetChecklistInspection>.from(
        json.decode(str).map((x) => GetChecklistInspection.fromJson(x)));

class GetChecklistInspection {
  int? facilityId;
  String? facilityName;
  List<InspectionData>? inspectionData;

  GetChecklistInspection({
    this.facilityId,
    this.facilityName,
    this.inspectionData,
  });

  factory GetChecklistInspection.fromJson(Map<String, dynamic> json) =>
      GetChecklistInspection(
        facilityId: json["facilityId"],
        facilityName: json["facilityName"],
        inspectionData: json["inspectionData"] != null
            ? List<InspectionData>.from(
                json["inspectionData"].map((x) => InspectionData.fromJson(x)),
              )
            : [],
      );
}

class InspectionData {
  String? monthName;
  int? monthId;
  int? year;
  List<CheckList>? checkList;

  InspectionData({
    this.monthName,
    this.monthId,
    this.year,
    this.checkList,
  });

  factory InspectionData.fromJson(Map<String, dynamic> json) => InspectionData(
        monthName: json["monthName"],
        monthId: json["monthId"],
        year: json["year"],
        checkList: json["checkList"] != null
            ? List<CheckList>.from(
                json["checkList"].map((x) => CheckList.fromJson(x)),
              )
            : [],
      );
}

class CheckList {
  String? checklistName;
  String? sopNumber;
  String? frequency;
  String? inspectionStatus;
  String? dateOfInspection;
  String? checklistAttachment;
  int? noOfUnsafeObservation;

  CheckList({
    this.checklistName,
    this.sopNumber,
    this.frequency,
    this.inspectionStatus,
    this.dateOfInspection,
    this.checklistAttachment,
    this.noOfUnsafeObservation,
  });

  factory CheckList.fromJson(Map<String, dynamic> json) => CheckList(
        checklistName: json["checklistName"],
        sopNumber: json["sopNumber"],
        frequency: json["frequency"],
        inspectionStatus: json["inspectionStatus"],
        dateOfInspection: json["dateOfInspection"],
        checklistAttachment: json["checklistAttachment"],
        noOfUnsafeObservation: json["noOfUnsafeObservation"],
      );
}
