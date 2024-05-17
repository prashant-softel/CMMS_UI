// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/type_water_master/type_water_master_presenter.dart';
import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WaterTypeMasterController extends GetxController {
  WaterTypeMasterController(this.waterTypeMasterPresenter);

  WaterTypeMasterPresenter waterTypeMasterPresenter;
  final HomeController homeController = Get.find();

  WaterSource? selectedItem;
  WaterSource? selectedItemupdate;
  Rx<bool> isFormInvalid = false.obs;
  RxBool isCheckedRequire = false.obs;
  RxBool isContainerVisible = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  RxList<WaterSource?> typeOfWaterList = <WaterSource>[].obs;
  //checkbox
  RxBool isChecked = true.obs;
  int facilityId = 0;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  var isToggleOn = false.obs;
  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  int? waterTypeId = 0;
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<WaterSource?>? waterTypeMasterList = <WaterSource>[].obs;
  RxList<WaterSource?>? BufferWaterTypeMasterList = <WaterSource>[].obs;
  RxList<WaterSource> filteredData = <WaterSource>[].obs;

  PaginationController waterTypeMasterListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      waterTypeMasterList!.value = BufferWaterTypeMasterList!.value;
      return;
    }
    List<WaterSource?> filteredList = BufferWaterTypeMasterList!
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
    waterTypeMasterList?.value = filteredList;
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
        getTypeOfWaterList();
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

  Future<void> getTypeOfWaterList() async {
    waterTypeMasterList?.value = <WaterSource>[];
    BufferWaterTypeMasterList?.value = <WaterSource>[];
    final List<WaterSource?>? _waterTypeMasterList =
        await waterTypeMasterPresenter.getTypeOfWaterList(
      isLoading: isLoading.value,
      facilityId: facilityId,
    );
    if (_waterTypeMasterList != null) {
      isLoading.value = false;
      // for (var facilityType_list in _waterTypeMasterList) {}
    }
    waterTypeMasterList?.value = _waterTypeMasterList!;
    BufferWaterTypeMasterList?.value = _waterTypeMasterList!;
    waterTypeMasterListPaginationController = PaginationController(
      rowCount: waterTypeMasterList!.length,
      rowsPerPage: 10,
    );
    update(['grievance_type_list']);
  }

  Future<void> getWaterTypeById({int? waterTypeId}) async {
    waterTypeMasterList?.value = <WaterSource>[];
    BufferWaterTypeMasterList?.value = <WaterSource>[];
    final WaterSource? _waterTypeMaster =
        await waterTypeMasterPresenter.getWaterTypeById(
      waterTypeId: waterTypeId,
      isLoading: isLoading.value,
    );
    if (_waterTypeMaster != null) {
      isLoading.value = false;
    }
    selectedItem = _waterTypeMaster!;
    waterTypeMasterListPaginationController = PaginationController(
      rowCount: waterTypeMasterList!.length,
      rowsPerPage: 10,
    );
    print("selected Item: ${selectedItem}");
    waterTypeId = selectedItem?.id;
    titleCtrlr.text = selectedItem!.name!;
    descriptionCtrlr.text = selectedItem!.description!;
    // isToggleOn.value = selectedItem?.show_opening != null ? true : false;
    update(['grievance_type_by_id']);
  }

  Future<bool> createWaterType() async {
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
    if (isFormInvalid.value == true) {
      return false;
    }
    if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      int? _id = waterTypeId;
      String _title = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();
      int _facilityId = facilityId;

      WaterSource waterTypeMasterJson = WaterSource(
        id: _id,
        facility_id: _facilityId,
        name: _title,
        description: _description,
        show_opening: isToggleOn.value ? 1 : 0,
      );

      var waterTypeJson = waterTypeMasterJson.toJson();
      print({"water type json string", waterTypeJson});
      await waterTypeMasterPresenter.createWaterType(
        waterTypeJson: waterTypeJson,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> isSuccessfullyCreated() async {
    isSuccess.toggle();
    await {
      cleardata(),
    };
  }

  cleardata() {
    waterTypeId = 0;
    titleCtrlr.clear();
    descriptionCtrlr.clear();
    isToggleOn.value = false;
    Future.delayed(Duration(seconds: 1), () {
      getTypeOfWaterList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateWaterType({required int waterTypeId}) async {
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
    if (isFormInvalid.value == true) {
      return false;
    }

    if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      int _id = waterTypeId;
      String _name = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();
      int _facilityId = facilityId;

      WaterSource waterTypeMasterJson = WaterSource(
        id: _id,
        name: _name,
        description: _description,
        facility_id: _facilityId,
      );

      var waterTypeJson = waterTypeMasterJson.toJson();
      print({"water type update", waterTypeJson});
      await waterTypeMasterPresenter.updateWaterType(
        waterTypeJson: waterTypeJson,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  void isDeleteDialog({int? waterTypeId, String? name}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Water Type ',
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
                  deleteWaterType(waterTypeId: waterTypeId).then(
                    (value) {
                      Get.back();
                      getTypeOfWaterList();
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

  Future<void> deleteWaterType({int? waterTypeId}) async {
    {
      await waterTypeMasterPresenter.deleteWaterType(
        waterTypeId: waterTypeId,
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
