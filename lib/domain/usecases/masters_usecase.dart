import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class MastersUsecase {
  final Repository _repository;

  MastersUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  void clearValue() async => _repository.clearData(LocalKeys.importType);
  void clearStoreUserIdData() async =>
      _repository.clearData(LocalKeys.userDetailId);
  void clearAssetsIdStoreData() async =>
      _repository.clearData(LocalKeys.inventoryId);
  void clearWarrantyValue() async => _repository.clearData(
        LocalKeys.wc_id,
      );
  void clearWarrantyTypeValue() async => _repository.clearData(
        LocalKeys.wc_type,
      );
}
