import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class EscalationMatrixListUsecase {
  final Repository _repository;

  EscalationMatrixListUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

 
  // Future<List<IncidentReportListModel>> getIncidentReportList({
  //   required bool isLoading,
  //   required int? facility_id,
  //   String? start_date,
  //   required String end_date,
  // }) async {
  //   return _repository.getIncidentReportList(
  //     isLoading: isLoading,
  //     facility_id: facility_id,
  //     start_date: start_date,
  //     end_date: end_date,
  //   );
  // }

   
  
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

 
}
