import 'package:cmms/app/app.dart';
import 'package:cmms/app/calender_view_dashboard/calendar_view_dashboard_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';

// import 'package:cmms/app/preventive_maintanance/preventive.dart';
// import 'package:cmms/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class CalendarViewDashbordController extends GetxController {
  CalendarViewDashbordController(
    this.calendarViewDashbordPresenter,
  );

  final HomeController controller = Get.find();

  CalendarViewDashbordPresenter calendarViewDashbordPresenter;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;

  @override
  void onInit() async {
    // getFacilityList();

    super.onInit();
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await calendarViewDashbordPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> goToCalenderViewScreen() async {
    Get.toNamed(
      Routes.calendarView,
    );
  }
}
