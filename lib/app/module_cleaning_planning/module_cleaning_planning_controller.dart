import 'dart:async';

import 'package:cmms/app/create_pm_plan/create_pm_plan_presenter.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/create_pm_plan_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_pm_plan_detail_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../home/home_controller.dart';

class ModuleCleaningPlanningController extends GetxController {
  ///
  ModuleCleaningPlanningController(
    this.moduleCleaningPlanningPresenter,
  );
  ModuleCleaningPlanningPresenter moduleCleaningPlanningPresenter;
  final HomeController homecontroller = Get.find();

  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;

  var selectedOption = ''.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;
  var days = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Day 1', id: "1"),
    TypeModel(name: 'Day 2', id: "2"),
    TypeModel(name: 'Day 3', id: "3"),
  ];
  Map<String, TypeModel> typedropdownMapperData = {};

  var type = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "1"),
    TypeModel(name: 'Wet', id: "2"),
  ];
  // var days = <TypeModel>[
  //   TypeModel(name: "Please Select", id: "0"),
  //   TypeModel(name: 'Day 1', id: "1"),
  //   TypeModel(name: 'Day 2', id: "2"),
  //   TypeModel(name: 'Day 3', id: "3"),
  // ];
  void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfInverters", "value": ''},
      {'key': "noOfSMBs", "value": ''},
      {'key': "noOfModules", "value": ''},
      {'key': "type", "value": 'Please Select'},
    ]);
  }

  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;

        Future.delayed(Duration(seconds: 1), () {
          getFrequencyList();
        });

        Future.delayed(Duration(seconds: 1), () {
          getEquipmentModelList(facilityId, true);
        });
      });
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

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

  Future<void> getFrequencyList() async {
    final list =
        await moduleCleaningPlanningPresenter.getFrequencyList(isLoading: true);

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
          selectedfrequency.value = value;
        }
        break;

      default:
        {}
        break;
    }
  }
}
