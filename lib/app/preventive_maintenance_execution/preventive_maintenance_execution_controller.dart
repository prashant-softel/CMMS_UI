import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/transferItems_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/models/file_upload_model.dart';
import '../../domain/models/pm_task_view_list_model.dart';
import '../../domain/models/update_pm_task_execution_model.dart';
import 'preventive_maintenance_execution_presenter.dart';
import 'package:http/http.dart' as http;

class PreventiveMaintenanceExecutionController extends GetxController {
  ///
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
  RxList<ChecklistObservation>? checklistObservations =
      <ChecklistObservation>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<MRSListByJobIdModel?>? listMrsByTaskId = <MRSListByJobIdModel?>[].obs;
  RxList<CmmrsItems?>? cmmrsItems = <CmmrsItems?>[].obs;

  var commentCtrlr = TextEditingController();
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

  ///fileIDs
  List<dynamic> fileIds = [];
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
      {'key': "Material_Type", "value": ''},
      {'key': "Issued_Qty", "value": ''},
      {'key': "Consumed_Qty", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  Future<void> getMrsListByModuleTask({required int taskId}) async {
    listMrsByTaskId?.value =
        await preventiveMaintenanceExecutionPresenter.getMrsListByModuleTask(
              taskId,
              false,
            ) ??
            [];
    var _assetsList = listMrsByTaskId!.value[0]!.cmmrsItems;
    for (var asset in _assetsList!) {
      cmmrsItems!.add(asset);
    }
    print({"mrsit", listMrsByTaskId});
    addRowItem();
  }

  Future<void> setScheduleId() async {
    try {
      final _scheduleId =
          await preventiveMaintenanceExecutionPresenter.getValue();

      //  String? _scheduleId = await _flutterSecureStorage.read(key: "pmTaskId");
      if (_scheduleId == null || _scheduleId == '' || _scheduleId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        scheduleId.value = dataFromPreviousScreen['pmTaskId'];
        preventiveMaintenanceExecutionPresenter.saveValue(
            pmTaskId: scheduleId.value.toString());

        // await _flutterSecureStorage.write(
        //   key: "pmTaskId",
        //   value: scheduleId.value == null ? '' : scheduleId.value.toString(),
        // );
      } else {
        scheduleId.value = int.tryParse(_scheduleId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'pmTaskId');
    }
  }

  Future<void> getHistory() async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 27;
    //

    historyList?.value =
        await preventiveMaintenanceExecutionPresenter.getHistory(
              // tempModuleType,
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

  Future<void> getPmtaskViewList(
      {int? scheduleId, bool? isloading, required int facilityId}) async {
    scheduleCheckPoints.value = <ScheduleCheckPoint>[];
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
          {'key': "Checklist", "value": '${element.checklist_name}'},
          {'key': "dropdown", "value": ''},
        ]);
      });
      if (_permitDetails.schedules != null) {
        for (var _frequencyList in _permitDetails.schedules ?? []) {
          scheduleCheckPoints.add(_frequencyList);
        }
      }
      getMrsListByModuleTask(taskId: scheduleId ?? 0);
    }
    // selectedasset.value = scheduleCheckPoints[0].name ?? "";
    update(["getPmtaskViewList"]);

    // print({"checklistObservations", checklistObservations});
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
          qty: int.tryParse(element[3]["value"] ?? '0') ?? 0,
          refID: scheduleId.value,
          refType: AppConstants.kTask,
          remarks: "remarks",
          toActorID: selectedItem?.assetsID ?? 0,
          // dropdownMapperData[element[0]["value"]]?.asset_item_ID ?? 0,
          toActorType: AppConstants.kInventory);

      items.add(item);
    });
    var transferItemJsonString = items;
    print({"transferItemJsonString", transferItemJsonString});

    var responsetransferItem =
        await preventiveMaintenanceExecutionPresenter.transferItem(
      transferItemJsonString: transferItemJsonString,
      isLoading: true,
    );
    if (responsetransferItem == null) {}
  }

  void updatePmExecution() async {
    List<PmFiles> pmfile = <PmFiles>[];

    List<AddObservations> addObservations = <AddObservations>[];

    rowItemobs.value.forEach((element) {
      AddObservations item = AddObservations(
          execution_id: int.tryParse(element[0]["id"] ?? '0'),
          observation: element[4]["value"] ?? "",
          job_create: int.tryParse(element[7]["job_value"] ?? '0'),
          text: element[6]["value"] ?? '',
          cp_ok: int.tryParse(element[3]["value"] ?? '0'),
          pm_files: []);
      addObservations.add(item);
    });
    // });
    List<Schedules> schedule = <Schedules>[];
    // checklistObservations?.forEach((e) {
    schedule.add(Schedules(
        schedule_id: selectedItem?.schedule_id ?? 0,
        add_observations: addObservations));
    // });

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
    );
    _updatedailog();
    // Get.back();
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
            // margin: Dimens.edgeInsets15,
            // padding: Dimens.edgeInsets25,
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
                    // Spacer(),
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
                              to_schedule_id: select.schedule_id ?? 0);
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

      CommentModel commentModel =
          CommentModel(id: scheduleId.value, comment: _comment);

      var closetoJsonString = commentModel.toJson();
      final response =
          await preventiveMaintenanceExecutionPresenter.closePmTaskExecution(
        closetoJsonString: closetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "pmTaskId");
        Get.offAllNamed(Routes.pmTask);
      }
    }
  }

  void UpdatePMTaskExecution() async {
    String _comment = updatecommentCtrlr.text.trim();

    var updatePMTaskExecutionJsonString = {
      "task_id": scheduleId.value,
      "comment": _comment,
    }; //commentModel.toJson();
    final response =
        await preventiveMaintenanceExecutionPresenter.UpdatePMTaskExecution(
      updatePMTaskExecutionJsonString: updatePMTaskExecutionJsonString,
      isLoading: true,
    );
    if (response == true) {
      _updatedailog();
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case RxList<ScheduleCheckPoint?>:
        {
          int assetsIndex =
              scheduleCheckPoints.indexWhere((x) => x.name == value);
          selectedAssetsId = scheduleCheckPoints[assetsIndex].schedule_id ?? 0;
          if (selectedAssetsId > 0) {
            isAssetsSelected.value = true;
          }
          selectedasset.value = scheduleCheckPoints[assetsIndex].name ?? "";
        }
        break;
    }
  }

  void cloneSchedule(
      {required int from_schedule_id, required int to_schedule_id}) async {
    final response =
        await preventiveMaintenanceExecutionPresenter.cloneSchedule(
            from_schedule_id: from_schedule_id,
            to_schedule_id: to_schedule_id,
            taskId: scheduleId.value,
            isloading: true);
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
                Text("Successfully...."),
                Dimens.boxHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // RichText(
                    //   text: TextSpan(
                    //       text: 'PM Execution Submitted with',
                    //       style: Styles.blue700,
                    //       children: <TextSpan>[
                    //         TextSpan(text: ' \n     Code', style: Styles.blue700),
                    //         TextSpan(
                    //           text: '  2444',
                    //           style: Styles.redBold15,
                    //         ),
                    //       ]),
                    // ),
                    // Dimens.boxHeight12,
                    //  Text("PM Execution Submitted with code PMSC87456"),
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
                            // textControllers =
                            //     List.generate(permitValuesCount, (_) => TextEditingController());
                            // permitValues = RxList<String>.filled(permitValuesCount, '');
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

  selectFiles() async {
    try {
      pickedFiles.value = await addFiles();
      bytesDataList = [];

      for (var file in pickedFiles) {
        bytesDataList!.add(await file.readAsBytes());
      }
      if (bytesDataList!.isNotEmpty) {
        await uploadFiles(
          pickedFiles,
          bytesDataList!,
          token,
          uploadProgressCallback: (progress) {
            print('Upload progress: $progress%');
          },
        );
      }
      if (pickedFiles.isEmpty || pickedFiles.length != bytesDataList!.length) {
        print('No files selected or failed to read bytes data');
        pickedFiles.clear();
        bytesDataList = null;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), ' selectFiles');
    }
  }

  Future<void> uploadFiles(
      List<XFile> files, List<List<int>> bytesDataList, String token,
      {required Function(double) uploadProgressCallback}) async {
    progresses.value = List<int>.filled(files.length, 0);

    for (int i = 0; i < files.length; i++) {
      await uploadSingleFile(
        files[i],
        bytesDataList[i],
        token,
        i,
        uploadProgressCallback: (progress) {
          var updatedProgresses = List<int>.from(progresses.value);
          updatedProgresses[i] = progress.round();
          progresses.value = updatedProgresses;
        },
      );
    }
  }

  Future<void> uploadSingleFile(
      XFile file, List<int> bytesData, String token, int index,
      {required Function(double) uploadProgressCallback}) async {
    ///

    String boundary = '----${DateTime.now().millisecondsSinceEpoch}';
    var headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data; boundary=$boundary",
      "Accept": "*/*",
    };

    var requestFields = {
      "facility_id": "380",
      "module_id": "1",
      "id": "3263",
    };

    var fieldsData = requestFields.entries
        .map((entry) =>
            '--$boundary\r\nContent-Disposition: form-data; name="${entry.key}"\r\n\r\n${entry.value}\r\n')
        .join();

    var fieldsBytes = utf8.encode(fieldsData);

    var fileHeader =
        '--$boundary\r\nContent-Disposition: form-data; name="files"; filename="${file.name}"\r\n\r\n';
    var fileFooter = '\r\n--$boundary--\r\n';

    var fileHeaderBytes = utf8.encode(fileHeader);
    var fileFooterBytes = utf8.encode(fileFooter);

    var requestBody = <List<int>>[
      fieldsBytes,
      fileHeaderBytes,
      ...bytesData.map((e) => [e]),
      fileFooterBytes,
    ];

    var stream = http.ByteStream(Stream<List<int>>.fromIterable(requestBody));
    var length = requestBody.fold<int>(0, (sum, list) => sum + list.length);
    int totalSent = 0;

    StreamController<List<int>> streamController =
        StreamController<List<int>>();

    stream.transform(StreamTransformer<List<int>, List<int>>.fromHandlers(
      handleData: (data, sink) {
        totalSent += data.length;
        int progress = ((totalSent / length) * 100).round();
        uploadProgressCallback(progress.toDouble());
        sink.add(data);

        // Update the progress at the current index
        var updatedProgresses = List<int>.from(progresses.value);
        updatedProgresses[index] = progress;
        progresses.value = updatedProgresses;
      },
    )).listen((data) {
      streamController.add(data);
    }, onDone: () {
      streamController.close();
    }, onError: (e) {
      streamController.addError(e);
    });

    var newStream = streamController.stream;

    var request = http.StreamedRequest('POST', apiUrl)
      ..headers.addAll(headers)
      ..contentLength = length
      ..followRedirects = true
      ..maxRedirects = 5;

    newStream.listen((data) {
      request.sink.add(data);
    }, onDone: () {
      request.sink.close();
    }, onError: (e) {
      request.sink.addError(e);
    });

    var response = await request.send();
    print('File Upload Response:$response');

    if (response.statusCode == 200) {
      var respStr = await response.stream.bytesToString();
      var jsonResponse = json.decode(respStr);

      var id = jsonResponse['id'];
      print('File Id,${id[0]}');
      fileIds.addAll(jsonResponse['id']);
      print('Files uploaded successfully,$fileIds');
    } else {
      print('Failed to upload files: ${response.reasonPhrase}');
    }
  }

  Future<List<XFile>> addFiles() async {
    final ImagePicker picker = ImagePicker();
    pickedFiles.value = await picker.pickMultiImage();
    // if (pickedFiles.isNotEmpty)
    //   initializeDescriptionControllers(pickedFiles.value);
    return pickedFiles.value;
  }
}
