import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/masters_usecase.dart';

class MastersPresenter {
  MastersPresenter(this.mastersUsecase);
  MastersUsecase mastersUsecase;

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await mastersUsecase.getFacilityList();
  void clearValue() async => mastersUsecase.clearValue();
  void clearStoreUserIdData() async => mastersUsecase.clearStoreUserIdData();
  void clearAssetsIdStoreData() {
    mastersUsecase.clearAssetsIdStoreData();
  }
  void clearWarrantyValue() async => mastersUsecase.clearWarrantyValue();
  void clearWarrantyTypeValue() async => mastersUsecase.clearWarrantyTypeValue();
}
