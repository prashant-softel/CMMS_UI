import 'dart:async';

import 'package:cmms/app/calibration_view/calibration_view_presenter.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/calibration_detail_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CalibrationViewController extends GetxController {
  ///
  CalibrationViewController(
    this.calibrationViewPresenter,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  CalibrationViewPresenter calibrationViewPresenter;
  final HomeController homecontroller = Get.find();

  Rx<CalibrationDetailModel?> calibrationDetailModel =
      CalibrationDetailModel().obs;
  RxList<FileList?>? file_list = <FileList>[].obs;
  RxList<FileList?>? file_list_calibration = <FileList>[].obs;

  var isToggleOn = false.obs;
  int moduleType = 101;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  var commentCtrlr = TextEditingController();
  Rx<int> calibrationId = 0.obs;
  List<dynamic>? files = [];
  Rx<bool> isFormInvalid = false.obs;

  @override
  void onInit() async {
    await setcalibrationId();

    facilityIdStreamSubscription =
        homecontroller.facilityId$.listen((event) async {
      facilityId = event;
      if (calibrationId.value > 0) {
        await getCalibrationView(
            calibrationId: calibrationId.value,
            isloading: true,
            facilityId: facilityId);
        await getHistory(
            calibrationId: calibrationId.value, moduleType: moduleType);
      }
    });

    super.onInit();
  }

  Future<void> setcalibrationId() async {
    final String? _calibrationId = Get.parameters['calibrationId'];
    calibrationId.value = int.tryParse(_calibrationId ?? "") ?? 0;

    // try {
    //   final _calibrationId = await calibrationViewPresenter.getValue();

    //   //  String? _calibrationId = await _flutterSecureStorage.read(key: "pmTaskId");
    //   if (_calibrationId == null ||
    //       _calibrationId == '' ||
    //       _calibrationId == "null") {
    //     var dataFromPreviousScreen = Get.arguments;

    //     calibrationId.value = dataFromPreviousScreen['calibrationId'];
    //     calibrationViewPresenter.saveValue(
    //         calibrationId: calibrationId.value.toString());

    //     // await _flutterSecureStorage.write(
    //     //   key: "pmTaskId",
    //     //   value: calibrationId.value == null ? '' : calibrationId.value.toString(),
    //     // );
    //   } else {
    //     calibrationId.value = int.tryParse(_calibrationId) ?? 0;
    //   }
    //   //  await _flutterSecureStorage.delete(key: "calibrationId");
    // } catch (e) {
    //   Utility.showDialog(e.toString(), 'calibrationId');
    // }
  }

  Future<void> getHistory({int? calibrationId, int? moduleType}) async {
    //
    historyList?.value = await calibrationViewPresenter.getHistory(
          moduleType,
          calibrationId,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getCalibrationView(
      {int? calibrationId, bool? isloading, required int facilityId}) async {
//calibrationId = 5326;
    final _calibrationDetails =
        await calibrationViewPresenter.getCalibrationView(
            calibrationId: calibrationId,
            isloading: isloading,
            facilityId: facilityId);
    print({"vasddf", _calibrationDetails});
    if (_calibrationDetails != null) {
      calibrationDetailModel.value = _calibrationDetails;
      file_list?.value = calibrationDetailModel.value?.fileList ?? [];
      List<int?> fileid = file_list!.map((element) => element!.id).toList();
      print("files while getting ${fileid}");
      files!.addAll(fileid);

      isToggleOn.value =
          calibrationDetailModel.value?.isDamaged == 1 ? true : false;
    }
  }

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  completeCalibration({List<dynamic>? fileIds}) async {
    checkform();
    if (isFormInvalid.value) {
      return;
    }
    String _comment = commentCtrlr.text.trim();

    var completeCalibrationtoJsonString = {
      "calibration_id": calibrationId.value,
      "comment": _comment,
      "is_damaged": isToggleOn == true ? 1 : 0,
      "uploaded_file_id": fileIds
    };
    // print({"rejectCalibrationJsonString", completeCalibrationtoJsonString});
    final response = await calibrationViewPresenter.completeCalibration(
      completeCalibrationtoJsonString: completeCalibrationtoJsonString,
      isLoading: true,
    );
    // if (response == true) {
    //   getCalibrationList(facilityId, true);
    // }
  }

  rejectRequestCalibration() async {
    {
      checkform();
      if (isFormInvalid.value) {
        return;
      }
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: calibrationId.value, comment: _comment);

      var rejectCalibrationtoJsonString = commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", rejectCalibrationtoJsonString});
      final response = await calibrationViewPresenter.rejectRequestCalibration(
        rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
        isLoading: true,
      );
    }
  }

  approveRequestCalibration() async {
    {
      checkform();
      if (isFormInvalid.value) {
        return;
      }
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: calibrationId.value, comment: _comment);

      var approveCalibrationtoJsonString = commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      final response = await calibrationViewPresenter.approveRequestCalibration(
        approveCalibrationtoJsonString: approveCalibrationtoJsonString,
        isLoading: true,
      );
    }
  }

  approveCloseCalibration() async {
    {
      checkform();
      if (isFormInvalid.value) {
        return;
      }
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: calibrationId.value, comment: _comment);

      var approveCalibrationtoJsonString = commentCalibrationModel.toJson();
      print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      final response = await calibrationViewPresenter.approveCloseCalibration(
        approveCalibrationtoJsonString: approveCalibrationtoJsonString,
        isLoading: true,
      );
    }
  }

  rejectCloseCalibration() async {
    {
      checkform();
      if (isFormInvalid.value) {
        return;
      }
      String _comment = commentCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: calibrationId.value, comment: _comment);

      var rejectCalibrationtoJsonString = commentCalibrationModel.toJson();
      print({"rejectCalibrationJsonString", rejectCalibrationtoJsonString});
      final response = await calibrationViewPresenter.rejectCloseCalibration(
        rejectCalibrationtoJsonString: rejectCalibrationtoJsonString,
        isLoading: true,
      );
    }
  }

  closeCalibration() async {
    {
      checkform();
      if (isFormInvalid.value) {
        return;
      }
      String _comment = commentCtrlr.text.trim();

      var closeCalibrationtoJsonString = {
        "id": calibrationId.value,
        "comment": _comment
      }; // commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", closeCalibrationtoJsonString});
      final response = await calibrationViewPresenter.closeCalibration(
        closeCalibrationtoJsonString: closeCalibrationtoJsonString,
        isLoading: true,
      );
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
                text: 'Are you sure you want to start the calibration for ',
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

  Future<void> startCalibration(String? calibrationId) async {
    {
      final response = await calibrationViewPresenter.startCalibration(
        calibrationId,
        isLoading: true,
      );
      // if (response == true) {
      //   getCalibrationList(facilityId, true);
      // }
    }
  }

  void checkform() {
    if (commentCtrlr.text == '') {
      Fluttertoast.showToast(msg: 'Enter Comment!');
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
