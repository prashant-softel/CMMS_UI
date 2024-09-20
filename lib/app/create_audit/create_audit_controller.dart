import 'dart:async';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/create_audit/create_audit_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/audit_plan_detail_model.dart';
import 'package:cmms/domain/models/create_audit_plan_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
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
  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;

  Rx<bool> isScheduleDateInvalid = false.obs;

  Rx<String> selectedchecklistId = "".obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> type = 0.obs;
  Rx<int> auditId = 0.obs;
  var isToggleOn = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  int selectedAssignedToId = 0;
  Map<dynamic, dynamic> employee_map = {};
  RxList<EmployeeModel?> employeeNameList = <EmployeeModel>[].obs;

  RxList<EmployeeModel?> filteredEmployeeNameList = <EmployeeModel>[].obs;
  RxList<int> selectedEmployeeNameIdList = <int>[].obs;
  RxList<String> selectedEmployeeNameList = <String>[].obs;

  Rx<AuditPlanDetailModel?> auditPlanDetailModel = AuditPlanDetailModel().obs;
  @override
  void onInit() async {
    try {
      await setType();

      facilityIdStreamSubscription =
          homecontroller.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          if (auditId > 0) {
            await getAuditPlanDetails(
                auditPlanId: auditId.value,
                isloading: true,
                facilityId: facilityId);
            // getHistory(facilityId);
          }
          Future.delayed(Duration(seconds: 1), () {
            getFrequencyList();
          });
          Future.delayed(Duration(seconds: 1), () {
            getAssignedToList();
            getEmployeePermitList();
          });
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
      if (_auditId == '' || _auditId == "null") {
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

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList = await createAuditPresenter.getAssignedToEmployee(
      facilityId: facilityId,
      featureId: UserAccessConstants.kAuditPlanFeatureId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
      // selectedAssignedTo.value =
      //     getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
    }
  }

  Future<void> getEmployeePermitList() async {
    employeeNameList.value = <EmployeeModel>[];
    final _employeeNameList = await createAuditPresenter.getEmployeePermitList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    for (var employee_list in _employeeNameList!) {
      employeeNameList.add(employee_list);
    }
    // supplierNameList = _supplierNameList;

    update(['permit_employee_list']);
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
      selectedfrequency.value = _auditPlanDetailsModel.frequency_name ?? "";
      selectedfrequencyId = _auditPlanDetailsModel.frequency ?? 0;
      selectedAssignedTo.value = _auditPlanDetailsModel.assignedTo ?? "";
      isToggleOn.value = _auditPlanDetailsModel.is_PTW == "True" ? true : false;
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
      case const (RxList<FrequencyModel>):
        {
          if (value != "Please Select") {
            int frequencyIndex =
                frequencyList.indexWhere((x) => x?.name == value);
            selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
            selectedfrequency.value = value;
            isSelectedfrequency.value = true;
            getPreventiveCheckList(facilityId, type.value, selectedfrequencyId);
          } else {
            selectedfrequencyId = 0;
          }
        }
        break;
      case const (RxList<PreventiveCheckListModel>):
        {
          if (value != "Please Select") {
            int checklistIndex = checkList.indexWhere((x) => x?.name == value);
            selectedchecklistId.value =
                checkList[checklistIndex]?.id.toString() ?? "";
            isSelectedchecklist.value = true;
          } else {
            //  selectedchecklistId=0;
          }
        }

        break;
      case const (RxList<EmployeeModel>):
        {
          if (value != "Please Select") {
            int assignedToIndex =
                assignedToList.indexWhere((x) => x?.name == value);
            selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
            if (selectedAssignedToId > 0) {
              isAssignedToSelected.value = true;
            }
            selectedAssignedTo.value = value;
          } else {
            selectedAssignedToId = 0;
          }
        }
        break;
      default:
        {}
        break;
    }

    // print({"selectedfrequency": selectedfrequency});
  }

  void employeeNameSelected(_selectedEmployeeNameIds) {
    selectedEmployeeNameIdList.value = <int>[];
    filteredEmployeeNameList.value = <EmployeeModel>[];
    late int emp_id = 0; //late int emp_id = 0;

    for (var _selectedEmployeeNameId in _selectedEmployeeNameIds) {
      selectedEmployeeNameIdList.add(_selectedEmployeeNameId);
      EmployeeModel? e = employeeNameList.firstWhere((element) {
        return element?.id == _selectedEmployeeNameId;
      });
      filteredEmployeeNameList.add(e);
    }

    // Populate the single list with category labels and names
    filteredEmployeeNameList.forEach((e) {
      selectedEmployeeNameList.add(e?.name ?? "");
      // categorizedNames.addAll(e!.name);
    });
    print("selectedEmployeeNameList1232,$selectedEmployeeNameList");
    employee_map[emp_id] = selectedEmployeeNameIdList;
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

    // checkFormAduit();
    // if (isFormInvalid.value) {
    //   return true;
    // }
    String _planTitle = planTitleTc.text.trim();
    String _description = descriptionTc.text.trim();
    String _startDate = startDateDateTc.text.trim();

    CreateAuditPlan createAuditPlan = CreateAuditPlan(
      id: 0,
      plan_number: _planTitle,
      Facility_id: facilityId,
      auditee_id: varUserAccessModel.value.user_id,
      auditor_id: facilityId,
      assignedTo: selectedAssignedTo.value,
      Employees: selectedEmployeeNameList.value,
      Checklist_id: int.tryParse(selectedchecklistId.value),
      Description: _description,
      Schedule_Date: _startDate,
      isPTW: isToggleOn.value,
      Module_Type_id: type.value,
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

    checkFormAduit();
    if (isFormInvalid.value) {
      return;
    }
    String _planTitle = planTitleTc.text.trim();
    String _description = descriptionTc.text.trim();
    String _startDate = startDateDateTc.text.trim();

    CreateAuditPlan createAuditPlan = CreateAuditPlan(
      id: auditId.value,
      plan_number: _planTitle,
      Facility_id: facilityId,
      auditee_id: varUserAccessModel.value.user_id,
      auditor_id: facilityId,
      assignedTo: selectedAssignedTo.value,
      Employees: selectedEmployeeNameList.value,
      Checklist_id: int.tryParse(selectedchecklistId.value),
      Description: _description,
      Schedule_Date: _startDate,
      isPTW: isToggleOn.value,
      Module_Type_id: type.value,
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

  void checkFormAduit() {
    // if (planTitleTc.text.trim().length == 0) {
    //   isTitleInvalid.value = true;
    //   isFormInvalid.value = true;
    // }
    // if (selectedfrequency == '') {
    //   isSelectedfrequency.value = false;
    //   isFormInvalid.value = true;
    // }
    // if (selectedchecklist == '') {
    //   isSelectedchecklist.value = false;
    //   isFormInvalid.value = true;
    // }
    // if (startDateDateTc.text.trim().length == 0) {
    //   isScheduleDateInvalid.value = true;
    //   isFormInvalid.value = true;
    // }
    // if (descriptionTc.text.trim().length == 0) {
    //   isDescriptionInvalid.value = true;
    //   isFormInvalid.value = true;
    // }
    // if (selectedAssignedTo == '') {
    //   isAssignedToSelected.value = false;
    //   isFormInvalid.value = true;
    // }
  }
}
