import 'dart:async';

import 'package:cmms/app/pm_schedule/pm_schedule_presenter.dart';
import 'package:cmms/app/state_list_screen/state_list_presenter.dart';
import 'package:cmms/domain/models/set_pm_schedule_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/inventory_category_model.dart';
import '../../domain/models/country_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/save_pm_schedule_model.dart';
import '../../domain/models/state_model.dart';
import '../home/home_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StateListController extends GetxController {
  StateListController(
    this.statelistPresenter,
  );
  StateListPresenter statelistPresenter;
  final HomeController homecontroller = Get.find();
  RxList<CountryModel?> countryList =
      <CountryModel>[].obs;
  RxList<CountryModel?> equipmentCategoryList =
      <CountryModel>[].obs;
  Rx<String> selectedcountry = ''.obs;
  Rx<bool> isSelectedcountry = true.obs;
  int selectedCountryId = 1;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<StateModel?>? stateList =
      <StateModel?>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StateModel? statelistModel;
  RxList<String> stateListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  RxList<String> frequencyListName = <String>[].obs;
  var dayCtrlr = TextEditingController();
  var weeklyCtrlr = TextEditingController();
  @override
  void onInit() async {
    getCountryList();
    getStateList(selectedCountryId);
    Future.delayed(Duration(seconds: 2), () {
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;

        // getPMScheduleData(facilityId, selectedEquipmentId);
      });
    });
    super.onInit();
  }


  Future<void> getCountryList() async {
    final list = await statelistPresenter.getCountryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        countryList.add(_equipmentCategoryList);
      }
      selectedcountry.value = countryList[0]?.name.toString() ?? '';
      selectedCountryId = countryList[0]?.id ?? 0;
    }
  }

  Future<void> getFrequencyList() async {
    final list = await statelistPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyListName.add(_frequencyList!.name ?? '');
      }
      print({"frequencyListName", frequencyListName});
    }
  }

  // Future<void> getInventoryCategoryList() async {
  //   final list = await statelistPresenter.getInventoryCategoryList();
  //
  //   if (list != null) {
  //     for (var _equipmentCategoryList in list) {
  //       equipmentCategoryList.add(_equipmentCategoryList);
  //     }
  //     selectedcountry.value = equipmentCategoryList[0]?.name.toString() ?? '';
  //     selectedCountryId = equipmentCategoryList[0]?.id ?? 0;
  //   }
  // }

  void onValueChanged(dynamic list, dynamic value) {

    switch (list.runtimeType) {
      case RxList<CountryModel>:
        {
          int equipmentIndex =
              countryList.indexWhere((x) => x?.name == value);
          selectedCountryId = countryList[equipmentIndex]?.id ?? 0;
          getStateList(
            selectedCountryId,
          );
          // debugPrint('Selected Value: $value'); // Print the selected value

        }

        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  // Future<void> getPMScheduleData(
  //     int facilityId, int selectedEquipmentId) async {
  //   stateList?.clear();
  //   stateList?.value = <StateModel>[];
  //   final _getPmScheduleList = await statelistPresenter.getPMScheduleData(
  //       facilityId: facilityId,
  //       selectedEquipmentId: selectedEquipmentId,
  //       isLoading: true);
  //
  //   if (_getPmScheduleList != null) {
  //     stateList!.value = _getPmScheduleList.cast<StateModel?>();
  //
  //     paginationController = PaginationController(
  //       rowCount: stateList?.length ?? 0,
  //       rowsPerPage: 10,
  //     );
  //
  //     if (stateList != null && stateList!.isNotEmpty) {
  //       statelistModel = stateList![0];
  //       var getPmScheduleListModelJson = statelistModel!.toJson();
  //       stateListTableColumns.value = <String>[];
  //       for (var key in getPmScheduleListModelJson.keys.toList()) {
  //         stateListTableColumns.add(key);
  //       }
  //     }
  //   }
  // }

  Future<void> getStateList(
       int selectedCountryId) async {
    stateList?.clear();
    stateList?.value = <StateModel>[];
    final _getPmScheduleList = await statelistPresenter.getStateList(
        selectedCountryId: selectedCountryId,
        );

    if (_getPmScheduleList != null) {
      stateList!.value = _getPmScheduleList.cast<StateModel?>();

      paginationController = PaginationController(
        rowCount: stateList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (stateList != null && stateList!.isNotEmpty) {
        statelistModel = stateList![0];
        var getPmScheduleListModelJson = statelistModel!.toJson();
        stateListTableColumns.value = <String>[];
        for (var key in getPmScheduleListModelJson.keys.toList()) {
          stateListTableColumns.add(key);
        }
      }
    }
  }
  // void savePmSchedule() async {
  //   List<AssetScheduleList> assetScheduleList = <AssetScheduleList>[];
  //
  //   stateList?.forEach((element) {
  //     List<FrequencyDatesList> frequencyDatesList = <FrequencyDatesList>[];
  //
  //     element?.frequency_dates?.forEach((e) {
  //       if (e.schedule_date != null) {
  //         frequencyDatesList.add(FrequencyDatesList(
  //             frequency_id: e.frequency_id ?? 0,
  //             schedule_date: e.schedule_date_value_controller!.text));
  //       }
  //     });
  //     assetScheduleList.add(AssetScheduleList(
  //         asset_id: element?.id ?? 0,
  //         frequency_dates: frequencyDatesList));
  //   });
  //
  //   SavePmScheduleModel savePmScheduleModel = SavePmScheduleModel(
  //       facilityId: facilityId, asset_schedules: assetScheduleList);
  //   var pmScheduleJsonString = savePmScheduleModel.toJson();
  //   print({"pmScheduleJsonString", pmScheduleJsonString});
  //   List<dynamic>? responsePmScheduleCreated =
  //       await statelistPresenter.savePmSchedule(
  //     pmScheduleJsonString: pmScheduleJsonString,
  //     isLoading: true,
  //   );
  //   if (responsePmScheduleCreated == []) {
  //     Fluttertoast.showToast(
  //         msg: "PM Schedule Successfully...", fontSize: 16.0);
  //   }
  // }
}
