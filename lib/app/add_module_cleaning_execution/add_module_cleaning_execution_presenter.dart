
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

   Future<List<TypePermitModel?>?> getTypePermitList(
    {required int facility_id}
   ) async =>
      await addModuleCleaningExecutionUsecase.getTypePermitList(
        true,
        facility_id
        );


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
