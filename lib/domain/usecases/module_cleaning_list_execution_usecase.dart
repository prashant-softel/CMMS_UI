import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';

import '../models/facility_model.dart';

class ModuleCleaningListExecutionUsecase {
  Repository repository;

  ModuleCleaningListExecutionUsecase(this.repository);

  Future<List<MCTaskListModel>> getMCTaskList({
    required bool isLoading,
    bool? isExport,
    required dynamic facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getMCTaskList(
      isLoading: isLoading,
      isExport: isExport,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  Future<Map<String, dynamic>> abandonExecutionButton({
    abandoneJsonString,
    bool? isLoading,
    int? facility_id,
    mcplanId,
    mcexid,
  }) async =>
      await repository.abandonExecutionButton(
        abandoneJsonString,
        isLoading,
        facility_id,
        mcplanId,
        mcexid,
      );

  Future<Map<String, dynamic>> abandonScheduleExecutionButton({
    abandoneJsonString,
    bool? isLoading,
    int? facility_id,
    mcplanId,
    mcexid,
  }) async =>
      await repository.abandonExecutionButton(
        abandoneJsonString,
        isLoading,
        facility_id,
        mcplanId,
        mcexid,
      );

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  void clearValueMcId() async => repository.clearData(LocalKeys.mcid);
  void clearValuePlanId() async => repository.clearData(LocalKeys.planId);
}
