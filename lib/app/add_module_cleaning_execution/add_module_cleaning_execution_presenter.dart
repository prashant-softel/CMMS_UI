
import 'package:cmms/domain/usecases/add_module_cleaning_execution_usecase.dart';

import '../../domain/models/facility_model.dart';

class AddModuleCleaningExecutionPresenter {
  AddModuleCleaningExecutionPresenter(this.addModuleCleaningExecutionUsecase);
  AddModuleCleaningExecutionUsecase addModuleCleaningExecutionUsecase;

 

  //  Future<Map<String, dynamic>?> createEscalationMatrix({
  //   createEscalationMatrix,
  //   required bool isLoading,
  // }) async {
  //   return addModuleCleaningExecutionUsecase.createEscalationMatrix(
  //     createEscalationMatrix: createEscalationMatrix,
  //     isLoading: isLoading,
  //   );
  // }
 
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await addModuleCleaningExecutionUsecase.getFacilityList();

  ///
}
