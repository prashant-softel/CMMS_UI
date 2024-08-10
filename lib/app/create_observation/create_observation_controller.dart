import 'dart:async';
import 'package:cmms/app/create_observation/create_observation_presenter.dart';
import 'package:cmms/domain/models/create_obs_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
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
  bool openTargetDatePicker = false;

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
  RxList<RiskTypeModel> incidentrisktypeList = <RiskTypeModel>[].obs;
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
  Rx<GetObservationById?> getObsById = GetObservationById().obs;
  Rx<String> selectedSourceOfObs = ''.obs;
  Rx<bool> isSelectedSourceOfObs = true.obs;
  RxBool isFormInvalid = false.obs;
  Rx<bool> isObsDateTcInvalid = false.obs;
  Rx<bool> isTargetDateInvalid = false.obs;
  Rx<bool> isContractorInvalid = false.obs;
  RxList<FileList?>? file_list = <FileList>[].obs;
  List<dynamic>? files = [];
  Rx<bool> isCorrectiveInvalid = false.obs;
  Rx<bool> isResponsibleInvalid = false.obs;
  Rx<bool> isContactNumberInvalid = false.obs;
  Rx<bool> isCostInvalid = false.obs;
  Rx<bool> islocationofObservationInvalid = false.obs;
  Rx<DateTime> selectedObsTime = DateTime.now().obs;
  Rx<DateTime> selectedTargetTime = DateTime.now().obs;

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
        // Future.delayed(Duration(seconds: 1), () {
        getIncidentRiskType(facilityId);
        // });
        // Future.delayed(Duration(seconds: 1), () {
        getTypeOfObservationList();
        // });
        // Future.delayed(Duration(seconds: 1), () {
        getSourceObservationList();
        // });
      });
      if (obsId.value != 0) {
        // Future.delayed(Duration(seconds: 1), () {
        getObsDetail(id: obsId.value);
        getObsHistory(id: obsId.value);
        // });
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

  void clearStoreData() {
    createObservationPresenter.clearValue();
  }

  Future<void> getObsDetail({required int id}) async {
    final _getObsDetail = await createObservationPresenter.getObsDetail(id: id);

    if (_getObsDetail != null) {
      getObsById.value = _getObsDetail;

      contactNumberCtrlr.text = getObsById.value?.contact_number ?? '';
      responsiblePersonCtrlr.text = getObsById.value?.responsible_person ?? '';
      contractorNameCtrlr.text = getObsById.value?.contractor_name ?? "";
      correctivePreventiveCtrlr.text =
          getObsById.value?.preventive_action ?? "";
      costTypeCtrlr.text = getObsById.value?.cost_type ?? "";
      discriptionCtrlr.text = getObsById.value?.observation_description ?? "";
      locationOfObservationCtrlr.text =
          getObsById.value?.location_of_observation ?? "";
      targetDateTc.text = getObsById.value?.target_date ?? "";
      obsDateTc.text = getObsById.value?.date_of_observation ?? "";
      selectedRiskTypeList.value = getObsById.value?.risk_type_name ?? '';
      selectedTypeOfObs.value =
          getObsById.value?.type_of_observation_name ?? '';
      selectedSourceOfObs.value =
          getObsById.value?.source_of_observation_name ?? '';
    }
  }

  void removeImage(int? num, int index) {
    files!.remove(num);
    file_list!.removeAt(index);
    print('removed file ids ${files}');
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

  void createObs({int? position, List<dynamic>? fileIds}) async {
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
      int idToSend = position == 1 ? 0 : obsId.value;

      CreateObsModel createObsModel = CreateObsModel(
        id: idToSend,
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
        uploadfileIds: fileIds,
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
    if (selectedRiskTypeList.value == '') {
      isRiskTypeListSelected.value = false;
      isFormInvalid.value = true;
    }
    if (contractorNameCtrlr.text.trim() == '') {
      isContractorInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (correctivePreventiveCtrlr.text.trim() == '') {
      isCorrectiveInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (responsiblePersonCtrlr.text.trim() == '') {
      isResponsibleInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (contactNumberCtrlr.text.trim() == '') {
      isContactNumberInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (costTypeCtrlr.text.trim() == '') {
      isCostInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (obsDateTc.text.trim() == '') {
      isObsDateTcInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (selectedTypeOfObs.value == '') {
      isSelectedTypeOfObs.value = false;
      isFormInvalid.value = true;
    }
    if (selectedSourceOfObs.value == '') {
      isSelectedSourceOfObs.value = false;
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

  Future<void> getIncidentRiskType(int facilityId) async {
    incidentrisktypeList.value = <RiskTypeModel>[];
    final _irisktypeList = await createObservationPresenter.getRiskTypeList(
      facility_id: facilityId,
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
      case const (RxList<RiskTypeModel>):
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
      case const (RxList<TypeOfObsListModel>):
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
      case const (RxList<SourceOfObservationListModel>):
        {
          if (value != "Please Select") {
            int sourceOfObsIndex =
                sourceOfObsList.indexWhere((x) => x?.name == value);
            sourceOfObsId = sourceOfObsList[sourceOfObsIndex]?.id ?? 0;
            selectedSourceOfObs.value = value;
            isSourceOfObsListSelected.value = true;
            isSelectedSourceOfObs.value = true;
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
