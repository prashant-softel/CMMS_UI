import 'package:cmms/domain/models/get_visitandnotice_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateRegulataryVisitsUsecase {
  CreateRegulataryVisitsUsecase(this.repository);
  Repository repository;

  Future<Map<String, dynamic>> createvisitsandnotices({
    createvisitsandnotices,
    bool? isLoading,
  }) async =>
      await repository.createvisitsandnotices(
        createvisitsandnotices,
        isLoading,
      );

  // update Api getVisitAndNoticelist

  Future<Map<String, dynamic>> updateVisitAndNoticeDetails({
    updateRegularVisit,
    bool? isLoading,
  }) async =>
      await repository.updateVisitAndNoticeDetails(
        updateRegularVisit,
        isLoading,
      );
  Future<List<GetVisitAndNoticeList?>?> getVisitsAndNoticesDatalist(
          isLoading) async =>
      await repository.getVisitsAndNoticesDatalist(isLoading: isLoading);
  void saveValue({String? visitId}) async =>
      repository.saveValue(LocalKeys.visitId, visitId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.visitId);

  void clearValue() async => repository.clearData(LocalKeys.healthId);
}
