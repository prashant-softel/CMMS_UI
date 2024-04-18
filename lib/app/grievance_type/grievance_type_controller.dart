import 'dart:async';

import 'package:cmms/app/grievance_type/grievance_type_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/domain/models/grievance_type_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class GrievanceTypeController extends GetxController {
  GrievanceTypeController(this.grievanceTypePresenter);

  GrievanceTypePresenter grievanceTypePresenter;
  final HomeController homeController = Get.find();

  GrievanceTypeModel? selectedItem;
  GrievanceTypeModel? selectedItemupdate;
  Rx<bool> isFormInvalid = false.obs;
  RxBool isCheckedRequire = false.obs;
  RxBool isContainerVisible = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isChecked = true.obs;
  int facilityId = 0;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  int? grievanceTypeId = 0;
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<GrievanceTypeModel?>? grievanceTypeList = <GrievanceTypeModel>[].obs;
  RxList<GrievanceTypeModel?>? BufferSPVList = <GrievanceTypeModel>[].obs;
  Rx<bool> isSPVListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<GrievanceTypeModel> filteredData = <GrievanceTypeModel>[].obs;

  PaginationController GrievanceTypeListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      grievanceTypeList!.value = BufferSPVList!.value;
      return;
    }
    List<GrievanceTypeModel?> filteredList = BufferSPVList!
        .where((item) =>
            (item?.id
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.description
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    grievanceTypeList?.value = filteredList;
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  FocusNode titleFocus = FocusNode();
  ScrollController titleScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getGrievanceTypeList();
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

  Future<void> getGrievanceTypeList() async {
    grievanceTypeList?.value = <GrievanceTypeModel>[];
    BufferSPVList?.value = <GrievanceTypeModel>[];
    final List<GrievanceTypeModel?>? _grievanceTypeList =
        await grievanceTypePresenter.getGrievanceType(
      isLoading: isLoading.value,
    );
    if (_grievanceTypeList != null) {
      isLoading.value = false;
      // for (var facilityType_list in _grievanceTypeList) {}
    }
    grievanceTypeList?.value = _grievanceTypeList!;
    BufferSPVList?.value = _grievanceTypeList!;
    GrievanceTypeListPaginationController = PaginationController(
      rowCount: grievanceTypeList!.length,
      rowsPerPage: 10,
    );
    update(['grievance_type_list']);
  }

  Future<void> getGrievanceTypeById({int? grievanceTypeId}) async {
    grievanceTypeList?.value = <GrievanceTypeModel>[];
    BufferSPVList?.value = <GrievanceTypeModel>[];
    final GrievanceTypeModel? _grievanceTypeList =
        await grievanceTypePresenter.getGrievanceTypeById(
      grievanceTypeId: grievanceTypeId,
      isLoading: isLoading.value,
    );
    if (_grievanceTypeList != null) {
      isLoading.value = false;
    }
    selectedItem = _grievanceTypeList!;
    GrievanceTypeListPaginationController = PaginationController(
      rowCount: grievanceTypeList!.length,
      rowsPerPage: 10,
    );
    print("selected Item: ${selectedItem}");
    titleCtrlr.text = selectedItem!.name!;
    descriptionCtrlr.text = selectedItem!.description!;
    update(['grievance_type_by_id']);
  }

  Future<bool> createGrievanceType() async {
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

      GrievanceTypeModel grievanceTypeJson = GrievanceTypeModel(
        id: 0,
        name: _title,
        description: _description,
        status: 0,
      );

      var grievanceJson = grievanceTypeJson.toJson();
      print({"checkpointJsonString", grievanceJson});
      await grievanceTypePresenter.createGrievanceType(
        grievanceJson: grievanceJson,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {
      cleardata(),
    };
  }

  cleardata() {
    titleCtrlr.clear();
    descriptionCtrlr.clear();
    Future.delayed(Duration(seconds: 1), () {
      getGrievanceTypeList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateGrievanceType({required int grievanceTypeId}) async {
    int _id = grievanceTypeId;
    String _name = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    GrievanceTypeModel grievanceTypeJson = GrievanceTypeModel(
      id: _id,
      name: _name,
      description: _description,
      status: 0,
    );

    var grievanceJson = grievanceTypeJson.toJson();
    print({"Grievance", grievanceJson});
    await grievanceTypePresenter.updateGrievanceType(
      grievanceJson: grievanceJson,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({int? grievanceTypeId, String? name}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Grievance Type ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$name]",
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
                  deleteGrievanceType(grievanceTypeId: grievanceTypeId).then(
                    (value) {
                      Get.back();
                      getGrievanceTypeList();
                    },
                  );
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deleteGrievanceType({int? grievanceTypeId}) async {
    {
      await grievanceTypePresenter.deleteGrievanceType(
        grievanceTypeId: grievanceTypeId,
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
