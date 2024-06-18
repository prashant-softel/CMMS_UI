import 'dart:async';
import 'package:cmms/app/create_observation/create_observation_presenter.dart';
import 'package:cmms/domain/models/Compliance_Status_model.dart';
import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/createStatutory_model.dart';
import 'package:cmms/domain/models/create_obs_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../home/home_controller.dart';

class CreateObservationController extends GetxController {
  ///
  CreateObservationController(
    this.createObservationPresenter,
  );
  CreateObservationPresenter createObservationPresenter;

  final HomeController homeController = Get.find();
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  StreamSubscription<int>? facilityIdStreamSubscription;
  Stream<int> get facilityId$ => _facilityId.stream;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  bool openObsDatePicker = false;
  bool openTargetObsDatePicker = false;
  var obsDateTc = TextEditingController();
  var targetDateTc = TextEditingController();
  var contractorNameCtrlr = TextEditingController();
  var correctivePreventiveCtrlr = TextEditingController();
  var responsiblePersonCtrlr = TextEditingController();
  var contactNumberCtrlr = TextEditingController();
  var costTypeCtrlr = TextEditingController();
  var locationOfObservationCtrlr = TextEditingController();
  var discriptionCtrlr = TextEditingController();
  RxList<IncidentRiskTypeModell> incidentrisktypeList =
      <IncidentRiskTypeModell>[].obs;
  Rx<bool> isRiskTypeListSelected = true.obs;
  Rx<String> selectedRiskTypeList = ''.obs;
  int selectedRiskTypeId = 0;
  int incidenttypeId = 0;

  RxList<MonthModel> month = <MonthModel>[
    MonthModel(name: 'Jan', id: "1"),
    MonthModel(name: 'Feb', id: "2"),
    MonthModel(name: 'March', id: "3"),
    MonthModel(name: 'April', id: "4"),
    MonthModel(name: 'May', id: "5"),
    MonthModel(name: 'June', id: "6"),
    MonthModel(name: 'July', id: "7"),
    MonthModel(name: 'Aug', id: "8"),
    MonthModel(name: 'Sept', id: "9"),
    MonthModel(name: 'Oct', id: "10"),
    MonthModel(name: 'Nov', id: "11"),
    MonthModel(name: 'Dec', id: "12"),
  ].obs;
  RxList<MonthModel> typeOfObservation = <MonthModel>[
    MonthModel(name: 'Unsafe Act', id: "1"),
    MonthModel(name: 'Unsafe Condition', id: "2"),
    MonthModel(name: 'Statutory Non Compliance', id: "3"),
  ].obs;
  RxList<MonthModel> sourceOfObservation = <MonthModel>[
    MonthModel(name: 'Site Inspection ', id: "1"),
    MonthModel(name: 'Monitoring Checklist of Electrical ', id: "2"),
    MonthModel(name: 'Vehicle fitness Checklist ', id: "3"),
  ].obs;
  RxList<MonthModel> riskType = <MonthModel>[
    MonthModel(name: 'Major ', id: "1"),
    MonthModel(name: 'Significant ', id: "2"),
    MonthModel(name: 'Moderate ', id: "3"),
  ].obs;
  RxList<MonthModel> costType = <MonthModel>[
    MonthModel(name: 'Capex ', id: "1"),
    MonthModel(name: 'Opex ', id: "2"),
  ].obs;

