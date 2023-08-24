
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/add_module_cleaning_execution_usecase.dart';

import '../../domain/models/facility_model.dart';

class AddModuleCleaningExecutionPresenter {
  AddModuleCleaningExecutionPresenter(this.addModuleCleaningExecutionUsecase);
  AddModuleCleaningExecutionUsecase addModuleCleaningExecutionUsecase;

 

  Future<void> startMCExecutionButton({
    int? planId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.startMCExecutionButton(
        planId: planId,
        isLoading: isLoading ?? false,
      );

  Future<void> startMCExecutionScheduleButton({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.startMCExecutionScheduleButton(
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );

   Future<List<TypePermitModel?>?> getTypePermitList(
    {required int facility_id}
   ) async =>
      await addModuleCleaningExecutionUsecase.getTypePermitList(
        true,
        facility_id
        );

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.getInventoryCategoryList(
      );

   Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,  
    required int executionId,
  }) async {
      return addModuleCleaningExecutionUsecase.getMCExecutionDetail(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );
  }


  Future<Map<String, dynamic>?> endMCExecutionButton({
   endJsonString,
  required bool isLoading,
    
  }) async {
     return addModuleCleaningExecutionUsecase.endMCExecutionButton(
        endJsonString: endJsonString,
      isLoading: isLoading,
      );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await addModuleCleaningExecutionUsecase.getFacilityList();

  ///
}
