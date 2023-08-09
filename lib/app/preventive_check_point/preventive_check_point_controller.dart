import 'dart:async';

import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/checkpoint_list_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_checkpoint_model.dart';
import '../home/home_controller.dart';
import '../theme/color_values.dart';
import '../theme/styles.dart';
import 'preventive_check_point_presenter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PreventiveCheckPointController extends GetxController {
  PreventiveCheckPointController(
    this.preventiveCheckPointPresenter,
  );
  PreventiveCheckPointPresenter preventiveCheckPointPresenter;
  final HomeController homecontroller = Get.find();

  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  Rx<String> selectedchecklist = ''.obs;
  Rx<bool> isSelectedchecklist = true.obs;
  int facilityId = 0;
  int type = 1;
  var checkPointCtrlr = TextEditingController();
  var requirementCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  Rx<String> selectedchecklistId = "".obs;
  RxList<CheckPointModel?>? preventiveCheckpoint = <CheckPointModel?>[].obs;
  CheckPointModel? preventiveCheckpointmodel;
  CheckPointModel? selectedItem;

  RxList<String> preventiveCheckPointTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // var preventiveCheckPointModelListDetails;
  StreamSubscription<int>? facilityIdStreamSubscription;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;

      Future.delayed(Duration(seconds: 1), () {
        getPreventiveCheckList(
          facilityId,
          type,
        );
      });
    });
    super.onInit();
  }

  var isToggleOn = false.obs;
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  Future<void> getPreventiveCheckList(
    facilityId,
    type,
  ) async {
    final list = await preventiveCheckPointPresenter.getPreventiveCheckList(
        facilityId: facilityId, type: type, isLoading: true);

    if (list != null) {
      checkList.clear();

      for (var _checkList in list) {
        checkList.add(_checkList);
      }
    }
    selectedchecklist.value = checkList[0]?.name.toString() ?? '';
    selectedchecklistId.value = checkList[0]?.id.toString() ?? "";
    getCheckPointlist(selectedchecklistId: selectedchecklistId.value);
  }

  Future<bool> createCheckpoint() async {
    if (checkPointCtrlr.text.trim() == '' ||
        requirementCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _checkPoint = checkPointCtrlr.text.trim();
      String _requirement = requirementCtrlr.text.trim();
      int _checklistId = int.tryParse(selectedchecklistId.value) ?? 0;
      CreateCheckpoint createCheckpoint = CreateCheckpoint(
          check_point: _checkPoint,
          requirement: _requirement,
          checklist_id: _checklistId,
          is_document_required: isToggleOn.value ? 1 : 0,
          id: 0,
          status: 1);
      var checkpointJsonString = [
        createCheckpoint.toJson()
      ]; //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", checkpointJsonString});
      await preventiveCheckPointPresenter.createCheckPoint(
        checkpointJsonString: checkpointJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> getCheckPointlist({required String selectedchecklistId}) async {
    preventiveCheckpoint?.value = <CheckPointModel>[];
    final _preventiveCheckpoint =
        await preventiveCheckPointPresenter.getCheckPointlist(
            selectedchecklistId: int.tryParse(selectedchecklistId));

    if (_preventiveCheckpoint != null) {
      preventiveCheckpoint!.value = _preventiveCheckpoint;
      paginationController = PaginationController(
        rowCount: preventiveCheckpoint!.length,
        rowsPerPage: 10,
      );

      if (preventiveCheckpoint != null && preventiveCheckpoint!.isNotEmpty) {
        preventiveCheckpointmodel = preventiveCheckpoint![0];
        var preventiveCheckListJson = preventiveCheckpointmodel?.toJson();
        preventiveCheckPointTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          preventiveCheckPointTableColumns.add(key);
        }
      }
    }
  }

  cleardata() {
    checkPointCtrlr.text = '';
    requirementCtrlr.text = '';
    isToggleOn.value = false;
    selectedItem = null;
  }

  void issuccessCreatecheckpont() {
    isSuccess.toggle();
    checkPointCtrlr.text = '';
    requirementCtrlr.text = '';
    isToggleOn.value = false;
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getCheckPointlist(selectedchecklistId: selectedchecklistId.value);
    });
    Future.delayed(Duration(seconds: 4), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? check_point_id, String? check_point}) {
    Get.dialog(
      AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${check_point}", style: Styles.blackBold16),
              Divider(
                color: ColorValues.appLightGreyColor,
              ),
              Dimens.boxHeight5,
              RichText(
                text: TextSpan(
                    text: 'Are you sure you want to delete the checkpoint ',
                    style: Styles.blackBold16,
                    children: [
                      TextSpan(
                        text: check_point,
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
              CustomElevatedButton(
                  backgroundColor: ColorValues.appRedColor,
                  onPressed: () {
                    Get.back();
                  },
                  text: 'No'),
              CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  onPressed: () {
                    deleteCkeckpoint(check_point_id).then((value) {
                      Get.back();
                      getCheckPointlist(
                          selectedchecklistId: selectedchecklistId.value);
                    });
                  },
                  text: 'Yes'),
            ],
          )
        ],
      ),
    );
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<PreventiveCheckListModel>:
        {
          int checklistIndex = checkList.indexWhere((x) => x?.name == value);
          selectedchecklistId.value =
              checkList[checklistIndex]?.id.toString() ?? "";
          getCheckPointlist(selectedchecklistId: selectedchecklistId.value);
        }

        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> deleteCkeckpoint(String? check_point_id) async {
    {
      await preventiveCheckPointPresenter.deleteCkeckpoint(
        check_point_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateCheckPoint(checkPontId) async {
    String _checkPoint = checkPointCtrlr.text.trim();
    String _requirement = requirementCtrlr.text.trim();
    int _checklistId = int.tryParse(selectedchecklist.value) ?? 0;

    CreateCheckpoint createCheckpoint = CreateCheckpoint(
        check_point: _checkPoint,
        requirement: _requirement,
        checklist_id: _checklistId,
        id: checkPontId,
        is_document_required: isToggleOn.value ? 1 : 0,
        status: 1);
    var checkpointJsonString =
        createCheckpoint.toJson(); //createCheckPointToJson([createCheckpoint]);

    print({"checkpointJsonString", checkpointJsonString});
    await preventiveCheckPointPresenter.updateCheckPoint(
      checkpointJsonString: checkpointJsonString,
      isLoading: true,
    );
    return true;
  }
}
