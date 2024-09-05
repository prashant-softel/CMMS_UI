import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';

class MrsListUsecase {
  final Repository _repository;

  MrsListUsecase(this._repository);
  Future<List<MrsListModel?>?> getMrsList(
          {int? facilityId,
          bool? isLoading,
          bool? isExport,
          dynamic endDate,
          dynamic startDate}) async =>
      await _repository.getMrsList(
          facilityId, isLoading, startDate, endDate, isExport);
  void clearValue() async => _repository.clearData(LocalKeys.mrsId);
  void clearpmTaskValue() async => _repository.clearData(LocalKeys.pmTaskModel);
  void clearStoreTaskData() async => _repository.clearData(LocalKeys.pmTaskId);
  void clearStoreTaskActivityData() async =>
      _repository.clearData(LocalKeys.activity);
  void clearStoreTaskfromActorData() async =>
      _repository.clearData(LocalKeys.fromActorTypeId);
  void clearStoreTasktoActorData() async =>
      _repository.clearData(LocalKeys.toactortypeid);
  void clearStoreTaskWhereUsedData() async =>
      _repository.clearData(LocalKeys.whereUsed);
  void clearStoreDataJobId() async => _repository.clearData(LocalKeys.jobId);
  void clearPermitStoreData() async =>
      _repository.clearData(LocalKeys.permitId);
  void clearJobIdStoreData() async => _repository.clearData(LocalKeys.jobId);
  void clearTypeValue() async => _repository.clearData(LocalKeys.types);
}
