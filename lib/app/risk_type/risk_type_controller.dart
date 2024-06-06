import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/risk_type/risk_type_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_risk_type_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RiskTypeController extends GetxController {
  RiskTypeController(
    this.riskTypeListPresenter,
  );
  RiskTypeListPresenter riskTypeListPresenter;
  final HomeController homecontroller = Get.find();
  FocusNode rnameFocus = FocusNode();
  ScrollController rnameScroll = ScrollController();
  FocusNode rdescFocus = FocusNode();
  ScrollController rdescScroll = ScrollController();
  RiskTypeModel? selectedItem;
  RiskTypeModel? selectedItemupdate;
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

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///SOP Permit List
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<RiskTypeModel> riskTypeList = <RiskTypeModel>[].obs;
  RxList<RiskTypeModel> BufferRiskTypeList = <RiskTypeModel>[].obs;
  Rx<bool> isRiskTypeListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<RiskTypeModel> filteredData = <RiskTypeModel>[].obs;

  PaginationController RiskTypeListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      riskTypeList.value = BufferRiskTypeList.value;
      return;
    }
    List<RiskTypeModel> filteredList = BufferRiskTypeList.where((item) =>
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.description
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) // Add this condition to filter by searchId
        ).toList();
    riskTypeList.value = filteredList;
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
        getRiskTypeList();
      });
    });
    rnameFocus.addListener(() {
      if (!rnameFocus.hasFocus) {
        rnameScroll.jumpTo(0.0);
      }
    });
    rdescFocus.addListener(() {
      if (!rdescFocus.hasFocus) {
        rdescScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> getRiskTypeList() async {
    riskTypeList.value = <RiskTypeModel>[];
    BufferRiskTypeList.value = <RiskTypeModel>[];
    final _risktypeList = await riskTypeListPresenter.getRiskTypeList(
      isLoading: true,
      facility_id: selectedJobSOPId,
    );
    for (var facilityType_list in _risktypeList) {
      riskTypeList.add(facilityType_list);
      BufferRiskTypeList.add(facilityType_list);
    }

    RiskTypeListPaginationController = PaginationController(
      rowCount: riskTypeList.length,
      rowsPerPage: 10,
    );
    update(['Risktype_list']);
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createRiskType() async {
    print("CREATE CONTROLLER");
    if (titleCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
      // isDescriptionInvalid.value = true;
    }
    if (descriptionCtrlr.text.trim() == '') {
      // isTitleInvalid.value = true;
      isFormInvalid.value = true;
      isDescriptionInvalid.value = true;
    }
    checkForm();
    print("FORMVALIDITIY : $isFormInvalid.value");
    print("TITLE : $isTitleInvalid.value");
    print("DES : $isDescriptionInvalid.value");
    if (isFormInvalid.value == true) {
      return false;
    }
    if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CreateRiskTypeModel createCheckpoint =
          CreateRiskTypeModel(name: _title, description: _description);
      print("OUT ");
      var facilitylistJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await riskTypeListPresenter.createRiskType(
        riskTypeJsonString: facilitylistJsonString,
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
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getRiskTypeList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateRiskType(checklistId) async {
    String _name = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    RiskTypeModel createChecklist = RiskTypeModel(
      id: checklistId,
      name: _name,
      description: _description,
    );
    var RiskTypeJsonString = createChecklist.toJson();

    print({"businessTypeJsonString", RiskTypeJsonString});
    await riskTypeListPresenter.updateRiskType(
      riskTypeJsonString: RiskTypeJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({String? business_id, String? business}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Risk ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$business]",
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
                  deleteRiskType(business_id).then((value) {
                    Get.back();
                    getRiskTypeList();
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

  Future<void> deleteRiskType(String? business_id) async {
    {
      await riskTypeListPresenter.deleteRiskType(
        business_id,
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
