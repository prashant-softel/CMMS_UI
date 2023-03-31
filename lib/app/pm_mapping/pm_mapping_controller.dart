import 'dart:async';

import 'package:cmms/app/pm_mapping/pm_mapping_presenter.dart';
import 'package:get/get.dart';

import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/pm_mapping_list_model.dart';
import '../../domain/models/preventive_checklist_model.dart';
import '../home/home_controller.dart';

class PmMappingController extends GetxController {
  PmMappingController(
    this.pmMappingPresenter,
  );
  PmMappingPresenter pmMappingPresenter;
  final HomeController homecontroller = Get.find();

  int facilityId = 0;
  int type = 1;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<PmMappingListModel?> mappingList = <PmMappingListModel>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedchecklistIdList = <int>[].obs;
  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  RxList<PreventiveCheckListModel?> selectedChecklistList =
      <PreventiveCheckListModel>[].obs;
  @override
  void onInit() async {
    getInventoryCategoryList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;

      Future.delayed(Duration(seconds: 1), () {
        getPreventiveCheckList(
          facilityId,
          type,
        );
      });
    });
    super.onInit();
  }

  Future<void> getPreventiveCheckList(
    facilityId,
    type,
  ) async {
    final list = await pmMappingPresenter.getPreventiveCheckList(
      facilityId: facilityId,
      type: type,
    );

    if (list != null) {
      for (var _checkList in list) {
        checkList.add(_checkList);
      }
    }
  }

  Future<void> getInventoryCategoryList() async {
    final list = await pmMappingPresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }

  Future<void> getPmMappingList(
    type,
  ) async {
    final list = await pmMappingPresenter.getPmMappingList(
        facilityId: facilityId, isLoading: true);

    if (list != null) {
      // print({"listinh", list});
      mappingList.clear();

      for (var _mappingList in list) {
        mappingList.add(_mappingList);
      }
    }
  }

  void checkListSelected(_selectedCheckList) {
    selectedChecklistList.value =
        _selectedCheckList.cast<PreventiveCheckListModel>();
    selectedchecklistIdList.value = <int>[];
    for (var _selectedChecklist in _selectedCheckList) {
      selectedchecklistIdList.add(_selectedChecklist.id);
    }

    // String lststrWorkTypeIds = selectedChecklistList.join(', ').toString();
    // getToolsRequiredToWorkTypeList(lststrWorkTypeIds);
  }
}
