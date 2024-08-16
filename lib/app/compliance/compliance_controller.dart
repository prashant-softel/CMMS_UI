import 'dart:async';
import 'package:cmms/app/compliance/compliance_presenter.dart';
import 'package:cmms/domain/models/Compliance_Status_model.dart';
import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/createStatutory_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_by_id_model.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../home/home_controller.dart';

class ComplianceController extends GetxController {
  ///
  ComplianceController(
    this.compliancePresenter,
  );
  CompliancePresenter compliancePresenter;

  final HomeController homeController = Get.find();
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  StreamSubscription<int>? facilityIdStreamSubscription;
  Stream<int> get facilityId$ => _facilityId.stream;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<StatutoryComplianceModel?> statutoryComplianceList =
      <StatutoryComplianceModel>[].obs;
  RxList<ComplianceStatusModel?> statusOfAplicationList =
      <ComplianceStatusModel>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  Rx<GetStatutoryById?> getStatutoryById = GetStatutoryById().obs;
  Rx<bool> isStatutoryComplianceSelected = true.obs;
  Rx<bool> isStatusOfAplicationSelected = true.obs;

  Rx<String> selectedStatutoryCompliance = ''.obs;
  Rx<String> selectedStatusOfAplication = ''.obs;

  int selectedStatutoryComplianceId = 0;
  int selectedStatusOfAplicationId = 0;

  bool openIssueDatePicker = false;
  bool openExpireOnFDatePicker = false;
  bool openReNewOnDatePicker = false;
  Rx<bool> isIssueDateInvalid = false.obs;
  Rx<bool> isRenewDateInvalid = false.obs;

  Rx<bool> isLoading = true.obs;
  Rx<bool> isExpiresonInvalid = false.obs;
  RxBool isFormInvalid = false.obs;
  RxList<GetStatutoryList> getStatutoryList = <GetStatutoryList>[].obs;
  RxBool isStatutoryPresent = false.obs;

  var issueDateTc = TextEditingController();
  var expireOnDateTc = TextEditingController();
  var reNewOnDateTc = TextEditingController();

  var commentsCtrl = TextEditingController();

