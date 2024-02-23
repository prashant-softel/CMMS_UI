import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/body_injured_model.dart';
import '../../domain/models/create_risk_type_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'body_injured_presenter.dart';

class BodyInjuredController extends GetxController {
  BodyInjuredController(
    this.bodyinjuredpresenter,
  );
  BodyInjuredPresenter bodyinjuredpresenter;
  final HomeController homecontroller = Get.find();
  FocusNode bodypnameFocus = FocusNode();
  ScrollController bodypnameScroll = ScrollController();
  FocusNode bodypdescFocus = FocusNode();
  ScrollController bodypdescScroll = ScrollController();
  BodyInjuredModel? selectedItem;
  BodyInjuredModel? selectedItemupdate;
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
  RxList<BodyInjuredModel> bodyinjuredList = <BodyInjuredModel>[].obs;
  RxList<BodyInjuredModel> BufferBodyInjuredList = <BodyInjuredModel>[].obs;
  Rx<bool> isBodyInjuredListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<BodyInjuredModel> filteredData = <BodyInjuredModel>[].obs;

  PaginationController BodyInjuredListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      bodyinjuredList.value = BufferBodyInjuredList.value;
      return;
    }
    List<BodyInjuredModel> filteredList = BufferBodyInjuredList.where((item) =>
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
    bodyinjuredList.value = filteredList;
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
  var descriptionCtrlr = TextEditingController();

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getBodyInjuredList();
      });
    });
    bodypnameFocus.addListener(() {
      if (!bodypnameFocus.hasFocus) {
        bodypnameScroll.jumpTo(0.0);
      }
    });
    bodypdescFocus.addListener(() {
      if (!bodypdescFocus.hasFocus) {
        bodypdescScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> getBodyInjuredList() async {
    bodyinjuredList.value = <BodyInjuredModel>[];
    BufferBodyInjuredList.value = <BodyInjuredModel>[];
    final _bodypartList = await bodyinjuredpresenter.getBodyInjuredList(
      isLoading: true,
    );
    for (var facilityType_list in _bodypartList) {
      bodyinjuredList.add(facilityType_list);
      BufferBodyInjuredList.add(facilityType_list);
    }

    BodyInjuredListPaginationController = PaginationController(
      rowCount: bodyinjuredList.length,
      rowsPerPage: 10,
    );
    update(['Bodyinjured_list']);
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createBodyInjured() async {
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

      BodyInjeredTypeModel createCheckpoint = BodyInjeredTypeModel(
          name: _title, description: _description, sequence_no: 0);
      print("OUT ");
      var facilitylistJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await bodyinjuredpresenter.createBodyInjured(
        bodyInjuredJsonString: facilitylistJsonString,
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
      getBodyInjuredList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateBodyInjured(id) async {
    String _name = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    BodyInjeredTypeModel createbodyinjured = BodyInjeredTypeModel(
      id: id,
      name: _name,
      description: _description,
      sequence_no: id,
    );
    var bodyinjuredJsonString = createbodyinjured.toJson();

    print({"businessTypeJsonString", bodyinjuredJsonString});
    await bodyinjuredpresenter.updateBodyInjured(
      bodyInjuredJsonString: bodyinjuredJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({String? bodypart_id, String? bodypart}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Body Part ?',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$bodypart]",
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
                  deleteBodyInjured(bodypart_id).then((value) {
                    Get.back();
                    getBodyInjuredList();
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

  Future<void> deleteBodyInjured(String? bodypart_id) async {
    {
      await bodyinjuredpresenter.deleteBodyInjured(
        bodypart_id,
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
