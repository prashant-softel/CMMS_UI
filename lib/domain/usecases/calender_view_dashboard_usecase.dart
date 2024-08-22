import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class CalendarViewDashbordUsecase {
  final Repository _repository;

  CalendarViewDashbordUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  void clearValue() async => _repository.clearData(LocalKeys.importType);
  void clearStoreUserIdData() async =>
      _repository.clearData(LocalKeys.userDetailId);
}
