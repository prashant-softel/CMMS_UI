import 'dart:async';
import 'package:cmms/app/create_observation/create_observation_presenter.dart';
import 'package:cmms/domain/models/create_obs_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:cmms/domain/models/type_of_obs_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../home/home_controller.dart';

class CreateObservationController extends GetxController {
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
  Rx<bool> isTypeOfObsListSelected = true.obs;
  Rx<bool> isSourceOfObsListSelected = true.obs;
  Rx<String> selectedRiskTypeList = ''.obs;
  int selectedRiskTypeId = 0;
  int incidenttypeId = 0;
  int typeOfObsId = 0;
  RxList<TypeOfObsListModel?> typeOfObsList = <TypeOfObsListModel>[].obs;
  Rx<String> selectedTypeOfObs = ''.obs;
  Rx<bool> isSelectedTypeOfObs = true.obs;
  int sourceOfObsId = 0;
  RxList<SourceOfObservationListModel?> sourceOfObsList =
      <SourceOfObservationListModel>[].obs;
  Rx<String> selectedSourceOfObs = ''.obs;
  Rx<bool> isSelectedSourceOfObs = true.obs;
  RxBool isFormInvalid = false.obs;
  Rx<bool> isObsDateTcInvalid = false.obs;
  Rx<bool> isTargetDateInvalid = false.obs;
Rx<bool> isContractorInvalid = false.obs;

Rx<bool> isCorrectiveInvalid = false.obs;
Rx<bool> isResponsibleInvalid = false.obs;
Rx<bool> isContactNumberInvalid = false.obs;
Rx<bool> isCostInvalid = false.obs;
Rx<bool> islocationofObservationInvalid = false.obs;







  

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
        Future.delayed(Duration(seconds: 1), () {
          getTypeOfObservationList();
        });
        Future.delayed(Duration(seconds: 1), () {
          getSourceObservationList();
        });
      });
      if (obsId.value != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getObsDetail(id: obsId.value);
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

  Future<void> getObsDetail({required int id}) async {
    final _getObsDetail = await createObservationPresenter.getObsDetail(id: id);

    if (_getObsDetail != null) {
      // getObsById.value = _getObsDetail;

      // issueDateTc.text = getObsById.value?.created_at ?? '';
      // expireOnDateTc.text = getObsById.value?.end_date ?? "";
      // commentsCtrl.text = getObsById.value?.description ?? "";
    }
  }

  Future<void> getObsHistory({required int id}) async {
    int moduleType = 407;

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
      checkObs();
      if (isFormInvalid.value) {
        return;
      }
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
        risk_type_id: incidenttypeId,
        source_of_observation: sourceOfObsId,
        target_date: _targetDateTc,
        type_of_observation: typeOfObsId,
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

  void checkObs() {

            
if(incidenttypeId == 0){
  isRiskTypeListSelected.value=false;
  isFormInvalid.value = true;
}
 if (contractorNameCtrlr.text.trim()=='') {
      isContractorInvalid.value = true;
      isFormInvalid.value = true;
    }

if (correctivePreventiveCtrlr.text.trim()=='') {
      isCorrectiveInvalid.value = true;
      isFormInvalid.value = true;
    }
if (responsiblePersonCtrlr.text.trim()=='') {
      isResponsibleInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (contactNumberCtrlr.text.trim()=='') {
      isContactNumberInvalid.value = true;
      isFormInvalid.value = true;
    }
      if (costTypeCtrlr.text.trim()=='') {
      isCostInvalid.value = true;
      isFormInvalid.value = true;
    }
    
  if (obsDateTc.text.trim()=='') {
      isObsDateTcInvalid.value = true;
      isFormInvalid.value = true;
    }
    
    if(typeOfObsId == 0){
  isSelectedTypeOfObs.value=false;
  isFormInvalid.value = true;
}
if(sourceOfObsId == 0){
  isSelectedSourceOfObs.value=false;
  isFormInvalid.value = true;
}



 if (targetDateTc.text.trim().length == 0) {
      isTargetDateInvalid.value = true;
      isFormInvalid.value = true;
    }


 if (locationOfObservationCtrlr.text.trim().length == 0) {
      islocationofObservationInvalid.value = true;
      isFormInvalid.value = true;
    }




    // if (selectedRiskTypeList.value == '') {
    //   isRiskTypeListSelected.value = false;
    //   isFormInvalid.value = true;
    // }
    // if (selectedSourceOfObs.value == '') {
    //   isSourceOfObsListSelected.value = false;
    //   isFormInvalid.value = true;
    // }
    // if (selectedTypeOfObs.value == '') {
    //   isTypeOfObsListSelected.value = false;
    //   isFormInvalid.value = true;
    // }
    // if (obsDateTc.text.trim().length < 3) {
    //   isObsDateTcInvalid.value = true;
    //   isFormInvalid.value = true;
    // }

    // if (targetDateTc.text.trim().length < 3) {
    //   isTargetDateInvalid.value = true;
    //   isFormInvalid.value = true;
    // }
  }

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

  Future<void> getTypeOfObservationList() async {
    typeOfObsList.clear();
    final list = await createObservationPresenter.getTypeOfObservationList(
      isLoading: isLoading.value,
    );
    if (list != null) {
      isLoading.value = false;
      for (var _typeOfObsList in list) {
        typeOfObsList.add(_typeOfObsList);
      }
    }
  }

  Future<void> getSourceObservationList() async {
    sourceOfObsList.clear();
    final list = await createObservationPresenter.getSourceObservationList(
      isLoading: isLoading.value,
    );
    if (list != null) {
      isLoading.value = false;
      for (var _sourceOfObsList in list) {
        sourceOfObsList.add(_sourceOfObsList);
      }
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
      case RxList<TypeOfObsListModel>:
        {
          if (value != "Please Select") {
            int typeOfObsIndex =
                typeOfObsList.indexWhere((x) => x?.name == value);
            typeOfObsId = typeOfObsList[typeOfObsIndex]?.id ?? 0;
            selectedTypeOfObs.value = value;
            isTypeOfObsListSelected.value = true;
            isSelectedTypeOfObs.value = true;
            print(
                "selectedBusinessTypeId: ${typeOfObsId} \n ${selectedTypeOfObs}");
          } else {
            typeOfObsId = 0;
          }
        }
        break;
      case RxList<SourceOfObservationListModel>:
        {
          if (value != "Please Select") {
            int sourceOfObsIndex =
                sourceOfObsList.indexWhere((x) => x?.name == value);
            sourceOfObsId = sourceOfObsList[sourceOfObsIndex]?.id ?? 0;
            selectedSourceOfObs.value = value;
            isSourceOfObsListSelected.value = true;
            isSelectedSourceOfObs.value=true;
            print(
                "selectedBusinessTypeId: ${sourceOfObsId} \n ${selectedSourceOfObs}");
          } else {
            sourceOfObsId = 0;
          }
        }
        break;
    }
  }
}
