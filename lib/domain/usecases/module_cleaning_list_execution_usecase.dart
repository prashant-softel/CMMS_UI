import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';

import '../models/facility_model.dart';

class ModuleCleaningListExecutionUsecase {
  Repository repository;

  ModuleCleaningListExecutionUsecase(this.repository);

    Future<List<MCTaskListModel>> getMCTaskList({
    required bool isLoading,
    required int? facility_id,
    
  }) async {
    return repository.getMCTaskList(
      isLoading: isLoading,
      facility_id: facility_id,
     
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
}
