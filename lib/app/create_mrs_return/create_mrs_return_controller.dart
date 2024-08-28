import 'dart:async';

import 'package:cmms/app/create_mrs_return/create_mrs_return_presenter.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/models/create_return_mrs_model.dart';
import '../constant/constant.dart';
import '../home/home_controller.dart';
import '../navigators/app_pages.dart';

class CreateMrsReturnController extends GetxController {
  ///
  CreateMrsReturnController(
    this.createmrsReturnPresenter,
  );
  CreateMrsReturnPresenter createmrsReturnPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<PlantStockListModel?> assetItemList = <PlantStockListModel?>[].obs;
  RxList<StockDetails?> StockDetailsList = <StockDetails?>[].obs;
  Rx<String> selectedasset = ''.obs;
  RxInt jobid = 0.obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;

  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;
  RxMap<dynamic, dynamic> checkdropdownMapperData = {}.obs;

  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  var activityCtrlr = TextEditingController();
  var remarkCtrlr = TextEditingController();
  var whereUsedCtrlr = TextEditingController();
  var setTemlateCtrlr = TextEditingController();
  var allDropdownsSelected = false.obs;
  RxList<ScheduleCheckPoint> scheduleCheckPoints = <ScheduleCheckPoint>[].obs;
  RxList<ScheduleCheckPoint> scheduleCheckPointsdrop =
      <ScheduleCheckPoint>[].obs;
  RxList<InventoryModel>? workingAreaList = <InventoryModel>[].obs;
  Rx<int> whereUsedTypeId = 0.obs;
  Rx<int> type = 0.obs;
  Rx<String> activity = ''.obs;
  Rx<int> whereUsed = 0.obs;
  Rx<int> fromActorTypeId = 0.obs;
  Rx<int> to_actor_type_id = 0.obs;
  Rx<int> mrsId = 0.obs;
  var isToggleOn = false.obs;

