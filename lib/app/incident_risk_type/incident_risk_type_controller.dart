import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/incident_risk_type/incident_risk_type_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/incident_risk_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IncidentRiskTypeController extends GetxController {
  IncidentRiskTypeController(
    this.incidentrisktypepresenter,
  );
  IncidentRiskTypePresenter incidentrisktypepresenter;
  final HomeController homecontroller = Get.find();
  FocusNode irnameFocus = FocusNode();
  ScrollController irnameScroll = ScrollController();
  // FocusNode bodypdescFocus = FocusNode();
  // ScrollController bodypdescScroll = ScrollController();
  IncidentRiskTypeModell? selectedItem;
  IncidentRiskTypeModell? selectedItemupdate;
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
  RxList<IncidentRiskTypeModell> incidentrisktypeList =
      <IncidentRiskTypeModell>[].obs;
  RxList<IncidentRiskTypeModell> BufferincidentrisktypeList =
      <IncidentRiskTypeModell>[].obs;
  Rx<bool> isincidentrisktypeListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<IncidentRiskTypeModell> filteredData = <IncidentRiskTypeModell>[].obs;

  PaginationController IncidentRiskTypeListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      incidentrisktypeList.value = BufferincidentrisktypeList.value;
      return;
    }
    List<IncidentRiskTypeModell> filteredList =
        BufferincidentrisktypeList.where((item) => (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false)
            // ||
            // (item.description
            //         ?.toString()
            //         .toLowerCase()
            //         .contains(keyword.toLowerCase()) ??
            //     false) // Add this condition to filter by searchId
            ).toList();
    incidentrisktypeList.value = filteredList;
  }
  // void search(String keyword) {
  //   print('Keyword: $keyword');

  //   if (keyword.isEmpty) {
  //     SPVList.value = filteredData.toList();
  //     print('SPVList length (empty keyword): ${SPVList.length}');
  //     return;
  //   }

  //   SPVList.value = filteredData
  //       .where((item) =>
  //           item.name
  //               ?.toString()
  //               .toLowerCase()
  //               .contains(keyword.toLowerCase()) ??
  //           false)
  //       .toList();

  //   print('SPVList length (non-empty keyword): ${SPVList.length}');
  // }

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();
  // var descriptionCtrlr = TextEditingController();

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getIncidentRiskType(facilityId);
      });
    });
    irnameFocus.addListener(() {
      if (!irnameFocus.hasFocus) {
        irnameScroll.jumpTo(0.0);
      }
    });

    super.onInit();
  }

  Future<void> getIncidentRiskType(int facilityId) async {
    incidentrisktypeList.value = <IncidentRiskTypeModell>[];
    BufferincidentrisktypeList.value = <IncidentRiskTypeModell>[];
    final _irisktypeList = await incidentrisktypepresenter.getIncidentRiskType(
      facilityId: facilityId,
      isLoading: true,
    );
    isLoading.value = false;
    for (var facilityType_list in _irisktypeList) {
      incidentrisktypeList.add(facilityType_list);
      BufferincidentrisktypeList.add(facilityType_list);
    }
  
    IncidentRiskTypeListPaginationController = PaginationController(
      rowCount: incidentrisktypeList.length,
      rowsPerPage: 10,
    );
    update(['Incidentrisktype_list']);
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createIncidentRiskType() async {
    print("CREATE CONTROLLER");
    if (titleCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
      // isDescriptionInvalid.value = true;
    }
    // if (descriptionCtrlr.text.trim() == '') {
    //   // isTitleInvalid.value = true;
    // isFormInvalid.value = true;
    //   isDescriptionInvalid.value = true;
    // }
    checkForm();
    print("FORMVALIDITIY : $isFormInvalid.value");
    print("TITLE : $isTitleInvalid.value");
    // print("DES : $isDescriptionInvalid.value");
    if (isFormInvalid.value == true) {
      return false;
    }
    if (titleCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();
      // String _description = descriptionCtrlr.text.trim();

      IncidentRiskTypeModell createCheckpoint =
          IncidentRiskTypeModell(id: 0, name: _title);
      print("OUT ");
      var facilitylistJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await incidentrisktypepresenter.createIncidentRiskType(
        incidentRiskTypeJsonString: facilitylistJsonString,
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
    // descriptionCtrlr.text = '';
    // selectedStateId = 0;
    // selectedCountryId = 0;
    // selectedCityId = 0;
    // ownerId = 0;
    selectedItem = null;
    // customerId = 0;
    // operatorId = 0;
    // SpvId = 0;

    Future.delayed(Duration(seconds: 1), () {
      getIncidentRiskType(facilityId);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateIncidentRiskType(Id) async {
    String _name = titleCtrlr.text.trim();
    // String _description = descriptionCtrlr.text.trim();

    IncidentRiskTypeModell createChecklist = IncidentRiskTypeModell(
      id: Id,
      name: _name,
      // description: _description,
    );
    var incidentRiskTypeJsonString = createChecklist.toJson();

    print({"businessTypeJsonString", incidentRiskTypeJsonString});
    await incidentrisktypepresenter.updateIncidentRiskType(
      incidentRiskTypeJsonString: incidentRiskTypeJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({String? risktype_id, String? irisktype}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Risk Type?',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$irisktype]",
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
                  deleteIncidentRiskType(risktype_id).then((value) {
                    Get.back();
                    getIncidentRiskType(facilityId);
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

  Future<void> deleteIncidentRiskType(String? risktype_id) async {
    {
      await incidentrisktypepresenter.deleteIncidentRiskType(
        risktype_id,
        isLoading: true,
      );
    }
  }

  void checkForm() {
    if (isTitleInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
