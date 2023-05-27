import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/facility_type_list/facility_type_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_facility_type_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';

class FacilityTypeListController extends GetxController {
  FacilityTypeListController(
    this.facilityTypeListPresenter,
  );
  FacilityTypeListPresenter facilityTypeListPresenter;
  final HomeController homecontroller = Get.find();

  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isChecked = true.obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // PreventiveCheckListModel? preventiveCheckListModel;

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///SOP Permit List
  RxList<FacilityTypeListModel> facilityTypeList =
      <FacilityTypeListModel>[].obs;
  Rx<bool> isfacilityTypeListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;

  PaginationController facilityTypeListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();
  var addressCtrlr = TextEditingController();
  var cityCtrlr = TextEditingController();
  var stateCtrlr = TextEditingController();
  var countryCtrlr = TextEditingController();
  var pinCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityTypeList();
      });
    });

    super.onInit();
  }

  Future<void> getFacilityTypeList() async {
    facilityTypeList.value = <FacilityTypeListModel>[];
    final _facilityTypePermitList =
        await facilityTypeListPresenter.getFacilityTypeList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobSOPId,
      // job_type_id: 36,
    );
    if (_facilityTypePermitList != null) {
      for (var facilityType_list in _facilityTypePermitList) {
        facilityTypeList.add(facilityType_list);
      }
      // selectedSopPermit.value = _facilityTypeList[0].name ?? '';
    }

    // supplierNameList = _supplierNameList;
    facilityTypeListPaginationController = PaginationController(
      rowCount: facilityTypeList.length,
      rowsPerPage: 10,
    );
    update(['facility_type_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {}

  Future<bool> createFacilityType() async {
    if (titleCtrlr.text.trim() == '' ||
        addressCtrlr.text.trim() == '' ||
        cityCtrlr.text.trim() == '' ||
        stateCtrlr.text.trim() == '' ||
        countryCtrlr.text.trim() == '' ||
        pinCtrlr.text.trim() == '' ||
        descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();
      String _address = addressCtrlr.text.trim();
      String _city = addressCtrlr.text.trim();
      String _state = addressCtrlr.text.trim();
      String _country = addressCtrlr.text.trim();
      String _pin = addressCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();
      CreateFacilityType createCheckpoint = CreateFacilityType(
        title: _title,
        address: _address,
        city: _city,
        state: _state,
        country: _country,
        pin: _pin,
        description: _description,
      );
      var checkpointJsonString = [
        createCheckpoint.toJson()
      ]; //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", checkpointJsonString});
      // await facilityTypeListPresenter.createCheckPoint(
      //   checkpointJsonString: checkpointJsonString,
      //   isLoading: true,
      // );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {_cleardata()};
  }

  _cleardata() {
    // checklistNumberCtrlr.text = '';
    // durationCtrlr.text = '';
    // manpowerCtrlr.text = '';

    // selectedequipment.value = '';

    // selectedfrequency.value = '';
    // Future.delayed(Duration(seconds: 1), () {
    //   getPreventiveCheckList(facilityId, type, true);
    // });
    // Future.delayed(Duration(seconds: 5), () {
    //   isSuccess.value = false;
    // });
  }
}
