import 'dart:convert';

List<ObservationSummaryModel> obsSummaryFromJson(String str) =>
    List<ObservationSummaryModel>.from(
        json.decode(str).map((x) => ObservationSummaryModel.fromJson(x)));

class ObservationSummaryModel {
  int? month;
  String? month_name;
  int? year;
  int? created;
  int? open;
  int? closed;
  int? unsafeact;
  int? unsafecondition;
  int? statutorynoncompliance;
  int? createdCountCritical;
  int? openCountCritical;
  int? closeCountCritical;
  int? createdCountSignificant;
  int? openCountSignificant;
  int? closeCountSignificant;
  int? createdCountModerate;
  int? openCountModerate;
  int? closeCountModerate;
  int? statuscode;
  int? target_count;

  ObservationSummaryModel(
      {this.month,
      this.month_name,
      this.year,
      this.created,
      this.open,
      this.closed,
      this.unsafeact,
      this.unsafecondition,
      this.statutorynoncompliance,
      this.createdCountCritical,
      this.openCountCritical,
      this.closeCountCritical,
      this.createdCountSignificant,
      this.openCountSignificant,
      this.closeCountSignificant,
      this.createdCountModerate,
      this.openCountModerate,
      this.closeCountModerate,
      this.statuscode,
      this.target_count});

  ObservationSummaryModel.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    month_name = json['month_name'];
    year = json['year'];
    created = json['created'];
    open = json['open'];
    closed = json['closed'];
    unsafeact = json['unsafe_act'];
    unsafecondition = json['unsafe_condition'];
    statutorynoncompliance = json['statutory_non_compliance'];
    createdCountCritical = json['createdCount_Critical'];
    openCountCritical = json['openCount_Critical'];
    closeCountCritical = json['closeCount_Critical'];
    createdCountSignificant = json['createdCount_Significant'];
    openCountSignificant = json['openCount_Significant'];
    closeCountSignificant = json['closeCount_Significant'];
    createdCountModerate = json['createdCount_Moderate'];
    openCountModerate = json['openCount_Moderate'];
    closeCountModerate = json['closeCount_Moderate'];
    statuscode = json['status_code'];
    target_count = json['target_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['month'] = month;
    data['month_name'] = month_name;
    data['year'] = year;
    data['created'] = created;
    data['open'] = open;
    data['closed'] = closed;
    data['unsafe_act'] = unsafeact;
    data['unsafe_condition'] = unsafecondition;
    data['statutory_non_compliance'] = statutorynoncompliance;
    data['createdCount_Critical'] = createdCountCritical;
    data['openCount_Critical'] = openCountCritical;
    data['closeCount_Critical'] = closeCountCritical;
    data['createdCount_Significant'] = createdCountSignificant;
    data['openCount_Significant'] = openCountSignificant;
    data['closeCount_Significant'] = closeCountSignificant;
    data['createdCount_Moderate'] = createdCountModerate;
    data['openCount_Moderate'] = openCountModerate;
    data['closeCount_Moderate'] = closeCountModerate;
    data['status_code'] = statuscode;
    data['target_count'] = target_count;
    return data;
  }
}
