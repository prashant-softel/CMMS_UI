// ignore: unused_import
import 'package:cmms/domain/models/get_visitandnotice_list_model.dart';
import 'package:cmms/domain/usecases/create_regulataryvisits_usecase.dart';

class CreateRegulataryVisitsPresenter {
  CreateRegulataryVisitsPresenter(this.createregulataryvisitsUsecase);
  CreateRegulataryVisitsUsecase createregulataryvisitsUsecase;

  ///

  Future<Map<String, dynamic>?> createvisitsandnotices(
      {createvisitsandnotices, required bool isLoading}) async {
    return createregulataryvisitsUsecase.createvisitsandnotices(
      createvisitsandnotices: createvisitsandnotices,
      isLoading: isLoading,
    );
  }
  //update getVisitAndNoticelist

//updateVisitAndNoticeDetails
 Future<Map<String, dynamic>?> updateVisitAndNoticeDetails({
    updateVisitAndNoticeDetails,
    required bool isLoading,
  }) async {
    return createregulataryvisitsUsecase.updateVisitAndNoticeDetails(
      updateVisitAndNoticeDetails: updateVisitAndNoticeDetails,
      isLoading: isLoading,
    );
  }

  Future<List<GetVisitAndNoticeList?>?> getVisitsAndNoticesDatalist({int? id, bool? isLoading}) async =>
      await createregulataryvisitsUsecase.getVisitsAndNoticesDatalist(true);
  
    void saveValue({String? visitId}) async {
    return createregulataryvisitsUsecase.saveValue(visitId: visitId);
  }
      Future<String?> getValue() async => await createregulataryvisitsUsecase.getValue();

      void clearValue() async => createregulataryvisitsUsecase.clearValue();
}
