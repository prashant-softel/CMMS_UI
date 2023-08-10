import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import '../models/facility_model.dart';

class AddModuleCleaningExecutionUsecase {
  final Repository _repository;

  AddModuleCleaningExecutionUsecase(this._repository);

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

   Future<List<TypePermitModel?>?> getTypePermitList(
    bool? isLoading,
    int? facility_id
    ) async =>
      await _repository.getTypePermitList(
        isLoading,
        facility_id
        );


  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

   Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await _repository.getFacilityList(true);

  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
}
