import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/create_audit/create_audit_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/audit_plan_detail_model.dart';
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
  Rx<int> auditId = 0.obs;
  Rx<AuditPlanDetailModel?> auditPlanDetailModel = AuditPlanDetailModel().obs;
  @override
  void onInit() async {
    try {
      await setType();

      Future.delayed(Duration(seconds: 1), () {
        getFrequencyList();
      });
      facilityIdStreamSubscription =
          homecontroller.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          if (auditId != 0) {
            await getAuditPlanDetails(
                auditPlanId: auditId.value,
                isloading: true,
                facilityId: facilityId);
            // getHistory(facilityId);
          }
        }
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

      String _auditId = await createAuditPresenter.getAuditdValue();
      if (_auditId == null || _auditId == '' || _auditId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        type.value = dataFromPreviousScreen['type'];
        auditId.value = dataFromPreviousScreen['auditId'];
        print({"typeeee", auditId.value});
        createAuditPresenter.saveValue(type: type.value.toString());
      } else {
        type.value = int.tryParse(_type) ?? 0;
        auditId.value = int.tryParse(_auditId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'type');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }

  Future<void> getAuditPlanDetails(
      {int? auditPlanId, bool? isloading, required int facilityId}) async {
    final _auditPlanDetailsModel =
        await createAuditPresenter.getAuditPlanDetails(
            auditPlanId: auditPlanId,
            isLoading: isloading,
            facilityId: facilityId);

    if (_auditPlanDetailsModel != null) {
      descriptionTc.text = _auditPlanDetailsModel.description ?? "";
      startDateDateTc.text = _auditPlanDetailsModel.schedule_Date ?? "";
      planTitleTc.text = _auditPlanDetailsModel.plan_number ?? "";
      // selectedfrequency.value = _auditPlanDetailsModel.frequency ?? "";
      selectedfrequencyId = _auditPlanDetailsModel.frequency ?? 0;
      if (selectedfrequencyId > 0) {
        getPreventiveCheckList(facilityId, type, selectedfrequencyId); //
        selectedchecklist.value = _auditPlanDetailsModel.checklist_name ?? "";
        selectedchecklistId.value =
            _auditPlanDetailsModel.checklist_id.toString() ?? "";
      }
      //  auditPlanDetailModel.value = _auditPlanDetailsModel;
    }
    print({"auditPlandetailss", auditPlanDetailModel.value?.id});
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
          if (value != "Please Select") {
            int frequencyIndex =
                frequencyList.indexWhere((x) => x?.name == value);
            selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
            selectedfrequency.value = value;
            getPreventiveCheckList(facilityId, type.value, selectedfrequencyId);
          } else {
            selectedfrequencyId = 0;
          }
        }
        break;
      case RxList<PreventiveCheckListModel>:
        {
          if (value != "Please Select") {
            int checklistIndex = checkList.indexWhere((x) => x?.name == value);
            selectedchecklistId.value =
                checkList[checklistIndex]?.id.toString() ?? "";
          } else {
            //  selectedchecklistId=0;
          }
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
      id: 0,
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

  Future<void> updateAuditNumber() async {
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
      id: auditId.value,
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

    print({"updateAuditNumber", checkAuditJsonString});
    Map<String, dynamic>? responseCreatePmPlan =
        await createAuditPresenter.updateAuditNumber(
      checkAuditJsonString: checkAuditJsonString,
      isLoading: true,
    );
    if (responseCreatePmPlan == null) {
    } else {
      Get.offAllNamed(
        Routes.auditListScreen,
      );
    }
  }
}
