


import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/usecases/view_module_cleaning_execution_usecase.dart';

class ViewModuleCleaningExecutionPresenter {
  ViewModuleCleaningExecutionPresenter(this.viewModuleCleaningExecutionUsecase);
  ViewModuleCleaningExecutionUsecase viewModuleCleaningExecutionUsecase;

 

  Future<List<HistoryModel>?> getMCExecutionHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewModuleCleaningExecutionUsecase.getMCExecutionHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );

   Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,  
    required int executionId,
  }) async {
      return viewModuleCleaningExecutionUsecase.getMCExecutionDetail(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );
  }

 
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await addModuleCleaningExecutionUsecase.getFacilityList();

  ///
}