  int paidId = 0;
  int facilityId = 0;
  RxBool showAdditionalColumn = false.obs;
  Rx<int> srId = 0.obs;
  Rx<int> reNew = 0.obs;

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
          getStatutoryComplianceDropDown();
        });
        Future.delayed(Duration(seconds: 1), () {
          statusOfAplication();
        });
        // Future.delayed(Duration(seconds: 2), () async {
        //   await getStatutoryDataList(facilityId);
        // });
      });
      if (srId.value != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getStatutoryDetail(id: srId.value);
          getSRHistory(id: srId.value);
        });
      }
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _srId = await compliancePresenter.getValue();
      final _reNew = await compliancePresenter.getRewValue();

      if (_srId == null || _srId == '' || _srId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        srId.value = dataFromPreviousScreen['srId'];

        reNew.value = dataFromPreviousScreen['reNew'];
        print('Add Statutory Detail:$reNew');
        compliancePresenter.saveValue(srId: srId.value.toString());
        compliancePresenter.saveRenewValue(reNew: reNew.value.toString());
      } else {
        srId.value = int.tryParse(_srId) ?? 0;
        reNew.value = int.tryParse(_reNew!) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'srId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getStatutoryDetail({required int id}) async {
    final _getStatutoryDetail =
        await compliancePresenter.getStatutoryDetail(id: id);
    print('Add Statutory Detail:$_getStatutoryDetail');

    if (_getStatutoryDetail != null) {
      getStatutoryById.value = _getStatutoryDetail;
      selectedStatutoryCompliance.value =
          getStatutoryById.value?.compilanceName ?? '';
      selectedStatutoryComplianceId =
          getStatutoryById.value?.compliance_id ?? 0;
      selectedStatusOfAplication.value =
          getStatutoryById.value?.status_of_application ?? '';
      selectedStatusOfAplicationId = getStatutoryById.value?.status_id ?? 0;
      issueDateTc.text = getStatutoryById.value?.created_at ?? '';
      expireOnDateTc.text = getStatutoryById.value?.end_date ?? "";
      commentsCtrl.text = getStatutoryById.value?.description ?? "";
    }
  }

  Future<void> getSRHistory({required int id}) async {
    int moduleType = 406;

    historyList?.value = await compliancePresenter.getHistory(
          moduleType,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getFacilityList() async {
    final _facilityList = await compliancePresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  void getStatutoryComplianceDropDown() async {
    statutoryComplianceList.value = <StatutoryComplianceModel>[];
    final _statutoryComplianceList =
        await compliancePresenter.getStatutoryComplianceDropDown(
      isLoading: true,
      facilityId: facilityId,
    );
    print('Unit Currency List:$statutoryComplianceList');
    for (var statutory_Compliance_List in _statutoryComplianceList) {
      statutoryComplianceList.add(statutory_Compliance_List);
    }

    update(['statutory_Compliance_List']);
  }

  void statusOfAplication() async {
    statusOfAplicationList.value = <ComplianceStatusModel>[];
    final _statusOfAplicationList =
        await compliancePresenter.statusOfAplication(
      isLoading: true,
      facilityId: facilityId,
    );
    print('Unit status Of Aplication List:$statusOfAplicationList');
    for (var status_Of_Aplication_List in _statusOfAplicationList) {
      statusOfAplicationList.add(status_Of_Aplication_List);
    }

    update(['statusOfAplicationList']);
  }

  void createCompliance(int? position) async {
    try {
      checkCompiliace();
      if (isFormInvalid.value) {
        return;
      }
      String _issueDateTc = issueDateTc.text.trim();
      String _expireOnDateTc = expireOnDateTc.text.trim();
      String _commentsCtrl = commentsCtrl.text.trim();

      CreateStatutoryModel createStatutoryModel = CreateStatutoryModel(
          facility_id: facilityId,
          Comment: _commentsCtrl,
          compliance_id: selectedStatutoryComplianceId,
          issue_date: _issueDateTc,
          expires_on: _expireOnDateTc,
          renewFlag: 0,
          renew_date: "",
          status_of_aplication_id: selectedStatusOfAplicationId);

      // Convert the CreateStatutoryModel instance to JSON
      var createComplianceModelJsonString = createStatutoryModel.toJson();

      // Call the createCompliance function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responseCreateComplianceModel =
          await compliancePresenter.createCompliance(
        createCompliance: createComplianceModelJsonString,
        isLoading: true,
        position: position,
      );

      // Handle the response
      if (responseCreateComplianceModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print(
          'Create  create Compliance  data: $createComplianceModelJsonString');
    } catch (e) {
      print(e);
    }
  }

  void updateCompliance(int? postion) async {
    try {
      checkCompiliace();
      if (isFormInvalid.value) {
        return;
      }
      String _issueDateTc = issueDateTc.text.trim();
      String _expireOnDateTc = expireOnDateTc.text.trim();
      String _commentsCtrl = commentsCtrl.text.trim();

      CreateStatutoryModel createStatutoryModel = CreateStatutoryModel(
          facility_id: facilityId,
          Comment: _commentsCtrl,
          compliance_id: selectedStatutoryComplianceId,
          issue_date: _issueDateTc,
          expires_on: _expireOnDateTc,
          renewFlag: 0,
          renew_date: "",
          status_of_aplication_id: selectedStatusOfAplicationId);

      // Convert the CreateStatutoryModel instance to JSON
      var createComplianceModelJsonString = createStatutoryModel.toJson();

      // Call the createCompliance function from stockManagementAddGoodsOrdersPresenter
      Map<String, dynamic>? responseCreateComplianceModel =
          await compliancePresenter.createCompliance(
        createCompliance: createComplianceModelJsonString,
        isLoading: true,
      );

      // Handle the response
      if (responseCreateComplianceModel == null) {
        // CreateNewPermitDialog();
        // showAlertDialog();
      }
      print(
          'Create  create Compliance  data: $createComplianceModelJsonString');
    } catch (e) {
      print(e);
    }
  }

  void reNewCompliance(int? position) async {
    try {
      checkRenewCompiliace();
      if (isFormInvalid.value) {
        return;
      }
      String _issueDateTc = issueDateTc.text.trim();
      String _reNewOnDateTc = reNewOnDateTc.text.trim();

      String _expireOnDateTc = expireOnDateTc.text.trim();
      String _commentsCtrl = commentsCtrl.text.trim();

      CreateStatutoryModel createStatutoryModel = CreateStatutoryModel(
          facility_id: facilityId,
          Comment: _commentsCtrl,
          compliance_id: selectedStatutoryComplianceId,
          issue_date: _issueDateTc,
          expires_on: _expireOnDateTc,
          renewFlag: 1,
          renew_date: _reNewOnDateTc,
          status_of_aplication_id: selectedStatutoryComplianceId);

      var createComplianceModelJsonString = createStatutoryModel.toJson();

      Map<String, dynamic>? responseCreateComplianceModel =
          await compliancePresenter.createCompliance(
        createCompliance: createComplianceModelJsonString,
        isLoading: true,
        position: position,
      );

      if (responseCreateComplianceModel == null) {}
      print(
          'Create  create Compliance  data: $createComplianceModelJsonString');
    } catch (e) {
      print(e);
    }
  }

  Future<void> getStatutoryDataList(int facilityId) async {
    getStatutoryList.value = <GetStatutoryList>[];

    final _getStatutoryList = await compliancePresenter.getStatutoryDataList(
        isLoading: isLoading.value, facility_id: facilityId, isExport: false);
    getStatutoryList.value = _getStatutoryList;
    isLoading.value = false;
  }

  void checkCompiliace() {
    if (selectedStatutoryCompliance.value == '') {
      isStatutoryComplianceSelected.value = false;
      isFormInvalid.value = true;
    }
    if (selectedStatusOfAplication.value == '') {
      isStatusOfAplicationSelected.value = false;
      isFormInvalid.value = true;
    }
    if (issueDateTc.text.trim().length < 3) {
      isIssueDateInvalid.value = true;
      isFormInvalid.value = true;
    }

    if (expireOnDateTc.text.trim().length < 3) {
      isExpiresonInvalid.value = true;
      isFormInvalid.value = true;
    }
  }

  void checkRenewCompiliace() {
    if (reNewOnDateTc.text.trim().length < 3) {
      isRenewDateInvalid.value = true;
      isFormInvalid.value = true;
    }
  }

  void clearStoreData() {
    compliancePresenter.clearValue();
    compliancePresenter.clearRenewValue();
  }

  void onValueChanged(dynamic list, dynamic value) {
    print("$value");
    switch (list.runtimeType) {
      case const (RxList<StatutoryComplianceModel>):
        {
          if (value != "Please Select") {
            int currencyIndex =
                statutoryComplianceList.indexWhere((x) => x?.name == value);
            selectedStatutoryComplianceId =
                statutoryComplianceList[currencyIndex]?.id ?? 0;
            selectedStatutoryCompliance.value = value;
            isStatutoryPresent.value = getStatutoryList.any((element) =>
                element.compilanceName == selectedStatutoryCompliance.value);
            isStatutoryComplianceSelected.value = true;
            print(
                "selectedBusinessTypeId: ${isStatutoryPresent} \n ${selectedStatutoryCompliance}");

            if (isStatutoryPresent.value) {
              selectedStatutoryCompliance.value = "";
              selectedStatutoryComplianceId = 0;

              Get.dialog(
                AlertDialog(
                  title: Text("Compliance Already Exists"),
                  content: Text("This compliance is already in existence."),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text("OK"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              );
            }
          } else {
            selectedStatutoryComplianceId = 0;
          }
        }
        break;

      case const (RxList<ComplianceStatusModel>):
        {
          if (value != "Please Select") {
            int statusIndex =
                statusOfAplicationList.indexWhere((x) => x?.name == value);
            selectedStatusOfAplicationId =
                statusOfAplicationList[statusIndex]?.id ?? 0;
            selectedStatusOfAplication.value = value;
            isStatusOfAplicationSelected.value = true;
            print(
                "selectedBusinessTypeId: ${selectedStatusOfAplicationId} \n ${selectedStatusOfAplication}");
          } else {
            selectedStatusOfAplicationId = 0;
          }
        }
        break;
    }
  }
}
