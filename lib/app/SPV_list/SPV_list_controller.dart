import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/SPV_list/SPV_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/SPV_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/createSPVModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SPVListController extends GetxController {
  SPVListController(
    this.sPVListPresenter,
  );
  SPVListPresenter sPVListPresenter;
  final HomeController homecontroller = Get.find();
  SPVListModel? selectedItem;
  SPVListModel? selectedItemupdate;

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
  RxList<SPVListModel> SPVList = <SPVListModel>[].obs;
  Rx<bool> isSPVListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<SPVListModel> filteredData = <SPVListModel>[].obs;

  PaginationController SPVListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  void search(String keyword) {
    if (keyword.isEmpty) {
      SPVList.value = filteredData;
      return;
    }

    SPVList.value = filteredData.where((item) =>
        item!.name!.toString().toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getSPVList();
      });
    });

    super.onInit();
  }

  Future<void> getSPVList() async {
    SPVList.value = <SPVListModel>[];
    final _spvList = await sPVListPresenter.getSPVList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobSOPId,
      // job_type_id: 36,
    );
    if (_spvList != null) {
      for (var facilityType_list in _spvList) {
        SPVList.add(facilityType_list);
      }
      // selectedSopPermit.value = _SPVList[0].name ?? '';
    }

    // supplierNameList = _supplierNameList;
    SPVListPaginationController = PaginationController(
      rowCount: SPVList.length,
      rowsPerPage: 10,
    );
    update(['SPV_list']);
  }

  Future<bool> createSPVlist() async {
    if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
      isSuccess.value = false;
    } else {
      String _title = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CreateSPVModel createCheckpoint = CreateSPVModel(
        name: _title,
        description: _description
      );
      print("OUT ");
      var facilitylistJsonString = createCheckpoint.toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await sPVListPresenter.createSPVlist(
        facilitylistJsonString: facilitylistJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {_cleardata()};
  }

  _cleardata() {
    titleCtrlr.text = '';
    descriptionCtrlr.text = '';
    // selectedStateId = 0;
    // selectedCountryId = 0;
    // selectedCityId = 0;
    // ownerId = 0;
    selectedItem = null;
    // customerId = 0;
    // operatorId = 0;
    // SpvId = 0;

    Future.delayed(Duration(seconds: 1), () {
      getSPVList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }


  Future<bool> updateSPV(checklistId) async {
    String _name = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    SPVListModel createChecklist = SPVListModel(
      id: checklistId,
      name : _name,
      description: _description,
    );
    var businessTypeJsonString =
    createChecklist.toJson();

    print({"businessTypeJsonString", businessTypeJsonString});
    await sPVListPresenter.updateSPV(
      modulelistJsonString: businessTypeJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({
    String? business_id ,
    String? business
  }) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),

          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the SPV ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: business,
                    style: TextStyle(
                      color: ColorValues.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  deleteSPV(business_id).then((value) {
                    Get.back();
                    getSPVList();
                  });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }
  Future<void> deleteSPV(String? business_id) async {
    {
      await sPVListPresenter.deleteFacility(
        business_id,
        isLoading: true,
      );
    }
  }

}
