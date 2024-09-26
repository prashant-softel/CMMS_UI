import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/close_permit_model.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/transferItems_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/models/file_upload_model.dart';
import '../../domain/models/pm_task_view_list_model.dart';
import '../../domain/models/update_pm_task_execution_model.dart';
import 'preventive_maintenance_execution_presenter.dart';

class PreventiveMaintenanceExecutionController extends GetxController {
  PreventiveMaintenanceExecutionController(
    this.preventiveMaintenanceExecutionPresenter,
  );
  PreventiveMaintenanceExecutionPresenter
      preventiveMaintenanceExecutionPresenter;
  Rx<int> scheduleId = 0.obs;
  RxBool isTouchable = true.obs;
  var isToggleOn = false.obs;
  var isToggleokOn = false.obs;
  var isToggleBoolOn = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;

  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;
  Rx<List<List<Map<String, String>>>> rowItemobs =
      Rx<List<List<Map<String, String>>>>([]);

  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  RxList<ScheduleCheckPoint> scheduleCheckPoints = <ScheduleCheckPoint>[].obs;
  RxList<ScheduleCheckPoint> scheduleCheckPointsdrop =
      <ScheduleCheckPoint>[].obs;
  RxList<ChecklistObservation>? checklistObservations =
      <ChecklistObservation>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<MRSListByJobIdModel?>? listMrsByTaskId = <MRSListByJobIdModel?>[].obs;
  RxList<CmmrsItems?>? cmmrsItems = <CmmrsItems?>[].obs;
  RxList<WorkingAreaList?>? materialUsedAssets = <WorkingAreaList?>[].obs;

  var commentCtrlr = TextEditingController();
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  Rx<bool> isFormInvalid = false.obs;
  var updatecommentCtrlr = TextEditingController();
  Map<String, CmmrsItems> dropdownMapperData = {};

