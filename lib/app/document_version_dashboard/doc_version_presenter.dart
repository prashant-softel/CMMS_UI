import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/docVersion_dashboard_usecase.dart';

class DocVersionPresenter {
  DocVersionPresenter(this.docVersionUsecase);
  DocVersionUsecase docVersionUsecase;

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await docVersionUsecase.getFacilityList();
  void clearValue() async => docVersionUsecase.clearValue();
  void clearStoreUserIdData() async => docVersionUsecase.clearStoreUserIdData();
}
