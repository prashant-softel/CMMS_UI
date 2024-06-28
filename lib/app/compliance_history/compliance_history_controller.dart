import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/compliance_history/compliance_history_presenter.dart';

import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/complicance_history_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class ComplianceHistoryController extends GetxController {
  ComplianceHistoryController(
    this.complianceHistoryPresenter,
  );
  ComplianceHistoryPresenter complianceHistoryPresenter;
  HomeController homeController = Get.find();
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<bool> isSelectedBusinessType = true.obs;
  RxList<StatutoryHistory> historyStatutory = <StatutoryHistory>[].obs;
  Rx<StatutoryHistory?> historyStatutoryModel = StatutoryHistory().obs;
  RxInt compliance_id = 0.obs;
  int selectedBusinessTypeId = 1;
  Rx<String> selectedBusinessType = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxBool isLoading = true.obs;
  Rx<String> selectedBlock = ''.obs;
  RxString complicance_name = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  ///
  @override
  void onInit() async {
    try {
      await setId();
      await getStatutoryHistory(
        compliance_id: compliance_id.value,
        isLoading: isLoading.value,
      );
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  Future<void> setId() async {
    try {
      final _compliance_id = await complianceHistoryPresenter.getValue();
      if (_compliance_id == null ||
          _compliance_id == '' ||
          _compliance_id == "null") {
        var dataFromPreviousScreen = Get.arguments;
        compliance_id.value = dataFromPreviousScreen['compliance_id'];
        complianceHistoryPresenter.saveValue(
            compliance_id: compliance_id.value.toString());
      } else {
        compliance_id.value = int.tryParse(_compliance_id) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  void clearStoreData() {
    complianceHistoryPresenter.clearValue();
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await complianceHistoryPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getStatutoryHistory({
    required int compliance_id,
    required bool isLoading,
  }) async {
    historyStatutory.value = <StatutoryHistory>[];
    final _historyCompilance =
        await complianceHistoryPresenter.getStatutoryHistory(
      compliance_id: compliance_id,
      isLoading: true,
    );

    if (_historyCompilance != null) {
      historyStatutory.value = _historyCompilance;
      historyStatutoryModel.value =
          historyStatutory.firstWhereOrNull((element) => element.id != null);
      complicance_name.value =
          historyStatutoryModel.value!.compliance_name ?? "";
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<BusinessTypeModel>):
        {
          if (value != "Please Select") {
            int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
            selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
          } else {
            selectedBusinessTypeId = 0;
          }
        }
        break;
    }
  }
}
