import 'dart:async';

import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/request_calibration_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/business_list_model.dart';
import '../../domain/models/calibration_list_model.dart';
import '../home/home_controller.dart';
import '../navigators/app_pages.dart';
import 'calibration_list_presenter.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';

class CalibrationListController extends GetxController {
  ///
  CalibrationListController(
    this.calibrationListPresenter,
  );
  CalibrationListPresenter calibrationListPresenter;
  final HomeController homecontroller = Get.find();

  TextEditingController previousDateController =
      TextEditingController(text: "");
  TextEditingController nextDueDateController = TextEditingController(text: "");

  RxList<BusinessListModel?> venderNameList = <BusinessListModel>[].obs;
  Rx<bool> isVenderNameSelected = true.obs;
  Rx<String> selectedVender = ''.obs;
  int selectedvenderId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<CalibrationListModel?> calibrationList = <CalibrationListModel?>[].obs;
  RxList<CalibrationListModel?> filteredData = <CalibrationListModel>[].obs;

  CalibrationListModel? calibrationListModel;
  RxList<String> CalibrationListTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  var commentCtrlr = TextEditingController();
  RxList<BusinessTypeModel?> businessCategoryList = <BusinessTypeModel>[].obs;
  Rx<bool> isSelectedBusinessType = true.obs;
  Rx<String?> selectedBusinessType = ''.obs;
  int selectedBusinessTypeId = 0;

  var isToggleOn = false.obs;
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Calibration Id": true,
    "Equipment Category": true,
    "Equipment Name": true,
    "Serial No.": true,
    // "Schedule Start Date": true,
    // "Calibration Certificates":true,
    // "Installation date":true,
    "Last Done date": true,
    "Due Date": true, "Done date": true,