  Rx<bool> isLoading = true.obs;
  int facilityId = 0;
  Rx<int> obsId = 0.obs;
  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 1), () {
          getFacilityList();
        });
        Future.delayed(Duration(seconds: 1), () {
          getIncidentRiskType(facilityId);
        });
      });
      if (obsId.value != 0) {
        Future.delayed(Duration(seconds: 1), () {
          // getObsDetail(id: obsId.value);
          getObsHistory(id: obsId.value);
        });
      }
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _obsId = await createObservationPresenter.getValue();

      if (_obsId == null || _obsId == '' || _obsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        obsId.value = dataFromPreviousScreen['obsId'];

        createObservationPresenter.saveValue(obsId: obsId.value.toString());
      } else {
        obsId.value = int.tryParse(_obsId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'obsId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  // Future<void> getObsDetail({required int id}) async {
  //   final _getObsDetail = await createObservationPresenter.getObsDetail(id: id);

  //   if (_getObsDetail != null) {
  //     // getObsById.value = _getObsDetail;

  //     // issueDateTc.text = getObsById.value?.created_at ?? '';
  //     // expireOnDateTc.text = getObsById.value?.end_date ?? "";
  //     // commentsCtrl.text = getObsById.value?.description ?? "";
  //   }
  // }

  Future<void> getObsHistory({required int id}) async {
    int moduleType = 406;

    historyList?.value = await createObservationPresenter.getHistory(
          moduleType,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getFacilityList() async {
    final _facilityList = await createObservationPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  void createObs(int? position) async {
    try {
      // checkObs();
      // if (isFormInvalid.value) {
      //   return;
      // }
      String _contractorNameCtrlr = contractorNameCtrlr.text.trim();
      String _correctivePreventiveCtrlr = correctivePreventiveCtrlr.text.trim();
      String _responsiblePersonCtrlr = responsiblePersonCtrlr.text.trim();
      String _contactNumberCtrlr = contactNumberCtrlr.text.trim();
      String _costTypeCtrlr = costTypeCtrlr.text.trim();
      String _obsDateTc = obsDateTc.text.trim();
      String _discriptionCtrlr = discriptionCtrlr.text.trim();

      String _locationOfObservationCtrlr =
          locationOfObservationCtrlr.text.trim();
      String _targetDateTc = targetDateTc.text.trim();

      CreateObsModel createObsModel = CreateObsModel(
        facility_id: facilityId,
        contact_number: _contactNumberCtrlr,
        contractor_name: _contractorNameCtrlr,
        cost_type: _costTypeCtrlr,
        date_of_observation: _obsDateTc,
        location_of_observation: _locationOfObservationCtrlr,
        observation_description: _discriptionCtrlr,
        preventive_action: _correctivePreventiveCtrlr,
        responsible_person: _responsiblePersonCtrlr,
        risk_type_id: 1,
        source_of_observation: "madhuban",
        target_date: _targetDateTc,
        type_of_observation: "",
        uploadfileIds: [101, 202],
      );

      // Convert the CreateObsModel instance to JSON
      var createObsModelJsonString = createObsModel.toJson();

      // Call the createObs function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responseCreateObsModel =
          await createObservationPresenter.createObs(
        createObs: createObsModelJsonString,
        isLoading: true,
        position: position,
      );

      // Handle the response
      if (responseCreateObsModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create  create Obseravtion  data: $createObsModelJsonString');
    } catch (e) {
      print(e);
    }
  }

  // void updateCompliance(int? postion) async {
  //   try {
  //     checkObs();
  //     if (isFormInvalid.value) {
  //       return;
  //     }
  //     String _obsDateTc = issueDateTc.text.trim();
  //     String _targetDateTc = expireOnDateTc.text.trim();
  //     String _commentsCtrl = commentsCtrl.text.trim();

  //     CreateObsModel createObsModel = CreateObsModel(
  //         facility_id: facilityId,
  //         Comment: _commentsCtrl,
  //         compliance_id: selectedStatutoryComplianceId,
  //         issue_date: _obsDateTc,
  //         expires_on: _targetDateTc,
  //         renewFlag: 0,
  //         renew_date: "",
  //         status_of_aplication_id: incidenttypeId);

  //     // Convert the CreateObsModel instance to JSON
  //     var createObsModelJsonString = createObsModel.toJson();

  //     // Call the createObs function from stockManagementAddGoodsOrdersPresenter
  //     Map<String, dynamic>? responseCreateObsModel =
  //         await createObservationPresenter.createObs(
  //       createObs: createObsModelJsonString,
  //       isLoading: true,
  //     );

  //     // Handle the response
  //     if (responseCreateObsModel == null) {
  //       // CreateNewPermitDialog();
  //       // showAlertDialog();
  //     }
  //     print(
  //         'Create  create Compliance  data: $createObsModelJsonString');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void checkObs() {
  //   if (selectedStatutoryCompliance.value == '') {
  //     isStatutoryComplianceSelected.value = false;
  //     isFormInvalid.value = true;
  //   }
  //   if (selectedRiskTypeList.value == '') {
  //     isRiskTypeListSelected.value = false;
  //     isFormInvalid.value = true;
  //   }
  //   if (issueDateTc.text.trim().length < 3) {
  //     isIssueDateInvalid.value = true;
  //     isFormInvalid.value = true;
  //   }

  //   if (expireOnDateTc.text.trim().length < 3) {
  //     isExpiresonInvalid.value = true;
  //     isFormInvalid.value = true;
  //   }
  // }

  void clearStoreData() {
    // createObservationPresenter.clearValue();
    // createObservationPresenter.clearRenewValue();
  }

  Future<void> getIncidentRiskType(int facilityId) async {
    incidentrisktypeList.value = <IncidentRiskTypeModell>[];
    final _irisktypeList = await createObservationPresenter.getIncidentRiskType(
      facilityId: facilityId,
      isLoading: true,
    );
    for (var facilityType_list in _irisktypeList) {
      incidentrisktypeList.add(facilityType_list);
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print("$value");
    switch (list.runtimeType) {
      case RxList<IncidentRiskTypeModell>:
        {
          if (value != "Please Select") {
            int statusIndex =
                incidentrisktypeList.indexWhere((x) => x?.name == value);
            incidenttypeId = incidentrisktypeList[statusIndex]?.id ?? 0;
            selectedRiskTypeList.value = value;
            isRiskTypeListSelected.value = true;
            print(
                "selectedBusinessTypeId: ${incidenttypeId} \n ${selectedRiskTypeList}");
          } else {
            incidenttypeId = 0;
          }
        }
        break;
    }
  }
}
