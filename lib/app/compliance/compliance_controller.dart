import 'dart:async';
import 'package:cmms/app/compliance/compliance_presenter.dart';
import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/createStatutory_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_by_id_model.dart';
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
  Rx<GetStatutoryById?> getStatutoryById = GetStatutoryById().obs;
  Rx<bool> isStatutoryComplianceSelected = true.obs;
  Rx<String> selectedStatutoryCompliance = ''.obs;
  int selectedStatutoryComplianceId = 0;
  bool openIssueDatePicker = false;
  bool openExpireOnFDatePicker = false;
  Rx<bool> isIssueDateInvalid = false.obs;
  Rx<bool> isExpiresonInvalid = false.obs;
  RxBool isFormInvalid = false.obs;
  var issueDateTc = TextEditingController();
  var expireOnDateTc = TextEditingController();
  var commentsCtrl = TextEditingController();

  int paidId = 0;
  int facilityId = 0;
  RxBool showAdditionalColumn = false.obs;
  Rx<int> srId = 0.obs;

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
      });
      if (srId.value != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getStatutoryDetail(id: srId.value);
          // getGoHistory(id: srId.value);
        });
      }
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _srId = await compliancePresenter.getValue();
      if (_srId == null || _srId == '' || _srId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        srId.value = dataFromPreviousScreen['srId'];
        compliancePresenter.saveValue(srId: srId.value.toString());
      } else {
        srId.value = int.tryParse(_srId) ?? 0;
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

      issueDateTc.text = getStatutoryById.value?.created_at ?? '';
      expireOnDateTc.text = getStatutoryById.value?.end_date ?? "";
    }
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

  void createCompliance() async {
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
      );

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

  void checkCompiliace() {
    if (selectedStatutoryCompliance.value == '') {
      isStatutoryComplianceSelected.value = false;
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

  void onValueChanged(dynamic list, dynamic value) {
    print("$value");
    switch (list.runtimeType) {
      case RxList<StatutoryComplianceModel>:
        {
          if (value != "Please Select") {
            int currencyIndex =
                statutoryComplianceList.indexWhere((x) => x?.name == value);
            selectedStatutoryComplianceId =
                statutoryComplianceList[currencyIndex]?.id ?? 0;
            selectedStatutoryCompliance.value = value;
            isStatutoryComplianceSelected.value = true;
            print(
                "selectedBusinessTypeId: ${selectedStatutoryComplianceId} \n ${selectedStatutoryCompliance}");
          } else {
            selectedStatutoryComplianceId = 0;
          }
        }
        break;
    }
  }
}
