import 'dart:convert';

List<TrainingSummaryModel> trainingSummaryFromJson(String str) =>
    List<TrainingSummaryModel>.from(
        json.decode(str).map((x) => TrainingSummaryModel.fromJson(x)));

class TrainingSummaryModel {
  int? month;
  String? month_name;
  int? year;
  int? created;
  int? open;
  int? closed;
  double? manHours;
  int? special_mockDrill;
  int? hfe_mockDrill;
  int? induction;
  int? hfe_training;
  int? special_training;
  int? number_of_people_inducted;
  double? total_man_hours_excluding_mock_and_induction;
  double? total_training_hours_excluding_mock_and_induction;
  int? scheduled;
  int? ended;

  TrainingSummaryModel(
      {this.month,
      this.month_name,
      this.year,
      this.created,
      this.open,
      this.closed,
      this.manHours,
      this.special_mockDrill,
      this.hfe_mockDrill,
      this.induction,
      this.hfe_training,
      this.special_training,
      this.number_of_people_inducted,
      this.total_man_hours_excluding_mock_and_induction,
      this.total_training_hours_excluding_mock_and_induction,
      this.scheduled,
      this.ended,
      });

  TrainingSummaryModel.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    month_name = json['month_name'];
    year = json['year'];
    created = json['created'];
    open = json['open'];
    closed = json['closed'];
    manHours = json['manHours'];
    special_mockDrill = json['special_mockDrill'];
    hfe_mockDrill = json['hfe_mockDrill'];
    induction = json['induction'];
    hfe_training = json['hfe_training'];
    special_training = json['special_training'];
    number_of_people_inducted = json['number_of_people_inducted'];
    total_man_hours_excluding_mock_and_induction = json['total_man_hours_excluding_mock_and_induction'];
    total_training_hours_excluding_mock_and_induction = json['total_training_hours_excluding_mock_and_induction'];
    scheduled = json['scheduled'];
    ended = json['ended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['month'] = month;
    data['month_name'] = month_name;
    data['year'] = year;
    data['created'] = created;
    data['open'] = open;
    data['closed'] = closed;
    data['manHours'] = manHours;
    data['special_mockDrill'] = special_mockDrill;
    data['hfe_mockDrill'] = hfe_mockDrill;
    data['induction'] = induction;
    data['hfe_training'] = hfe_training;
    data['special_training'] = special_training;
    data['number_of_people_inducted'] = number_of_people_inducted;
    data['total_man_hours_excluding_mock_and_induction'] = total_man_hours_excluding_mock_and_induction;
    data['total_training_hours_excluding_mock_and_induction'] = total_training_hours_excluding_mock_and_induction;
    data['scheduled'] = scheduled;
    data['ended'] = ended;
    return data;
  }
}
