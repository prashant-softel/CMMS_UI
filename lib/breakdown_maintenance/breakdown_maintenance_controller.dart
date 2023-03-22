import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:cmms/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/inventory_category_model.dart';

class BreakdownMaintenanceController extends GetxController {
 BreakdownMaintenanceController(
    this.breakdownMaintenancePresenter,
  );

  BreakdownMaintenancePresenter breakdownMaintenancePresenter;
  // PreventivePresenter preventivePresenter;



  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;

    @override
  void onInit() async {
    //homePresenter.generateToken();
    //  Future.delayed(Duration(seconds: 1), () {
     getFacilityList();
    //});

    super.onInit();
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await breakdownMaintenancePresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  // void switchFacility(String? facilityName) {
  //   facilityId =
  //       facilityList.indexWhere((facility) => facility?.name == facilityName);
  //   getJobList(facilityId, userId);
  // }
   Future<void> createChecklist() async {
    Get.toNamed(
      Routes.jobList,
      
    );
    
  }

  Future<void> createNewPermit() async{
    Get.toNamed(
      Routes.new_permit,
      
    );
  }
   
}
