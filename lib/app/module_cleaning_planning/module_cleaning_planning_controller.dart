import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/paiyed_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class ModuleCleaningPlanningController extends GetxController {
  ///
  ModuleCleaningPlanningController(
    this.moduleCleaningPlanningPresenter,
  );
  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;

  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  var typeDropdownList = 'Select Gender'.obs;
  var startDateTc = TextEditingController();
  bool openStartDatePicker = false;

  int facilityId = 0;
  Rx<String> selectedBlock = ''.obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  Map<String, TypeModel> typedropdownMapperData = {};

  var type = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "1"),
    TypeModel(name: 'Wet', id: "2"),
  ];
  var days = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Day 1', id: "1"),
    TypeModel(name: 'Day 2', id: "2"),
    TypeModel(name: 'Day 3', id: "3"),
  ];
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  ModuleCleaningPlanningPresenter moduleCleaningPlanningPresenter;
  final HomeController homecontroller = Get.find();

  Future<void> getEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <EquipmentListModel>[];

    final list = await moduleCleaningPlanningPresenter.getEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);
    // print('incidentReportFacilityId$facilityId');
    // print('Incident Report List:$list');
    for (var equipment_list in list) {
      equipmentList.add(equipment_list);
    }

    if (list != null) {
      equipmentList.value = list;

      // }
    }

    update(['equipment_list']);
  }

  ///
  @override
  void onInit() async {
    getFrequencyList();
    Future.delayed(Duration(seconds: 1), () {
      getEquipmentModelList(facilityId, true);
    });

    super.onInit();
  }

  void switchFacility(String? facilityName) {
    facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
  }

  Future<void> getFrequencyList() async {
    final list = await moduleCleaningPlanningPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfInverters", "value": ''},
      {'key': "noOfSMBs", "value": ''},
      {'key': "noOfModules", "value": ''},
      {'key': "type", "value": 'Please Select'},
    ]);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await moduleCleaningPlanningPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }
}
