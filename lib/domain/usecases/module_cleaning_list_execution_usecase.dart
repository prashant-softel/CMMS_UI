import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';

import '../models/facility_model.dart';

class ModuleCleaningListExecutionUsecase {
  Repository repository;

  ModuleCleaningListExecutionUsecase(this.repository);

    Future<List<MCTaskListModel>> getMCTaskList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
    
  }) async {
    return repository.getMCTaskList(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

    Future<void> startMCExecutionButton({
   
    int? planId,
    bool? isLoading,
  }) async {
    await repository.startMCExecutionButton(
      planId,
      isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
}