    "Frequency": true,
    "Is Damage": true,
  });
  final Map<String, double> columnwidth = {
    "Calibration Id": 200,
    "Equipment Category": 200,
    "Equipment Name": 250,
    "Serial No.": 200,
    // "Schedule Start Date": 200,
    // "Calibration Certificates":250,
    // "Installation date":250,
    "Last Done date": 200,
    "Due Date": 200, "Done date": 200,

    "Frequency": 150, "Is Damage": 150,

    // "Status",
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  Rx<bool> isLoading = true.obs;
  RxString categoryFilterText = ''.obs;
  RxString titleFilterText = ''.obs;
  RxString lastDoneDateFilterText = ''.obs;
  RxString dueDateFilterText = ''.obs;
  RxString srNoFilterText = ''.obs;
  RxString calibrationIdText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString schedulestartFilterText = ''.obs;
  RxString isDamage = ''.obs;

  ///
  @override
  void onInit() async {
    this.filterText = {
      "Calibration Id": calibrationIdText,
      "Equipment Category": categoryFilterText,
      "Equipment Name": titleFilterText,
      "Serial No.": srNoFilterText,
      // "Calibration Certificates":,
      // "Installation date":,
      "Last Done date": lastDoneDateFilterText,
      "Due Date": dueDateFilterText,
      "Done date": schedulestartFilterText,

      "Frequency": frequencyFilterText, "Is Damage": isDamage,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 1), () {
          getBusinessTypeList();
        });
        Future.delayed(Duration(seconds: 1), () {
          getCalibrationList(facilityId, false);
        });
      }
    });

    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      calibrationList.value = filteredData;
      return;
    }

    List<CalibrationListModel?> filteredList = filteredData
        .where((item) =>
            (item?.asset_name?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.asset_serial
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.frequency_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.category_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.next_calibration_due_date
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.last_calibration_date
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.frequency_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    calibrationList.value = filteredList;

    // pmTaskList.value = filteredData
    //     .where((item) => item!.maintenance_order_number!
    //         .toLowerCase()
    //         .contains(keyword.toLowerCase()))
    //     .toList();
  }

  Future<void> getCalibrationList(int facilityId, bool isLoading) async {
    calibrationList.value = <CalibrationListModel>[];
    final _calibrationList = await calibrationListPresenter.getCalibrationList(
        facilityId: facilityId, isLoading: isLoading);
    if (_calibrationList != null) {
      calibrationList.value = _calibrationList;
      filteredData.value = calibrationList.value;
    }
  }

  Future<void> getBusinessTypeList() async {
    // if(isSelectedBusinessType == true ){
    //   businessCategoryList.value = <BusinessTypeModel>[];
    // }else{
    print("$selectedBusinessTypeId");
    final list = await calibrationListPresenter.getBusinessTypeList();

    for (var _equipmentCategoryList in list) {
      businessCategoryList.add(_equipmentCategoryList);
    }
    // if(selectedBusinessType.value != '')

    //   print("$selectedBusinessTypeId");
    //
    //   getBusinessList(selectedBusinessTypeId, true);
    // }
    // print("$selectedBusinessTypeId");
    // }
    // selectedBusinessType.value = businessCategoryList[0]?.name!;
    // selectedBusinessTypeId = businessCategoryList[0]?.id??0;
  }

  void getVenderNameList(int selectedBusinessTypeId, int facilityId) async {
    venderNameList.value = <BusinessListModel>[];
    final _venderNameList = await calibrationListPresenter.getVenderNameList(
      facilityId: facilityId,
      isLoading: true,
      businessType: selectedBusinessTypeId,
    );
    for (var supplier_list in _venderNameList) {
      venderNameList.add(supplier_list);
    }
  }

  Future<void> calibrationHistory() async {
    Get.toNamed(
      Routes.CalibrationHistory,
    );
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<BusinessListModel>):
        {
          if (value != "Please Select") {
            int facilityIndex =
                venderNameList.indexWhere((x) => x?.name == value);
            selectedvenderId = venderNameList[facilityIndex]?.id ?? 0;
          } else {
            selectedvenderId = 0;
          }
        }
        break;
      case const (RxList<BusinessTypeModel>):
        {
          if (value != "Please Select") {
            int equipmentIndex =
                businessCategoryList.indexWhere((x) => x?.name == value);
            selectedBusinessTypeId =
                businessCategoryList[equipmentIndex]?.id ?? 0;
            selectedBusinessType.value = value;
            
            getVenderNameList(selectedBusinessTypeId, facilityId);
          } else {
            selectedBusinessTypeId = 0;
          }
        }

        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  void requestCalibration(
      {required int calibrationId, required int assetsId}) async {
    String _nextDueDate = nextDueDateController.text.trim();
    // String _previousDate = previousDateController.text.trim();
    RequestCalibrationModel requestCalibrationModel = RequestCalibrationModel(
        vendorId: selectedvenderId,
        nextCalibrationDate: _nextDueDate,
        assetId: assetsId,
        id: calibrationId);

    var requestCalibrationJsonString = requestCalibrationModel.toJson();

    final response = await calibrationListPresenter.requestCalibration(
      requestCalibration: requestCalibrationJsonString,
      isLoading: true,
    );
    if (response == true) {
      getCalibrationList(facilityId, true);
    }
  }

  Future<void> startCalibration(String? calibrationId) async {
    {
      final response = await calibrationListPresenter.startCalibration(
        calibrationId,
        isLoading: true,
      );
      if (response == true) {
        getCalibrationList(facilityId, true);
      }
    }
  }

  void isStartCalibrationDialog(
      {String? calibrationId, String? calibrationName}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.compass_calibration,
              size: 35, color: ColorValues.appGreenColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to start the calibration for',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: calibrationName,
                    style: TextStyle(
                      color: ColorValues.appDarkBlueColor,
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
                  Get.back();
                  startCalibration(calibrationId);
                  // .then((value) {
                  //   Get.back();
                  // });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  rejectRequestCalibration(calibrationId) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: int.tryParse(calibrationId), comment: _comment);

      var rejectCalibrationtoJsonString = commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", rejectCalibrationtoJsonString});
      final response = await calibrationListPresenter.rejectRequestCalibration(
        rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
        isLoading: true,
      );
      if (response == true) {
        getCalibrationList(facilityId, true);
      }
    }
  }

  approveRequestCalibration(calibrationId) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: int.tryParse(calibrationId), comment: _comment);

      var approveCalibrationtoJsonString = commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      final response = await calibrationListPresenter.approveRequestCalibration(
        approveCalibrationtoJsonString: approveCalibrationtoJsonString,
        isLoading: true,
      );
      if (response == true) {
        getCalibrationList(facilityId, true);
      }
    }
  }

  approveCloseCalibration(calibrationId) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: int.tryParse(calibrationId), comment: _comment);

      var approveCalibrationtoJsonString = commentCalibrationModel.toJson();
      print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      final response = await calibrationListPresenter.approveCloseCalibration(
        approveCalibrationtoJsonString: approveCalibrationtoJsonString,
        isLoading: true,
      );
      if (response == true) {
        getCalibrationList(facilityId, true);
      }
    }
  }

  rejectCloseCalibration(calibrationId) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: int.tryParse(calibrationId), comment: _comment);

      var rejectCalibrationtoJsonString = commentCalibrationModel.toJson();
      print({"rejectCalibrationJsonString", rejectCalibrationtoJsonString});
      final response = await calibrationListPresenter.rejectCloseCalibration(
        rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
        isLoading: true,
      );
      if (response == true) {
        getCalibrationList(facilityId, true);
      }
    }
  }

  skipCalibration(calibrationId) async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: int.tryParse(calibrationId), comment: _comment);

      var skipCalibrationtoJsonString = commentCalibrationModel.toJson();
      print({
        "rejectCalskipCalibrationibrationJsonString",
        skipCalibrationtoJsonString
      });
      final response = await calibrationListPresenter.skipCalibration(
        skipCalibrationtoJsonString: skipCalibrationtoJsonString,
        isLoading: true,
      );
      if (response == true) {
        getCalibrationList(facilityId, true);
      }
    }
  }

  closeCalibration(calibrationId) async {
    {
      String _comment = commentCtrlr.text.trim();

      var closeCalibrationtoJsonString = {
        "calibration_id": int.tryParse(calibrationId),
        "comment": _comment
      }; // commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", closeCalibrationtoJsonString});
      final response = await calibrationListPresenter.closeCalibration(
        closeCalibrationtoJsonString: closeCalibrationtoJsonString,
        isLoading: true,
      );
      if (response == true) {
        getCalibrationList(facilityId, true);
      }
    }
  }

  // completeCalibration(calibrationId) async {
  //   {
  //     String _comment = commentCtrlr.text.trim();

  //     var completeCalibrationtoJsonString = {
  //       "calibration_id": int.tryParse(calibrationId),
  //       "comment": _comment,
  //       "is_damaged": isToggleOn == true ? 1 : 0
  //     };
  //     // print({"rejectCalibrationJsonString", completeCalibrationtoJsonString});
  //     final response = await calibrationListPresenter.completeCalibration(
  //       completeCalibrationtoJsonString: completeCalibrationtoJsonString,
  //       isLoading: true,
  //     );
  //     if (response == true) {
  //       getCalibrationList(facilityId, true);
  //     }
  //   }
  // }

  void isCommentCalibrationDialog(
      {String? calibrationId, String? calibrationName, int? type}) {
    Get.dialog(
      AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  type == 1
                      ? "Reject Requested Calibration"
                      : type == 2
                          ? "Approve Requested Calibration"
                          : type == 3
                              ? "Close Calibration"
                              : type == 4
                                  ? "Approve Close Calibration"
                                  : type == 6
                                      ? "Skip Calibration"
                                      : "Reject Close Calibration ",
                  style: TextStyle(
                    color: ColorValues.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: ColorValues.appDarkGreyColor,
              ),
              Row(
                children: [
                  Text(
                    "Asset Name: ",
                    style: Styles.black17,
                  ),
                  Text(
                    "${calibrationName}",
                    style: Styles.blue17,
                  ),
                ],
              ),
              Dimens.boxHeight10,
              Text(
                "Remarks:",
                style: Styles.blackBold15,
              ),
              Dimens.boxWidth10,
              Container(
                width: (Get.width * .2),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: ColorValues.whiteColor,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16.0, height: 1.0, color: Colors.black),
                  ),
                  controller: commentCtrlr,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: ColorValues.whiteColor,
                    filled: true,
                    contentPadding: Dimens.edgeInsets05_10,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 35,
                //  width: (Get.width * .2) - 90,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.redColor,
                  text: "Cancel",
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Dimens.boxWidth20,
              Container(
                height: 35,
                //  width: (Get.width * .2) - 90,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  text: "Submit",
                  onPressed: () {
                    Get.back();

                    type == 1
                        ? rejectRequestCalibration(calibrationId)
                        : type == 2
                            ? approveRequestCalibration(calibrationId)
                            : type == 3
                                ? closeCalibration(calibrationId)
                                : type == 4
                                    ? approveCloseCalibration(calibrationId)
                                    : type == 6
                                        ? skipCalibration(calibrationId)
                                        : rejectCloseCalibration(calibrationId);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void isCompleteCalibrationDialog({
    String? calibrationId,
    String? calibrationName,
  }) {
    Get.dialog(
      AlertDialog(
        content: Obx(
          () => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Complete Calibration",
                    style: TextStyle(
                      color: ColorValues.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  color: ColorValues.appDarkGreyColor,
                ),
                Row(
                  children: [
                    Text(
                      "Asset Name: ",
                      style: Styles.black17,
                    ),
                    Text(
                      "${calibrationName}",
                      style: Styles.blue17,
                    ),
                  ],
                ),
                Dimens.boxHeight10,
                Text(
                  "Remarks:",
                  style: Styles.blackBold15,
                ),
                Dimens.boxWidth10,
                Container(
                  width: (Get.width * .2),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: ColorValues.whiteColor,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    color: ColorValues.whiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 16.0, height: 1.0, color: Colors.black),
                    ),
                    controller: commentCtrlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: ColorValues.whiteColor,
                      filled: true,
                      contentPadding: Dimens.edgeInsets05_10,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Any Damage: ",
                      style: Styles.black17,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: CustomSwitchTroggle(
                          value: isToggleOn.value,
                          onChanged: (value) {
                            toggle();
                          }),
                    ),
                  ],
                )
              ]),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 35,
                //  width: (Get.width * .2) - 90,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.redColor,
                  text: "Cancel",
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Dimens.boxWidth20,
              Container(
                height: 35,
                //  width: (Get.width * .2) - 90,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  text: "Submit",
                  onPressed: () {
                    Get.back();
                    //completeCalibration(calibrationId);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void calibrationRequest({
    required String equipmentName,
    required String previousDate,
    required String nextDate,
    required String calibrationId,
    required String asset_id,
  }) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Row(
            children: [
              Text(
                'Asset Calibration',
                textAlign: TextAlign.center,
                style: Styles.blackBold20,
              ),
              Text(
                ': ${equipmentName}',
                textAlign: TextAlign.center,
                style: Styles.black18,
              ),
            ],
          ),
        ],
      ),
      content: Builder(builder: (context) {
        var height = Get.height;
        previousDateController.text = previousDate;
        nextDueDateController.text = nextDate;

        return Obx(
          () => Container(
            margin: Dimens.edgeInsets15,
            padding: Dimens.edgeInsets25,
            height: height / 2.5,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorValues.appBlueBackgroundColor,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorValues.appBlueBackgroundColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Last Calibration"),
                          Text("                         Date:"),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(
                                  2.0,
                                  3.0,
                                ),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: Get.width / 5,
                          child: LoginCustomTextfield(
                            enabled: false,
                            textController: previousDateController,
                            ontap: () {
                              _selectDate(context, 1);
                            },
                            widget: Icon(
                              Icons.calendar_month,
                              color: ColorValues.greyLightColor,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Due Date For "),
                          Text("             Calibration:"),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(
                                  2.0,
                                  3.0,
                                ),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: Get.width / 5,
                          child: LoginCustomTextfield(
                            enabled: false,
                            textController: nextDueDateController,
                            ontap: () {
                              _selectDate(context, 2);
                            },
                            widget: Icon(
                              Icons.calendar_month,
                              color: ColorValues.greyLightColor,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bussiness Type :"),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                2.0,
                                3.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          color: ColorValues.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: Get.width / 5,
                        child: DropdownWebWidget(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: ColorValues.whiteColor,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          dropdownList: businessCategoryList,
                          isValueSelected: isSelectedBusinessType.value,
                          selectedValue: selectedBusinessType.value,
                          onValueChanged: onValueChanged,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vender Name :"),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                2.0,
                                3.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          color: ColorValues.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: Get.width / 5,
                        child: DropdownWebWidget(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: ColorValues.whiteColor,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          dropdownList: venderNameList,
                          isValueSelected: isVenderNameSelected.value,
                          selectedValue: selectedVender.value,
                          onValueChanged: onValueChanged,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomElevatedButton(
                      text: "Cancel",
                      onPressed: () {
                        Get.back();
                      },
                      backgroundColor: ColorValues.appRedColor,
                      textColor: ColorValues.whiteColor,
                    ),
                    Dimens.boxWidth30,
                    CustomElevatedButton(
                      text: "Start",
                      onPressed: () {
                        requestCalibration(
                          calibrationId: int.tryParse(calibrationId) ?? 0,
                          assetsId: int.tryParse(asset_id) ?? 0,
                        );
                        Get.back();
                      },
                      backgroundColor: ColorValues.appGreenColor,
                      textColor: ColorValues.whiteColor,
                    ),
                  ]),
                ]),
          ),
        );
      }),
      actions: [],
    ));
  }

  Future<void> _selectDate(BuildContext context, int type) async {
    DateTime today = DateTime.now();
    var date = await showDatePicker(
      context: context,
      cancelText: "Clear",
      confirmText: "Ok",
      initialDate: DateTime(today.year, today.month, today.day),
      firstDate: DateTime(1900),
      lastDate: DateTime(today.year + 18, today.month, today.day),
    );
    if (type == 1) {
      previousDateController.text = date.toString().substring(0, 10);
    } else {
      nextDueDateController.text = date.toString().substring(0, 10);
    }
  }

  void clearStoreData() {
    calibrationListPresenter.clearValue();
  }
}
