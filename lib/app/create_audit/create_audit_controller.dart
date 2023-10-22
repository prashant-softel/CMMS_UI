import 'dart:async';

import 'package:cmms/app/create_audit/create_audit_presenter.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateAuditController extends GetxController {
  ///
  CreateAuditController(
    this.createAuditPresenter,
  );
  CreateAuditPresenter createAuditPresenter;
  final HomeController homecontroller = Get.find();
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;
  bool openStartDatePicker = false;
  var startDateDateTc = TextEditingController();
  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  Rx<String> selectedchecklist = ''.obs;
  Rx<bool> isSelectedchecklist = true.obs;
  Rx<String> selectedchecklistId = "".obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  @override
  void onInit() async {
    try {
      Future.delayed(Duration(seconds: 1), () {
        getFrequencyList();
      });
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 2), () {
          getPreventiveCheckList(facilityId, 2);
        });
      });
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> getFrequencyList() async {
    final list = await createAuditPresenter.getFrequencyList(isLoading: true);

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
      case RxList<PreventiveCheckListModel>:
        {
          int checklistIndex = checkList.indexWhere((x) => x?.name == value);
          selectedchecklistId.value =
              checkList[checklistIndex]?.id.toString() ?? "";
        }

        break;

      default:
        {}
        break;
    }

    // print({"selectedfrequency": selectedfrequency});
  }

  Future<void> getPreventiveCheckList(
    facilityId,
    type,
  ) async {
    final list = await createAuditPresenter.getPreventiveCheckList(
        facilityId: facilityId, type: type, isLoading: true);

    if (list != null) {
      checkList.clear();

      for (var _checkList in list) {
        checkList.add(_checkList);
      }
    }
    selectedchecklist.value = checkList[0]?.name.toString() ?? '';
    selectedchecklistId.value = checkList[0]?.id.toString() ?? "";
  }
}
