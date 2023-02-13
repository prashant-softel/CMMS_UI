import 'package:cmms/app/facility/facility_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class FacilityController extends GetxController {
  FacilityController(this.facilityPresenter);
  FacilityPresenter facilityPresenter;

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

  ///
  @override
  void onInit() {
    getFacilityList();

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await facilityPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      update();
    }
  }

  void switchFacility(Object? facility) {
    print(facility);
  }

  ///
}
