import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/preventive_checklist_model.dart';

class PreventiveCheckPointUsecase {
  PreventiveCheckPointUsecase(this.repository);
  Repository repository;
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPreventiveCheckList(
        type: type,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<bool> createCheckpoint({
    checkpointJsonString,
    bool? isLoading,
  }) async =>
      await repository.createCheckpoint(
          isLoading: isLoading, checkpointJsonString: checkpointJsonString);
  getCheckPointlist(
          {int? selectedchecklistId,
          bool? isLoading,
          int? facilityId,
          bool? isExport,int?type}) async =>
      await repository.getCheckPointlist(
          selectedchecklistId, isLoading, facilityId, isExport,type);

  deleteCkeckpoint(
          {required Object check_point_id, required bool isLoading}) async =>
      await repository.deleteCkeckpoint(
        check_point_id,
        isLoading,
      );
  Future<bool> updateCheckPoint({
    checkpointJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateCheckPoint(
          isLoading: isLoading, checkpointJsonString: checkpointJsonString);
  void saveValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.type);
}