  ScheduleCheckPoint? selectedItem;
  Rx<String> selectedasset = ''.obs;
  Rx<bool> isAssetsSelected = true.obs;
  int selectedAssetsId = 0;
  // Map<String, ScheduleCheckPoint> dropdownMapperData = {};
  String selectname = "";
  Rx<bool> blnHiglight = false.obs;
  Rx<List<int>> progresses = Rx(<int>[]);
  Rx<int> progress = 0.obs;
  Rx<int> index = 0.obs;
  RxList<XFile> pickedFiles = <XFile>[].obs;
  var selectedEvent = FileUploadEvents.BEFORE.obs;
  var token = '';
  List<TextEditingController> descriptionCtrlrs = [];
  List<List<int>>? bytesDataList;
  Rx<double?> tileHeight = 0.0.obs;
  final Uri apiUrl =
      Uri.parse('http://65.0.20.19/CMMS_API/api/FileUpload/UploadFile');
  // Uri.parse('http://172.20.43.9:83/api/FileUpload/UploadFile');
  var repository = Get.find<Repository>();
  Rx<List<List<Map<String, String>>>> rowItemclone =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, ScheduleCheckPoint> checkdropdownMapperData = {};
  Uint8List? fileBytes;
  RxString fileName = "".obs;
  int fileId = 0;
  // bool itemExistsWithZeroDifference = false;
  // var cmmrsItems = <Map<String, dynamic>>[].obs;
  var itemExistsWithZeroDifference = <bool>[].obs;
  var returnitemExists = <int>[].obs;
  Rx<bool> allTrue = false.obs;
  Rx<bool> isforminvalid = false.obs;

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  ///fileIDs
  int fileIds = 0;
  @override
  void onInit() async {
    try {
      await setScheduleId();

      token = await repository.getSecuredValue(LocalKeys.authToken);
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        facilityId = event;
        if (facilityId > 0) {
          isFacilitySelected.value = true;
          if (scheduleId != 0) {
            await getPmtaskViewList(
                scheduleId: scheduleId.value,
                isloading: true,
                facilityId: facilityId);

            getHistory();
            getLocation();
          }
        }
      });

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  void addRowItem() {
    rowItem.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Sr_No", "value": ''},
      {'key': "code", "value": ''},
      {'key': "Material_Type", "value": ''},
      {'key': "Issued_Qty", "value": ''},
      {'key': "Used_Qty", "value": ''},
      {'key': "Consumed_Qty", "value": ''},
      // {'key': "Action ", "value": ''},
    ]);
  }

  void commentcheck() {
    if (approveCommentTextFieldCtrlr.text == '') {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<void> getMrsListByModuleTask({required int taskId}) async {
    rowItem.value = [];
    cmmrsItems!.value = <CmmrsItems>[];
    materialUsedAssets!.value = <WorkingAreaList>[];

    listMrsByTaskId?.value =
        await preventiveMaintenanceExecutionPresenter.getMrsListByModuleTask(
              taskId,
              false,
            ) ??
            [];

    if (listMrsByTaskId!.value.isNotEmpty) {
      var _assetsList = listMrsByTaskId!.value.last!.cmmrsItems;
      for (var asset in _assetsList!) {
        cmmrsItems!.add(asset);
      }

      var _usedassetsList =
          listMrsByTaskId!.value.last!.material_used_by_assets!;

      for (var usedasset in _usedassetsList) {
        materialUsedAssets!.add(usedasset);
      }

      cmmrsItems?.forEach((element) {
        var consumedQty = '';
        var matchedUsedAssets = materialUsedAssets!
            .where((usedAsset) => usedAsset!.asset_id == selectedItem?.assetsID)
            .toList();

        if (matchedUsedAssets.isNotEmpty) {
          var usedItems = matchedUsedAssets.first!.items
              ?.where((usedItem) => usedItem.mrs_Item_Id == element?.id)
              .toList();

          if (usedItems != null && usedItems.isNotEmpty) {
            consumedQty = usedItems.first.used_qty.toString();
          }
        }

        rowItem.add([
          {"key": "Drop_down", "value": '${element?.name}'},
          {'key': "Sr_No", "value": ''},
          {'key': "code", "value": ''},
          {'key': "Material_Type", "value": ''},
          {'key': "Issued_Qty", "value": ''},
          {'key': "Used_Qty", "value": ''},
          {'key': "Consumed_Qty", "value": consumedQty},
          // {'key': "Action ", "value": ''},
        ]);

        dropdownMapperData[element?.name ?? ""] = listMrsByTaskId!
            .value.last!.cmmrsItems!
            .firstWhere((e) => e!.id == element?.id, orElse: null);
      });

      _processJsonData();
      allTrue.value = itemExistsWithZeroDifference.every((item) => item);
      //  addRowItem();
    }

    // print({"mrsit12mrs", listMrsByTaskId!.value.last!.material_used_by_assets});
    //   print({"mrsit12mrs", itemExistsWithZeroDifference});
  }

  void _processJsonData() {
    itemExistsWithZeroDifference.value = cmmrsItems!.map((element) {
      double issuedQty = element?.issued_qty ?? 0;
      double usedQty = element?.used_qty ?? 0;
      return (issuedQty - usedQty) == 0;
    }).toList();
    returnitemExists.value = cmmrsItems!.map((element) {
      return element?.mrs_return_ID ?? 0;
    }).toList();
  }

  Future<void> setScheduleId() async {
    // try {

    // final _scheduleId =
    //     await preventiveMaintenanceExecutionPresenter.getValue();

    // if (_scheduleId == null || _scheduleId == '' || _scheduleId == "null") {
    // var dataFromPreviousScreen = Get.arguments;
    final String? pmTaskId = Get.parameters['pmTaskId'];

    scheduleId.value =
        int.tryParse(pmTaskId ?? "") ?? 0; //dataFromPreviousScreen['pmTaskId'];
    //   preventiveMaintenanceExecutionPresenter.saveValue(
    //       pmTaskId: scheduleId.value.toString());
    // } else {
    //   scheduleId.value = int.tryParse(_scheduleId) ?? 0;
    // }
    // } catch (e) {
    // Utility.showDialog(e.toString(), 'pmTaskId');
    // }
  }

  Future<void> getHistory() async {
    int moduleType = 27;

    historyList?.value =
        await preventiveMaintenanceExecutionPresenter.getHistory(
              facilityId,
              moduleType,
              scheduleId.value,
              true,
            ) ??
            [];
    update(["historyList"]);
  }

  void toggleTouch() {
    isTouchable.value = !isTouchable.value;
    print(isTouchable.value);
  }

  void clearMrsStoreData() {
    preventiveMaintenanceExecutionPresenter.clearValue();
  }

  Future<void> getPmtaskViewList(
      {int? scheduleId, bool? isloading, required int facilityId}) async {
    scheduleCheckPoints.value = <ScheduleCheckPoint>[];
    scheduleCheckPointsdrop.value = <ScheduleCheckPoint>[];

    rowItemclone.value = [];
    final _permitDetails =
        await preventiveMaintenanceExecutionPresenter.getPmtaskViewList(
            scheduleId: scheduleId,
            isloading: isloading,
            facilityId: facilityId);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;
      _permitDetails.schedules?.forEach((element) {
        rowItemclone.value.add([
          {
            "key": "Asset",
            "value": '${element.name}',
            "id": '${element.assetsID}'
          },
          {
            'key': "Checklist",
            "value": '${element.checklist_name}',
            'executionDone': '${element.completedBy_id}'
          },
          {
            'key': "executionDone",
            'value': '${element.completedBy_id}',
            'completed': '${element.completedBy_name}'
          },
          {'key': "dropdown", "value": ''},
        ]);
        if (element.completedBy_id != 0) {
          scheduleCheckPointsdrop.value.add(element);
        }
      });
      if (_permitDetails.schedules != null) {
        for (var _frequencyList in _permitDetails.schedules ?? []) {
          scheduleCheckPoints.add(_frequencyList);
        }
      }
      await getMrsListByModuleTask(taskId: scheduleId ?? 0);
    }
    update(["getPmtaskViewList"]);
  }

  Future<void> transferItem() async {
    List<TranferItems> items = [];
    rowItem.value.forEach((element) {
      TranferItems item = TranferItems(
          assetItemID:
              dropdownMapperData[element[0]["value"]]?.asset_item_ID ?? 0,
          facilityID: pmtaskViewModel.value?.facility_id ?? 0,
          fromActorID: scheduleId.value,
          fromActorType: AppConstants.kTask,
          mrsID: listMrsByTaskId![0]!.mrsId ?? 0,
          mrsItemID: dropdownMapperData[element[0]["value"]]?.id ?? 0,
          qty: int.tryParse(element[6]["value"] ?? '0') ?? 0,
          refID: scheduleId.value,
          refType: AppConstants.kTask,
          remarks: "remarks",
          toActorID: selectedItem?.assetsID ?? 0,
          toActorType: AppConstants.kInventory,
          transaction_id:
              dropdownMapperData[element[0]["value"]]?.transaction_id ?? 0,
          latitude: latitude.value,
          longitude: longitude.value);

      items.add(item);
    });
    var transferItemJsonString = items;
    print({"transferItemJsonString", transferItemJsonString});

    var responsetransferItem =
        await preventiveMaintenanceExecutionPresenter.transferItem(
      transferItemJsonString: transferItemJsonString,
      isLoading: true,
    );
  }

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    print('Current Position: ${position.toString()}');
  }

  Future<bool> browseFiles({
    Uint8List? fileBytes,
  }) async {
    PmFiles? pmfile = await preventiveMaintenanceExecutionPresenter.browseFiles(
        fileBytes, fileName.value, true);
    fileId = pmfile?.file_id ?? 0;

    return true;
  }

  void updatePmExecution() async {
    PmFiles fil = PmFiles(file_id: fileId ?? 0, pm_event: 0);
    List<PmFiles> pmfile = <PmFiles>[fil];

    List<AddObservations> addObservations = <AddObservations>[];
    rowItemobs.value.forEach((element) {
      AddObservations item = AddObservations(
          execution_id: int.tryParse(element[0]["id"] ?? '0'),
          observation: element[4]["value"] ?? "",
          job_create: int.tryParse(element[7]["value"] ?? '0'),
          text: element[6]["value"] ?? '',
          cp_ok: int.tryParse(element[3]["value"] ?? '0'),
          pm_files: pmfile);
      addObservations.add(item);
    });

    List<SchedulesTask> schedule = <SchedulesTask>[];
    schedule.add(SchedulesTask(
        schedule_id: selectedItem?.schedule_id ?? 0,
        add_observations: addObservations));

    UpdatePmExecutionMdel updatePmExecutionMdel = UpdatePmExecutionMdel(
        task_id: scheduleId.value,
        comment: commentCtrlr.text,
        schedules: schedule);
    var pmExecutionJsonString = updatePmExecutionMdel.toJson();
    print({"pmExecutionJsonString", pmExecutionJsonString});
    var responsePmScheduleCreated =
        await preventiveMaintenanceExecutionPresenter.updatePmExecution(
            pmExecutionJsonString: pmExecutionJsonString,
            isLoading: true,
            facility_id: pmtaskViewModel.value?.facility_id);
    _updatedailog();
  }

  void cloneDialog(String assets) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Text(
            'CheckList Observation Clone',
            textAlign: TextAlign.center,
            style: Styles.green700,
          ),
          Divider(
            color: ColorValues.greyColor,
          )
        ],
      ),
      content: Builder(builder: (context) {
        var height = Get.height;

        return Obx(
          () => Container(
            height: height / 7,
            width: double.infinity,
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Do you want to clone the ',
                      style: Styles.blue700,
                      children: <TextSpan>[
                        TextSpan(
                            text: '\n${selectedItem?.name ?? ""}',
                            style: Styles.green700),
                        TextSpan(text: '  with', style: Styles.blue700),
                        TextSpan(
                          text: '\n ${selectedasset.value}',
                          style: Styles.redBold15,
                        ),
                        TextSpan(text: '  ?', style: Styles.blue700),
                      ]),
                ),
                Dimens.boxHeight12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        text: "Cancel",
                        onPressed: () {
                          Get.back();
                        },
                        backgroundColor: ColorValues.cancelColor,
                        textColor: ColorValues.whiteColor,
                      ),
                    ),
                    Dimens.boxWidth20,
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        text: "Clone",
                        onPressed: () {
                          Get.back();
                          var select = scheduleCheckPoints.firstWhere(
                            (element) => element.name == selectedasset.value,
                          );
                          cloneSchedule(
                              from_schedule_id: selectedItem?.schedule_id ?? 0,
                              to_schedule_id: select.schedule_id ?? 0,
                              cloneJobs: 1);
                        },
                        backgroundColor: ColorValues.appDarkBlueColor,
                        textColor: ColorValues.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
      actions: [],
    ));
  }

  closePmTaskExecution() async {
    {
      String _comment = commentCtrlr.text.trim();
      int ptwId = pmtaskViewModel.value?.permit_id ?? 0;

      CommentModel commentModel = CommentModel(
        id: scheduleId.value,
        comment: _comment,
      );
      ClosePermitModel ptwClose = ClosePermitModel(
          id: ptwId,
          comment: _comment,
          conditionIds: [1, 2, 3, 4],
          fileIds: []);

      var closetoJsonString = commentModel.toJson();
      var closePtwJsonString = ptwClose.toJson();

      final response =
          await preventiveMaintenanceExecutionPresenter.closePmTaskExecution(
              closetoJsonString: closetoJsonString,
              closePtwJsonString: closePtwJsonString,
              isLoading: true,
              closetype: 1);
    }
  }

  CancelPMTask() async {
    {
      String _comment = commentCtrlr.text.trim();

      CommentModel commentModel =
          CommentModel(id: scheduleId.value, comment: _comment);
      ClosePermitModel ptwClose = ClosePermitModel(
          id: pmtaskViewModel.value?.permit_id ?? 0,
          comment: _comment,
          facility_id: facilityId,
          conditionIds: [1, 2, 3, 4],
          fileIds: []);

      var CancelPMTaskJsonString = commentModel.toJson();
      var closePtwJsonString = ptwClose.toJson();
      final permitId = pmtaskViewModel.value!.permit_id;
      bool shouldClosePermit = permitId! > 0;
      final response =
          await preventiveMaintenanceExecutionPresenter.CancelPMTask(
        CancelPMTaskJsonString: CancelPMTaskJsonString,
        closePtwJsonString: closePtwJsonString,
        shouldClosePermit: shouldClosePermit,
        isLoading: true,
      );
      if (response == true) {
        // Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  void cloneAlertDialog() {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Text(
            'CheckList Observation Clone',
            textAlign: TextAlign.center,
            style: Styles.green700,
          ),
          Divider(
            color: ColorValues.greyColor,
          )
        ],
      ),
      content: Builder(builder: (context) {
        var height = Get.height;

        return Container(
          height: height / 7,
          width: double.infinity,
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'The schedule to be cloned contains job(s), do you want to create new job(s) during clone?',
                  style: Styles.blue700,
                ),
              ),
              Dimens.boxHeight12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      text: "Cancel",
                      onPressed: () {
                        Get.back();
                      },
                      backgroundColor: ColorValues.cancelColor,
                      textColor: ColorValues.whiteColor,
                    ),
                  ),
                  Dimens.boxWidth20,
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      text: "No",
                      onPressed: () {
                        Get.back();
                        var select = scheduleCheckPoints.firstWhere(
                          (element) => element.name == selectedasset.value,
                        );
                        cloneSchedule(
                            from_schedule_id: selectedItem?.schedule_id ?? 0,
                            to_schedule_id: select.schedule_id ?? 0,
                            cloneJobs: 0);
                      },
                      backgroundColor: ColorValues.appDarkBlueColor,
                      textColor: ColorValues.whiteColor,
                    ),
                  ),
                  Dimens.boxWidth20,
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      text: "Yes",
                      onPressed: () {
                        Get.back();
                        var select = scheduleCheckPoints.firstWhere(
                          (element) => element.name == selectedasset.value,
                        );
                        cloneSchedule(
                            from_schedule_id: selectedItem?.schedule_id ?? 0,
                            to_schedule_id: select.schedule_id ?? 0,
                            cloneJobs: 1);
                      },
                      backgroundColor: ColorValues.appGreenColor,
                      textColor: ColorValues.whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
      actions: [],
    ));
  }

  void UpdatePMTaskExecution() async {
    String _comment = updatecommentCtrlr.text.trim();

    var updatePMTaskExecutionJsonString = {
      "task_id": scheduleId.value,
      "comment": _comment,
    };
    final response =
        await preventiveMaintenanceExecutionPresenter.UpdatePMTaskExecution(
            updatePMTaskExecutionJsonString: updatePMTaskExecutionJsonString,
            isLoading: true,
            facility_id: pmtaskViewModel.value?.facility_id);
    if (response == true) {
      _updatedailog();
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case const (RxList<ScheduleCheckPoint?>):
        {
          if (value != "Please Select") {
            int assetsIndex =
                scheduleCheckPoints.indexWhere((x) => x.name == value);
            selectedAssetsId =
                scheduleCheckPoints[assetsIndex].schedule_id ?? 0;
            if (selectedAssetsId > 0) {
              isAssetsSelected.value = true;
            }
            selectedasset.value = scheduleCheckPoints[assetsIndex].name ?? "";
          } else {
            selectedAssetsId = 0;
          }
        }
        break;
    }
  }

  void cloneSchedule({
    required int from_schedule_id,
    required int to_schedule_id,
    required int cloneJobs,
  }) async {
    final response =
        await preventiveMaintenanceExecutionPresenter.cloneSchedule(
            from_schedule_id: from_schedule_id,
            to_schedule_id: to_schedule_id,
            taskId: scheduleId.value,
            cloneJobs: cloneJobs,
            isloading: true,
            facility_id: pmtaskViewModel.value?.facility_id);
    if (response == true) {
      _updatedailog();
    }
  }

  void _updatedailog() {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Text(
            'Task ID:${scheduleId}',
            textAlign: TextAlign.center,
            style: Styles.green700,
          ),
          Divider(
            color: ColorValues.greyColor,
          )
        ],
      ),
      content: Builder(builder: (context) {
        var height = Get.height;

        return Container(
          height: height / 6,
          width: double.infinity,
          child: Container(
            margin: Dimens.edgeInsets20,
            child: Column(
              children: [
                Text("Updated checkpoints successfully."),
                Dimens.boxHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        text: "PM Task List",
                        onPressed: () {
                          Get.back();

                          Get.offAndToNamed(Routes.pmTask);
                        },
                        backgroundColor: ColorValues.appDarkBlueColor,
                        textColor: ColorValues.whiteColor,
                      ),
                    ),
                    Dimens.boxWidth10,
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        text: "Execute",
                        onPressed: () async {
                          Get.back();
                          try {
                            await setScheduleId();

                            if (scheduleId != 0) {
                              getPmtaskViewList(
                                  scheduleId: scheduleId.value,
                                  isloading: true,
                                  facilityId: facilityId);

                              getHistory();
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        backgroundColor: ColorValues.appYellowColor,
                        textColor: ColorValues.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
      actions: [],
    ));
  }

  void clearStoreTaskData() {
    preventiveMaintenanceExecutionPresenter.clearStoreTaskData();
  }

  void clearMrsIdStoreData() {
    preventiveMaintenanceExecutionPresenter.clearMrsIdStoreData();
  }

  void clearJobIdStoreData() {
    preventiveMaintenanceExecutionPresenter.clearJobIdStoreData();
  }

  void clearStoreTaskActivityData() {
    preventiveMaintenanceExecutionPresenter.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    preventiveMaintenanceExecutionPresenter.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    preventiveMaintenanceExecutionPresenter.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    preventiveMaintenanceExecutionPresenter.clearStoreTaskWhereUsedData();
  }

  void clearTypeValue() async =>
      preventiveMaintenanceExecutionPresenter.clearTypeValue();
}