  var isSetTemplate = false.obs;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  RxList<List<Map<String, String>>> rowFaultyItem =
      <List<Map<String, String>>>[].obs;
  RxMap<dynamic, dynamic> dropdownFaultyMapperData = {}.obs;

  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    await setId();
    //   whereUsedTypeId = Get.arguments;
    if (whereUsedTypeId.value != 0) {
      whereUsedCtrlr.text = whereUsedTypeId.value.toString();
      activityCtrlr.text = activity.value;
    }
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (mrsId > 0) {
        if (facilityId > 0) {
          Future.delayed(Duration(seconds: 1), () {
            getCmmsItemList(
              facilityId,
            );
            getAssetList(facilityId);
            if (type.value == 1) {
              getJobDetails(jobid.value, facilityId);
            } else {
              getPmtaskViewList(facilityId: facilityId);
            }
          });
        }
      }
    });
    super.onInit();
  }

  Future<void> setId() async {
    try {
      // final _whereUsedTypeId = await createmrsReturnPresenter.getValue();
      // final _activity = await createmrsReturnPresenter.getactivityValue();

      // if (_whereUsedTypeId == null ||
      //     _whereUsedTypeId == '' ||
      //     _whereUsedTypeId == "null") {
      var dataFromPreviousScreen = Get.arguments;

      activity.value = dataFromPreviousScreen['activity'];
      type.value = dataFromPreviousScreen['type'];
      whereUsedTypeId.value = dataFromPreviousScreen['pmTaskId'];
      whereUsed.value = dataFromPreviousScreen['whereUsed'];
      fromActorTypeId.value = dataFromPreviousScreen['fromActorTypeId'];
      to_actor_type_id.value = dataFromPreviousScreen['to_actor_type_id'];
      mrsId.value = dataFromPreviousScreen['mrsId'];
      if (type.value == 1) {
        jobid.value = dataFromPreviousScreen['jobId'];
      }
      createmrsReturnPresenter.saveValue(
          whereUsedTypeId: whereUsedTypeId.value.toString());
      createmrsReturnPresenter.saveValuee(type: type.value.toString());
      createmrsReturnPresenter.saveactivityValue(
          activity: activity.value.toString());
      // } else {
      //   whereUsedTypeId.value = int.tryParse(_whereUsedTypeId) ?? 0;
      //   activity.value = _activity ?? "";
      // }
    } catch (e) {
      print(e.toString() + 'goId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getCmmsItemList(int _facilityId) async {
    int userId = varUserAccessModel.value.user_id ?? 0;

    final _assetList = await createmrsReturnPresenter.getCmmsItemList(
        facilityId: facilityId, isLoading: false, mrsId: mrsId.value);
    if (_assetList != null) {
      for (var facility in _assetList) {
        for (var stockDetail in facility!.stockDetails) {
          StockDetailsList.add(stockDetail);
          //  StockDetailsList.value = facility?.stockDetails ?? [];
        }
      }

      // assetItemList.value = _assetList.s ?? [];
      //

      update(["AssetList"]);
    }

    addRowItem();
  }

  void getJobDetails(int? jobId, int facilityId) async {
    try {
      final _jobDetailsList = await createmrsReturnPresenter.getJobDetails(
          facilityId: facilityId, jobId: jobId, isLoading: false);

      if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
        jobDetailsModel.value =
            _jobDetailsList.firstWhereOrNull((element) => element?.id != null);
        workingAreaList?.value = jobDetailsModel.value!.workingAreaList!;
        update(["jobDetailsModel"]);
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'getJobDetails');
    }
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList =
        await createmrsReturnPresenter.getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      //for (var asset in _assetList) {
      assetList.value = _assetList;
      //  }
      update(["AssetList"]);
    }
    // addRowFaultyItem();
  }

  void addRowFaultyItem() {
    rowFaultyItem.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "assets", "value": ''},
      // {'key': "Material_Type", "value": ''},
      {'key': "code", "value": ''},
      // {'key': "Material_Category", "value": ''},
      {'key': "Sr_no", "value": ''},
      {'key': "Return_Qty", "value": '1'},
      {'key': "Remark", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  void addRowItem() {
    rowItem.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Sr_No", "value": ''},
      {'key': "code", "value": ''},
      {'key': "Material_Type", "value": ''},
      {'key': "Issue_Qty", "value": ''},
      {'key': "Used_Qty", "value": ''},
      {'key': "Return_Qty", "value": ''},
      {'key': "Remark", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  Future<void> getPmtaskViewList(
      {int? scheduleId, bool? isloading, required int facilityId}) async {
    scheduleCheckPoints.value = <ScheduleCheckPoint>[];
    scheduleCheckPointsdrop.value = <ScheduleCheckPoint>[];

    // rowItemclone.value = [];
    final _permitDetails = await createmrsReturnPresenter.getPmtaskViewList(
        scheduleId: whereUsedTypeId.value,
        isloading: isloading,
        facilityId: facilityId);
    if (_permitDetails != null) {
      // pmtaskViewModel.value = _permitDetails;
      _permitDetails.schedules?.forEach((element) {
        //  if (element.completedBy_id == 0) {
        // rowItemclone.value.add([
        //   {
        //     "key": "Asset",
        //     "value": '${element.name}',
        //     "id": '${element.assetsID}'
        //   },
        //   {
        //     'key': "Checklist",
        //     "value": '${element.checklist_name}',
        //     'executionDone': '${element.completedBy_id}'
        //   },
        //   {
        //     'key': "executionDone",
        //     'value': '${element.completedBy_id}',
        //     'completed': '${element.completedBy_name}'
        //   },
        //   {'key': "dropdown", "value": ''},
        // ]);
        // // Add to scheduleCheckPoints if completedBy_id != 0
        // if (element.completedBy_id != 0) {
        scheduleCheckPointsdrop.value.add(element);
        // }
      });
      if (_permitDetails.schedules != null) {
        for (var _frequencyList in _permitDetails.schedules ?? []) {
          scheduleCheckPoints.add(_frequencyList);
        }
      }
      // await getMrsListByModuleTask(taskId: scheduleId ?? 0);
    }
    // selectedasset.value = scheduleCheckPoints[0].name ?? "";
    update(["getPmtaskViewList"]);

    // print({"checklistObservations", checklistObservations});
  }

  Future<void> createReturnMrs() async {
    String _activity = activityCtrlr.text.trim();
    String _remark = remarkCtrlr.text.trim();
    String _setTemp = setTemlateCtrlr.text.trim();

    Rx<DateTime> requestd_date = DateTime.now().obs;
    String formattedFromdate =
        DateFormat('yyyy-MM-dd').format(requestd_date.value);

    List<CmmsItem> items = [];
    List<FaultyItemsCmms> faultyItems = [];

    rowItem.forEach((element) {
      CmmsItem item = CmmsItem(
        mrs_item_ID: dropdownMapperData.value[element[0]["value"]]?.mrs_item_id,
        returned_qty: dropdownMapperData.value[element[0]["value"]].issued_qty -
            dropdownMapperData.value[element[0]["value"]]
                .consumed_qty, //double.tryParse(element[3]["value"] ?? '0'),

        return_remarks: element[7]["value"] ?? '0',
      );
      items.add(item);
    });
    rowFaultyItem.forEach((element) {
      FaultyItemsCmms item = FaultyItemsCmms(
        assetMasterItemID:
            dropdownFaultyMapperData.value[element[0]["value"]]?.id,
        mrsItemID: 0,
        assetsID: type == 1
            ? checkdropdownMapperData[element[1]["value"]].id
            : checkdropdownMapperData[element[1]["value"]].assetsID,
        sr_no: element[3]["value"] ?? '0',
        returned_qty: int.tryParse(element[4]["value"] ?? '0'),
        return_remarks: element[5]["value"] ?? '0',
      );
      faultyItems.add(item);
    });
    CreateReturnMrsModel createMrs = CreateReturnMrsModel(
        ID: 0,
        facility_ID: facilityId,
        setAsTemplate: "", //isSetTemplate == true ? 1 : 0,
        activity: _activity,
        //1 is job,2 is pm
        whereUsedType: whereUsed.value,
        whereUsedTypeId: whereUsedTypeId.value,
        to_actor_id: facilityId, //
        to_actor_type_id: to_actor_type_id.value,
        from_actor_type_id: fromActorTypeId.value,
        from_actor_id: whereUsedTypeId.value,
        remarks: _remark,
        cmmrsItems: items,
        faultyItems: faultyItems);
    var createReturnMrsJsonString = createMrs.toJson();

    print({"createReturnMrsJsonString", createReturnMrsJsonString});
    Map<String, dynamic>? responseCreateReturnMrs =
        await createmrsReturnPresenter.createReturnMrs(
      createReturnMrsJsonString: createReturnMrsJsonString,
      isLoading: true,
    );
    if (responseCreateReturnMrs == null) {
    } else {
      Get.offAllNamed(
        Routes.returnMrsList,
      );
    }
  }

  void toggle(bool value) {
    isToggleOn.value = value;
  }
}
