import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/escalation_matrix_list_model.dart';

import '../models/facility_model.dart';

class EscalationMatrixListUsecase {
  final Repository _repository;

  EscalationMatrixListUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

 
  Future<List<EscalationMatListModel>> getEscalationMatrixList({
    required bool isLoading,
  }) async {
    return _repository.getEscalationMatrixList(
      isLoading: isLoading,
    );
  }

   
  
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

 
}
