import 'dart:async';
import 'package:cmms/app/compliance/compliance_presenter.dart';
import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
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
  Rx<bool> isStatutoryComplianceSelected = true.obs;
  Rx<String> selectedStatutoryCompliance = ''.obs;
  int selectedStatutoryComplianceId = 0;
  bool openIssueDatePicker = false;
  var issueDateTc = TextEditingController();

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
