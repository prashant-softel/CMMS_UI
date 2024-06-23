import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/facility_model.dart';

class AdminDashboardUsecase {
  final Repository _repository;

  AdminDashboardUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList(isLoading) async =>
      await _repository.getFacilityListByUserId(isLoading);
      void clearDateValue() async => _repository.clearData(LocalKeys.date);
}
