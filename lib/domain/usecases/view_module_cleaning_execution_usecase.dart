import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class ViewModuleCleaningExecutionUsecase {
  final Repository _repository;

  ViewModuleCleaningExecutionUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

   
  //   Future<Map<String, dynamic>> createEscalationMatrix({
  //   createEscalationMatrix,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.createEscalationMatrix(
  //       createEscalationMatrix,
  //       isLoading,
  //     );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

   Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await _repository.getFacilityList(true);

  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
}
