import 'dart:async';
import 'package:cmms/app/Statutory-Compliance/Statutory_Compliance_presenter.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/Statutory_Compliance_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StatutoryComplianceController extends GetxController {
  StatutoryComplianceController(
    this.statutoryCompliancePresenter,
  );
  StatutoryCompliancePresenter statutoryCompliancePresenter;
  final HomeController homecontroller = Get.find();
  StatutoryComplianceModel? selectedItem;
  StatutoryComplianceModel? selectedItemupdate;
  Rx<bool> isFormInvalid = false.obs;
  RxBool isCheckedRequire = false.obs;
  RxBool isContainerVisible = false.obs;
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
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<StatutoryComplianceModel> StatutoryCompliance = <StatutoryComplianceModel>[].obs;
  RxList<StatutoryComplianceModel> BufferStatutoryCompliance = <StatutoryComplianceModel>[].obs;
  Rx<bool> isStatutoryComplianceSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<StatutoryComplianceModel> filteredData = <StatutoryComplianceModel>[].obs;

  PaginationController StatutoryCompliancePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      StatutoryCompliance.value = BufferStatutoryCompliance.value;
      return;
    }
    List<StatutoryComplianceModel> filteredList = BufferStatutoryCompliance.where((item) =>
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) 
            // (item.description
            //         ?.toString()
            //         .toLowerCase()
            //         .contains(keyword.toLowerCase()) ??
            //     false) // Add this condition to filter by searchId
        ).toList();
    StatutoryCompliance.value = filteredList;
  }
  // void search(String keyword) {
  //   print('Keyword: $keyword');

  //   if (keyword.isEmpty) {
  //     StatutoryCompliance.value = filteredData.toList();
  //     print('StatutoryCompliance length (empty keyword): ${StatutoryCompliance.length}');
  //     return;
  //   }

  //   StatutoryCompliance.value = filteredData
  //       .where((item) =>
  //           item.name
  //               ?.toString()
  //               .toLowerCase()
  //               .contains(keyword.toLowerCase()) ??
  //           false)
  //       .toList();

  //   print('StatutoryCompliance length (non-empty keyword): ${StatutoryCompliance.length}');
  // }

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  FocusNode titleFocus = FocusNode();
  ScrollController titleScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getStatutoryCompliance();
      });
    });
    titleFocus.addListener(() {
      if (!titleFocus.hasFocus) {
        titleScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> getStatutoryCompliance() async {
    StatutoryCompliance.value = <StatutoryComplianceModel>[];
    BufferStatutoryCompliance.value = <StatutoryComplianceModel>[];
    final _StatutoryCompliance = await statutoryCompliancePresenter.getStatutoryCompliance(
      isLoading: isLoading.value,
      // StatutoryCompliance_id: StatutoryCompliance_id,
      job_type_id: selectedJobSOPId,
      // job_type_id: 36,
    );
    isLoading.value = false;
    for (var facilityType_list in _StatutoryCompliance) {
    StatutoryCompliance.add(facilityType_list);
    BufferStatutoryCompliance.add(facilityType_list);
  }
      // selectedSopPermit.value = _StatutoryCompliance[0].name ?? '';

    // supplierNameList = _supplierNameList;
    StatutoryCompliancePaginationController = PaginationController(
      rowCount: StatutoryCompliance.length,
      rowsPerPage: 10,
    );
    update(['Statutory-Compliance']);
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createStatutoryCompliance() async {
    print("CREATE CONTROLLER");
    if (titleCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      return false;
      // isDescriptionInvalid.value = true;
    }
    // if (descriptionCtrlr.text.trim() == '') {
    //   // isTitleInvalid.value = true;
    //   isFormInvalid.value = true;
    //   isDescriptionInvalid.value = true;
    // }
   
    if (titleCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();

      StatutoryComplianceModel createCheckpoint =
          StatutoryComplianceModel(name: _title, id:0);
      print("OUT ");
      var facilitylistJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await statutoryCompliancePresenter.createStatutoryCompliance(
        facilitylistJsonString: facilitylistJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {cleardata()};
  }

  cleardata() {
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
      getStatutoryCompliance();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateStatutoryCompliance(checklistId) async {
    String _name = titleCtrlr.text.trim();
    // String _description = descriptionCtrlr.text.trim();

    StatutoryComplianceModel createChecklist = StatutoryComplianceModel(
      id: checklistId,
      name: _name,
      // description: _description,
    );
    var StatutoryComplianceJsonString = createChecklist.toJson();

    print({"StatutoryComplianceJsonString", StatutoryComplianceJsonString});
    await statutoryCompliancePresenter.updateStatutoryCompliance(
      StatutoryComplianceJsonString: StatutoryComplianceJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({String? StatutoryCompliance_id, String? Statutory}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Statutory ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$Statutory]",
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
                  deleteStatutoryCompliance(StatutoryCompliance_id).then((value) {
                    Get.back();
                    getStatutoryCompliance();
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

  Future<void> deleteStatutoryCompliance(String? StatutoryCompliance_id) async {
    {
      await statutoryCompliancePresenter.deleteStatutoryCompliance(
        StatutoryCompliance_id,
        isLoading: true,
      );
    }
  }

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
