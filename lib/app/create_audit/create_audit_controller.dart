import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/create_audit/create_audit_presenter.dart';
import 'package:cmms/domain/models/create_audit_plan_model.dart';
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
  var planTitleTc = TextEditingController();
  var descriptionTc = TextEditingController();

  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  Rx<String> selectedchecklist = ''.obs;
  Rx<bool> isSelectedchecklist = true.obs;
  Rx<String> selectedchecklistId = "".obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> type = 0.obs;

  @override
  void onInit() async {
    try {
      await setType();

      Future.delayed(Duration(seconds: 1), () {
        getFrequencyList();
      });
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        // Future.delayed(Duration(seconds: 2), () {
        //   getPreventiveCheckList(facilityId, type.value);
        // });
      });
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> setType() async {
    try {
      // Read jobId
      String? _type = await createAuditPresenter.getValue();
      if (_type == null || _type == '' || _type == "null") {
        var dataFromPreviousScreen = Get.arguments;

        type.value = dataFromPreviousScreen['type'];
        print({"typeeee", type.value});
        createAuditPresenter.saveValue(type: type.value.toString());
      } else {
        type.value = int.tryParse(_type) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'type');
      //  Utility.showDialog(e.toString() + 'type');
    }
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
          getPreventiveCheckList(facilityId, type.value, selectedfrequencyId);
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
      facilityId, type, selectedfrequencyId) async {
    final list = await createAuditPresenter.getPreventiveCheckList(
        facilityId: facilityId,
        type: type,
        selectedfrequencyId: selectedfrequencyId,
        isLoading: true);

    if (list != null) {
      checkList.clear();

      for (var _checkList in list) {
        checkList.add(_checkList);
      }
    }
    selectedchecklist.value = checkList[0]?.name.toString() ?? '';
    selectedchecklistId.value = checkList[0]?.id.toString() ?? "";
  }

  Future<bool> createAuditNumber() async {
    // if (checklistNumberCtrlr.text.trim() == '' ||
    //     selectedEquipmentId == 0 ||
    //     selectedfrequencyId == 0) {
    //   Fluttertoast.showToast(
    //       msg: "Please enter required field", fontSize: 16.0);
    // } else {
    String _planTitle = planTitleTc.text.trim();
    String _description = descriptionTc.text.trim();
    String _startDate = startDateDateTc.text.trim();

    CreateAuditPlan createAuditPlan = CreateAuditPlan(
      plan_number: _planTitle,
      Facility_id: facilityId,
      auditee_id: varUserAccessModel.value.user_id,
      auditor_id: facilityId,
      Checklist_id: int.tryParse(selectedchecklistId.value),
      Description: _description,
      Schedule_Date: _startDate,
      ApplyFrequency: selectedfrequencyId,
    );
    var checkAuditJsonString =
        createAuditPlan.toJson(); //createCheckListToJson([createChecklist]);

    print({"checkAuditJsonString", checkAuditJsonString});
    await createAuditPresenter.createAuditNumber(
      checkAuditJsonString: checkAuditJsonString,
      isLoading: true,
    );
    return true;
  }
  //  return true;
  // }
}
