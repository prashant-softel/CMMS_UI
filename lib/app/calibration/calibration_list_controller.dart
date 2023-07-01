import 'dart:async';

import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/request_calibration_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  RxList<CalibrationListModel?>? calibrationList =
      <CalibrationListModel?>[].obs;
  CalibrationListModel? calibrationListModel;
  RxList<String> CalibrationListTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  var commentCtrlr = TextEditingController();

  var isToggleOn = false.obs;
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getCalibrationList(facilityId, false);
      });
    });
    Future.delayed(Duration(seconds: 1), () {
      getVenderNameList();
    });
    super.onInit();
  }

  Future<void> getCalibrationList(int facilityId, bool isLoading) async {
    calibrationList?.value = <CalibrationListModel>[];
    final _calibrationList = await calibrationListPresenter.getCalibrationList(
        facilityId: facilityId, isLoading: isLoading);
    if (_calibrationList != null) {
      calibrationList!.value = _calibrationList;
      paginationController = PaginationController(
        rowCount: calibrationList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (calibrationList != null && calibrationList!.isNotEmpty) {
        calibrationListModel = calibrationList![0];
        var calibrationListJson = calibrationListModel?.toJson();
        CalibrationListTableColumns.value = <String>[];
        for (var key in calibrationListJson?.keys.toList() ?? []) {
          CalibrationListTableColumns.add(key);
        }
      }
    }
  }

  void getVenderNameList() async {
    venderNameList.value = <BusinessListModel>[];
    final _venderNameList = await calibrationListPresenter.getVenderNameList(
      isLoading: true,
      businessType: 4,
    );
    if (_venderNameList != null) {
      for (var supplier_list in _venderNameList) {
        venderNameList.add(supplier_list);
      }
    }
  }

  Future<void> calibrationHistory() async {
    Get.toNamed(
      Routes.CalibrationHistory,
    );
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<BusinessListModel>:
        {
          int facilityIndex =
              venderNameList.indexWhere((x) => x?.name == value);
          selectedvenderId = venderNameList[facilityIndex]?.id ?? 0;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void requestCalibration(int calibrationId) async {
    String _nextDueDate = nextDueDateController.text.trim();
    // String _previousDate = previousDateController.text.trim();
    RequestCalibrationModel requestCalibrationModel = RequestCalibrationModel(
        vendorId: selectedvenderId,
        nextCalibrationDate: _nextDueDate,
        assetId: calibrationId);

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

  completeCalibration(calibrationId) async {
    {
      String _comment = commentCtrlr.text.trim();

      var completeCalibrationtoJsonString = {
        "calibration_id": int.tryParse(calibrationId),
        "comment": _comment,
        "is_damaged": isToggleOn == true ? 1 : 0
      };
      // print({"rejectCalibrationJsonString", completeCalibrationtoJsonString});
      final response = await calibrationListPresenter.completeCalibration(
        completeCalibrationtoJsonString: completeCalibrationtoJsonString,
        isLoading: true,
      );
      if (response == true) {
        getCalibrationList(facilityId, true);
      }
    }
  }

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
                    completeCalibration(calibrationId);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
