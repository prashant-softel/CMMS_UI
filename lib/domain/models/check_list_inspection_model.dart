class ChecklistInspectionModel {
  List<Checklist>? checklist;

  ChecklistInspectionModel({this.checklist});

  ChecklistInspectionModel.fromJson(Map<String, dynamic> json) {
    if (json['checklist'] != null) {
      checklist = <Checklist>[];
      json['checklist'].forEach((v) {
        checklist!.add(new Checklist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.checklist != null) {
      data['checklist'] = this.checklist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Checklist {
  String? checklistName;
  String? sOPNumber;
  String? frequency;
  List<MonthlyInspection>? monthlyInspection;

  Checklist(
      {this.checklistName,
      this.sOPNumber,
      this.frequency,
      this.monthlyInspection});

  Checklist.fromJson(Map<String, dynamic> json) {
    checklistName = json['checklistName'];
    sOPNumber = json['sOPNumber'];
    frequency = json['frequency'];
    if (json['monthlyInspection'] != null) {
      monthlyInspection = <MonthlyInspection>[];
      json['monthlyInspection'].forEach((v) {
        monthlyInspection!.add(new MonthlyInspection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checklistName'] = this.checklistName;
    data['sOPNumber'] = this.sOPNumber;
    data['frequency'] = this.frequency;
    if (this.monthlyInspection != null) {
      data['monthlyInspection'] =
          this.monthlyInspection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlyInspection {
  String? inspectionMonth;
  String? inspectionStatus;
  String? dateOfInspection;
  String? checklistAttachment;
  String? noOfUnsafeObservations;

  MonthlyInspection(
      {this.inspectionMonth,
      this.inspectionStatus,
      this.dateOfInspection,
      this.checklistAttachment,
      this.noOfUnsafeObservations});

  MonthlyInspection.fromJson(Map<String, dynamic> json) {
    inspectionMonth = json['inspectionMonth'];
    inspectionStatus = json['inspectionStatus'];
    dateOfInspection = json['dateOfInspection'];
    checklistAttachment = json['checklistAttachment'];
    noOfUnsafeObservations = json['noOfUnsafeObservations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inspectionMonth'] = this.inspectionMonth;
    data['inspectionStatus'] = this.inspectionStatus;
    data['dateOfInspection'] = this.dateOfInspection;
    data['checklistAttachment'] = this.checklistAttachment;
    data['noOfUnsafeObservations'] = this.noOfUnsafeObservations;
    return data;
  }
}
