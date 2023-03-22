import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:cmms/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/new_permit/new_permit_presenter.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/inventory_category_model.dart';

class NewPermitController extends GetxController {
 NewPermitController(
    this.newPermitPresenter,
  );

  NewPermitPresenter newPermitPresenter;
  // PreventivePresenter preventivePresenter;


  int selectedFacilityId = 0;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = false.obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;
  var breakdownTimeCtrlr = TextEditingController();
  var validTillTimeCtrlr = TextEditingController();

  var jobDescriptionCtrlr = TextEditingController();

  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;



    @override
  void onInit() async {
    //homePresenter.generateToken();
    //  Future.delayed(Duration(seconds: 1), () {
     getFacilityList();
    //});

    super.onInit();
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await newPermitPresenter.getFacilityList();

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
   void onValueChanged(dynamic list, dynamic value) {
     
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
          if (selectedFacilityId != 0) {
            isFacilitySelected.value = true;
          }
          selectedFacility.value = value;
        }
    Future<void> createNewPermit() async {
    Get.toNamed(
      Routes.new_permit,
      
    );
    
  }
    
}
