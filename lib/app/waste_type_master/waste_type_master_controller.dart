// ignore_for_file: invalid_use_of_protected_member
import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/waste_type_master/waste_type_master_presenter.dart';
import 'package:cmms/domain/models/type_of_waste_model.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WasteTypeMasterController extends GetxController {
  WasteTypeMasterController(this.wasteTypeMasterPresenter);

  WasteTypeMasterPresenter wasteTypeMasterPresenter;
  final HomeController homeController = Get.find();

  WasteSource? selectedItem;
  WasteSource? selectedItemupdate;
  Rx<bool> isFormInvalid = false.obs;
  RxBool isCheckedRequire = false.obs;
  RxBool isContainerVisible = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  RxList<WasteSource?> typeOfWasteList = <WasteSource>[].obs;
  //checkbox
  RxBool isChecked = true.obs;
  int facilityId = 0;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  int? wasteTypeId = 0;
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<WasteSource?>? wasteTypeMasterList = <WasteSource>[].obs;
  RxList<WasteSource?>? BufferWasteTypeMasterList = <WasteSource>[].obs;
  RxList<WasteSource> filteredData = <WasteSource>[].obs;

  PaginationController wasteTypeMasterListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      wasteTypeMasterList!.value = BufferWasteTypeMasterList!.value;
      return;
    }
    List<WasteSource?> filteredList = BufferWasteTypeMasterList!
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
    wasteTypeMasterList?.value = filteredList;
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
        // getTypeOfWasteList();
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

// Future<void> getTypeOfWasteList() async {
//     wasteTypeMasterList?.value = <WasteSource>[];
//     BufferWasteTypeMasterList?.value = <WasteSource>[];
//     final List<WasteSource?>? _wasteTypeMasterList =
//         await wasteTypeMasterPresenter.getTypeOfWasteList(
//       isLoading: isLoading.value,
//       facilityId: facilityId,
//     );
//     if (_wasteTypeMasterList != null) {
//       isLoading.value = false;
//       // for (var facilityType_list in _wasteTypeMasterList) {}
//     }
//     wasteTypeMasterList?.value = _wasteTypeMasterList!;
//     BufferWasteTypeMasterList?.value = _wasteTypeMasterList!;
//     wasteTypeMasterListPaginationController = PaginationController(
//       rowCount: wasteTypeMasterList!.length,
//       rowsPerPage: 10,
//     );
//     update(['grievance_type_list']);
//   }

//   Future<bool> createWasteType() async {
//     print("CREATE CONTROLLER");
//     if (titleCtrlr.text.trim() == '') {
//       isTitleInvalid.value = true;
//       isFormInvalid.value = true;
//       // isDescriptionInvalid.value = true;
//     }
//     if (descriptionCtrlr.text.trim() == '') {
//       // isTitleInvalid.value = true;
//       isFormInvalid.value = true;
//       isDescriptionInvalid.value = true;
//     }

//     checkForm();
//     if (isFormInvalid.value == true) {
//       return false;
//     }
//     if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
//       Fluttertoast.showToast(
//           msg: "Please enter required field", fontSize: 16.0);
//     } else {
//       int? _id = wasteTypeId;
//       String _title = titleCtrlr.text.trim();
//       String _description = descriptionCtrlr.text.trim();
//       // int _facilityId = facilityId;

//       WasteSource wasteTypeMasterJson = WasteSource(
//         id: _id,
//         // facility_id: _facilityId,
//         name: _title,
//         description: _description,
//       );

//       var wasteTypeJson = wasteTypeMasterJson.toJson();
//       print({"waste type json string", wasteTypeJson});
//       await wasteTypeMasterPresenter.createWasteType(
//         wasteTypeJson: wasteTypeJson,
//         isLoading: true,
//       );
//       return true;
//     }
//     return true;
//   }

//   Future<bool> updateWasteType({required int wasteTypeId}) async {
//     if (titleCtrlr.text.trim() == '') {
//       isTitleInvalid.value = true;
//       isFormInvalid.value = true;
//       // isDescriptionInvalid.value = true;
//     }
//     if (descriptionCtrlr.text.trim() == '') {
//       // isTitleInvalid.value = true;
//       isFormInvalid.value = true;
//       isDescriptionInvalid.value = true;
//     }
//     checkForm();
//     if (isFormInvalid.value == true) {
//       return false;
//     }

//     if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
//       Fluttertoast.showToast(
//           msg: "Please enter required field", fontSize: 16.0);
//     } else {
//       int _id = wasteTypeId;
//       String _name = titleCtrlr.text.trim();
//       String _description = descriptionCtrlr.text.trim();
//       // int _facilityId = facilityId;

//       WasteSource wasteTypeMasterJson = WasteSource(
//         id: _id,
//         name: _name,
//         description: _description,
//         // facility_id: _facilityId,
//       );

//       var wasteTypeJson = wasteTypeMasterJson.toJson();
//       print({"waste type update", wasteTypeJson});
//       await wasteTypeMasterPresenter.updateWasteType(
//         wasteTypeJson: wasteTypeJson,
//         isLoading: true,
//       );
//       return true;
//     }
//     return true;
//   }
  

  Future<void> isSuccessfullyCreated() async {
    isSuccess.toggle();
    await {
      cleardata(),
    };
  }

  cleardata() {
    wasteTypeId = 0;
    titleCtrlr.clear();
    descriptionCtrlr.clear();
    // Future.delayed(Duration(seconds: 1), () {
    //   getTypeOfWasteList();
    // });
    Future.delayed(Duration(seconds: 2), () {
      isSuccess.value = false;
    });
  }

  

  void isDeleteDialog({int? wasteTypeId, String? name}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Waste Type',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$name] ?",
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
                  // deleteWasteType(wasteTypeId: wasteTypeId).then(
                  //   (value) {
                  //     Get.back();
                  //     getTypeOfWasteList();
                  //   },
                  // );
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
