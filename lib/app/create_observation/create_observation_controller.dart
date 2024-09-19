import 'dart:async';
import 'package:cmms/app/create_observation/create_observation_presenter.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/create_obs_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
import 'package:cmms/domain/models/source_of_obs_list_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/type_of_obs_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = true.obs;
  Rx<int> selectedAssignedToId = 0.obs;

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

  Rx<int> type = 0.obs;


RxList<TypeModel> costType = <TypeModel>[
    TypeModel(name: 'Capex', id: "1"),
    TypeModel(name: 'Opex', id: "2"),
  ].obs;
  Rx<bool> isCostTypeListSelected = true.obs;
  Rx<String> selectedCostTypeList = ''.obs;
  RxList<TypeOfObsListModel?> typeOfObsList = <TypeOfObsListModel>[].obs;
  Rx<String> selectedTypeOfObs = ''.obs;
  Rx<bool> isSelectedTypeOfObs = true.obs;
  int sourceOfObsId = 0;

  RxList<SourceOfObservationListModel?> sourceOfObsList =
      <SourceOfObservationListModel>[].obs;
  Rx<GetObservationById?> getObsById = GetObservationById().obs;
  Rx<String> selectedSourceOfObs = ''.obs;
  int selectedFacilityId = 0;
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
int selectedCostTypeId = 0;
// GetObservationList? selectedItem;
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
        getAssignedToList();
        obsDateTc.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
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
        type.value = dataFromPreviousScreen['type'];

        createObservationPresenter.saveValue(obsId: obsId.value.toString());
      } else {
        obsId.value = int.tryParse(_obsId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'obsId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }
  //update
  // void updateobsDetails() async {
  //   int _id = selectedItem?.id ?? 0;

  //   // Get the entered data from the text fields
  //   int _KaizensImplementedCtrl =
  //       int.tryParse(KaizensImplementedCtrl.text.trim()) ?? 0;
  //   int _CostForImplementationCtrl =
  //       int.tryParse(CostForImplementationCtrl.text.trim()) ?? 0;
  //   int _CostSavedFromImplementationCtrl =
  //       int.tryParse(CostSavedFromImplementationCtrl.text.trim()) ?? 0;

  //   // If the month and year are not changed, fallback to selectedItem's values
  //   int _monthId = selectedMonth != (selectedItem?.month_id ?? 0)
  //       ? selectedMonth
  //       : selectedItem?.month_id ?? 0;

  //   int _year = selectedYear != (selectedItem?.year ?? 0)
  //       ? selectedYear
  //       : selectedItem?.year ?? 0;

  //   // Ensure that the month and year are correctly assigned to their respective fields in the model
  //   CreateKaizensModel createkaizensdataModel = CreateKaizensModel(
  //     id: _id,
  //     KaizensImplemented: _KaizensImplementedCtrl,
  //     CostForImplementation: _CostForImplementationCtrl,
  //     CostSavedFromImplementation: _CostSavedFromImplementationCtrl,
  //     month_id: _monthId, // Use the new month or fallback to original
  //     year: _year, // Use the new year or fallback to original
  //   );

  //   // Converting the model to JSON format
  //   var updateKaizensModelJsonString = createkaizensdataModel.toJson();

  //   // Calling the updateKaizenDetails method in the presenter
  //   Map<String, dynamic>? responseCreateGoModel =
  //       await createkaizensdataPresenter.updateKaizenDetails(
  //     updateKaizen: updateKaizensModelJsonString,
  //     isLoading: true,
  //   );

  //   // Handling the response from the API
  //   if (responseCreateGoModel == null) {
  //     print("Update failed");
  //   } else {
  //     print("Update successful");
  //   }
  // }

  void clearStoreData() {
    createObservationPresenter.clearValue();
  }

  Future<void> getObsDetail({required int id}) async {
    final _getObsDetail = await createObservationPresenter.getObsDetail(id: id);

    if (_getObsDetail != null) {
      getObsById.value = _getObsDetail;

      contactNumberCtrlr.text = getObsById.value?.contact_number ?? '';
      selectedAssignedToId.value = getObsById.value?.assigned_to_id ?? 0;
      selectedAssignedTo.value = getObsById.value?.assigned_to_name ?? '';
      contractorNameCtrlr.text = getObsById.value?.contractor_name ?? "";
      correctivePreventiveCtrlr.text =
          getObsById.value?.preventive_action ?? "";
      selectedCostTypeList.value = getObsById.value?.cost_name ?? "";
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
      sourceOfObsId = getObsById.value?.source_of_observation ?? 0;
      incidenttypeId = getObsById.value?.risk_type_id ?? 0;
      typeOfObsId = getObsById.value?.type_of_observation ?? 0;
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
      //   checkObs();
      //   if (isFormInvalid.value) {
      //     return;
      //   }

      String _contractorNameCtrlr = contractorNameCtrlr.text.trim();
      String _correctivePreventiveCtrlr = correctivePreventiveCtrlr.text.trim();
      // String _responsiblePersonCtrlr = responsiblePersonCtrlr.text.trim();
      String _contactNumberCtrlr = contactNumberCtrlr.text.trim();
      String _obsDateTc = obsDateTc.text.trim();
      String _discriptionCtrlr = discriptionCtrlr.text.trim();
      String _locationOfObservationCtrlr =
          locationOfObservationCtrlr.text.trim();
      // String _targetDateTc = targetDateTc.text.trim();

      // Assigning the correct id based on the selected cost type
     int idToSend = position == 1 ? 0 : obsId.value;
      String? targetDateToSend =
          position == 1 ? null : targetDateTc.text.trim();

      CreateObsModel createObsModel = CreateObsModel(
        id: idToSend,
        facility_id: facilityId,
        contact_number: _contactNumberCtrlr,
        contractor_name: _contractorNameCtrlr,
        cost_type: selectedCostTypeId, // Sending the selected cost type ID
        date_of_observation: _obsDateTc,
        location_of_observation: _locationOfObservationCtrlr,
        observation_description: _discriptionCtrlr,

        preventive_action: _correctivePreventiveCtrlr,
        assigned_to_id: selectedAssignedToId.value,
        //  assignedId: selectedAssignedToId.value,
        risk_type_id: incidenttypeId,
        source_of_observation: sourceOfObsId,
        target_date: targetDateToSend,
        type_of_observation: typeOfObsId,
        uploadfileIds: fileIds,
      );

      // Convert the CreateObsModel instance to JSON
      var createObsModelJsonString = createObsModel.toJson();

      // Call the createObs function from the presenter
      Map<String, dynamic>? responseCreateObsModel =
          await createObservationPresenter.createObs(
        createObs: createObsModelJsonString,
        isLoading: true,
        position: position,
      );

      if (responseCreateObsModel == null) {
        // Handle response if needed
      }

      print('Create Observation data: $createObsModelJsonString');
    } catch (e) {
      print(e);
    }
  }



  String? getAssignedToName(int _selectedAssignedToId) {
    final item =
        assignedToList.firstWhere((item) => item?.id == _selectedAssignedToId);
    final _selectedAssignedToName = item?.name ?? '';
    return _selectedAssignedToName;
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList = await createObservationPresenter.getAssignedToList(
        facilityId: facilityId,
        featureId: UserAccessConstants.kModuleCleaningplanFeatureId);

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
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

      case const (RxList<EmployeeModel>):
        {
          if (value != "Please Select") {
            int assignedToIndex =
                assignedToList.indexWhere((x) => x?.name == value);
            selectedAssignedToId.value =
                assignedToList[assignedToIndex]?.id ?? 0;
            isAssignedToSelected.value = true;
            selectedAssignedTo.value = value;
          } else {
            selectedAssignedToId.value = 0;
          }
        }
        break;
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
      case const (RxList<TypeModel>):
        {
          if (value != "Please Select") {
            int costTypeIndex = costType.indexWhere((x) => x.name == value);
            selectedCostTypeId =
                int.tryParse(costType[costTypeIndex].id ?? '0') ?? 0;
            selectedCostTypeList.value = value;
            isCostTypeListSelected.value = true;
          } else {
            selectedCostTypeId = 0;
          }
        }
        break;
    }
  }
}
