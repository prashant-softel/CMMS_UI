import 'dart:convert';

CreateRegulataryvisitsModel CreateRegulataryvisitsModelFromJson(String str) =>
    CreateRegulataryvisitsModel.fromJson(json.decode(str));

class CreateRegulataryvisitsModel {
  int ? id;
  int? GovtAuthVisits;
  int? NoOfFineByThirdParty;
  int? NoOfShowCauseNoticesByThirdParty;
  int? NoticesToContractor;
  int? AmountOfPenaltiesToContractors;
  int? AnyOther;
  int? month_id;
   String? date;

  

  CreateRegulataryvisitsModel({
    this.id,
    this.GovtAuthVisits,
    this.NoOfFineByThirdParty,
    this.NoOfShowCauseNoticesByThirdParty,
    this.NoticesToContractor,
    this.AmountOfPenaltiesToContractors,
    this.AnyOther,
    this.month_id,
  this.date,
  });

  factory CreateRegulataryvisitsModel.fromJson(Map<String, dynamic> json) {
    return CreateRegulataryvisitsModel(

      GovtAuthVisits: json['GovtAuthVisits'],
      NoOfFineByThirdParty: json['NoOfFineByThirdParty'],
      NoOfShowCauseNoticesByThirdParty: json['NoOfShowCauseNoticesByThirdParty'],
      NoticesToContractor: json['NoticesToContractor'],
      id: json['id'],
      AmountOfPenaltiesToContractors: json['AmountOfPenaltiesToContractors'],
      AnyOther: json['AnyOther'],
      month_id: json['month_id'],
      date: json['Date'],
    );
  }
  Map<String, dynamic> toJson() => {
        "GovtAuthVisits": GovtAuthVisits,
        "NoOfFineByThirdParty": NoOfFineByThirdParty,
        "NoOfShowCauseNoticesByThirdParty": NoOfShowCauseNoticesByThirdParty,
        "NoticesToContractor": NoticesToContractor,
        "id": id,
        "AmountOfPenaltiesToContractors": AmountOfPenaltiesToContractors,
        "AnyOther": AnyOther,
        "month_id": month_id,
      };
}
