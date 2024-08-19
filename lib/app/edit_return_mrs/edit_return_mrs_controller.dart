import 'dart:async';

import 'package:cmms/app/edit_return_mrs/edit_return_mrs_presenter.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/create_return_mrs_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_card_details_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../navigators/app_pages.dart';

class EditMrsReturnController extends GetxController {
  ///
  EditMrsReturnController(
    this.editmrsReturnPresenter,
  );
  EditMrsReturnPresenter editmrsReturnPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<PlantStockListModel?> assetItemList = <PlantStockListModel?>[].obs;
  RxList<StockDetails?> StockDetailsList = <StockDetails?>[].obs;
  var allDropdownsSelected = true.obs;
  RxMap<dynamic, dynamic> checkdropdownMapperData = {}.obs;
  Rx<String> selectedasset = ''.obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  RxList<InventoryModel>? workingAreaList = <InventoryModel>[].obs;

  // RxList<CmmrsItemsModel?> assetItemList = <CmmrsItemsModel?>[].obs;
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;

  RxList<ScheduleCheckPoint> scheduleCheckPoints = <ScheduleCheckPoint>[].obs;
  RxList<ScheduleCheckPoint> scheduleCheckPointsdrop =
      <ScheduleCheckPoint>[].obs;
  RxMap<dynamic, dynamic> dropdownMapperData = {}.obs;
  var activityCtrlr = TextEditingController();
  var remarkCtrlr = TextEditingController();
  var whereUsedCtrlr = TextEditingController();
  var setTemlateCtrlr = TextEditingController();
  RxList<List<Map<String, String>>> rowFaultyItem =
      <List<Map<String, String>>>[].obs;
  RxMap<dynamic, dynamic> dropdownFaultyMapperData = {}.obs;
  Rx<int> mrsId = 0.obs;
  var isSetTemplate = false.obs;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  Rx<ReturnMrsDetailsModel?> returnMrsDetailsModel =
      ReturnMrsDetailsModel().obs;
  RxList<JobCardDetailsModel?> jobCardList = <JobCardDetailsModel?>[].obs;

  void setTemplatetoggle() {
    isSetTemplate.value = !isSetTemplate.value;
  }

  ///
  @override
  void onInit() async {
    try {
      await setMrsId();

      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        if (facilityId > 0) {
          if (mrsId != 0) {
            Future.delayed(Duration(seconds: 1), () {
              getReturnMrsDetails(
                  mrsId: mrsId.value, isloading: true, facilityId: facilityId);
              // getAssetList(facilityId);
            });
          }
        }
      });
      // if (mrsId != 0) {
      //   await getMrsDetails(mrsId: mrsId.value, isloading: true);
      // }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await editmrsReturnPresenter.getValue();
      // final _type = await editmrsReturnPresenter.getValue();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        // type.value = dataFromPreviousScreen['type'];
        editmrsReturnPresenter.saveValue(mrsId: mrsId.value.toString());
        // editMrsPresenter.saveValuee(type: type.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
        // type.value = int.tryParse(_type!) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "mrsId");
    } catch (e) {
      Utility.showDialog(e.toString(), 'mrsId');
    }
  }

  Future<void> getReturnMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _returnMrsrsDetailsModel =
        await editmrsReturnPresenter.getReturnMrsDetails(
            mrsId: mrsId, isLoading: isloading, facilityId: facilityId);

    if (_returnMrsrsDetailsModel != null) {
      returnMrsDetailsModel.value = _returnMrsrsDetailsModel;

      if (returnMrsDetailsModel.value?.whereUsedType == "JOBCARD") {
        jobCardList.value = await editmrsReturnPresenter.getJobCardDetails(
              jobCardId: returnMrsDetailsModel.value?.whereUsedTypeId,
              isLoading: true,
            ) ??
            [];
        if (jobCardList.value != null) {
          getJobDetails(jobCardList.value[0]!.jobId, facilityId);
          await getCmmsItemList(
            _returnMrsrsDetailsModel.mrs_id ?? 0,
          );
        }
      } else {
        getPmtaskViewList(facilityId: facilityId);
        await getCmmsItemList(
          _returnMrsrsDetailsModel.mrs_id ?? 0,
        );
      }

      await getAssetList(facilityId);
    }
    // print({"mrsdetailss", returnMrsDetailsModel.value});
  }

  void getJobDetails(int? jobId, int facilityId) async {
    try {
      final _jobDetailsList = await editmrsReturnPresenter.getJobDetails(
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

  Future<void> getCmmsItemList(int orginmrsId) async {
    final _assetList = await editmrsReturnPresenter.getCmmsItemList(
        facilityId: facilityId, isLoading: false, mrsId: orginmrsId);
    if (_assetList != null) {
      for (var facility in _assetList) {
        for (var stockDetail in facility!.stockDetails) {
          StockDetailsList.add(stockDetail);
          //  StockDetailsList.value = facility?.stockDetails ?? [];
        }
      }

      rowItem.value = [];
      returnMrsDetailsModel.value!.cmmrsItems?.forEach((element) {
        rowItem.value.add([
          {
            "key": "Drop_down",
            "value": '${element.name}',
            "item_id": '${element.mrs_item_id}'
          },
          {'key': "Sr_No", "value": ''},
          {'key': "code", "value": ''},
          {'key': "Material_Type", "value": ''},
          {'key': "Issue_Qty", "value": ''},
          {'key': "Used_Qty", "value": ''},
          {'key': "Return_Qty", "value": '${element.returned_qty}'},
          {'key': "Remark", "value": '${element.return_remarks}'},
          // {'key': "Action ", "value": ''},
        ]);
        dropdownMapperData[element.name] = StockDetailsList.firstWhere(
            (e) => e!.asset_type == element.asset_type,
            orElse: null);
        // dropdownMapperData = element.approval_required;
      });
      // whereUsedId = _mrsDetailsModel.whereUsedTypeId ?? 0;
      activityCtrlr.text = returnMrsDetailsModel.value?.activity ?? "";
      // activityCtrlr.text = _mrsDetailsModel. ?? "";
      remarkCtrlr.text = returnMrsDetailsModel.value?.remarks ?? "";
      whereUsedCtrlr.text =
          returnMrsDetailsModel.value!.whereUsedTypeId.toString();
      // assetItemList.value = _assetList.s ?? [];
      //

      update(["AssetList"]);
    }

    // addRowItem();
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList =
        await editmrsReturnPresenter.getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      //for (var asset in _assetList) {
      assetList.value = _assetList;
      //  }

      rowFaultyItem.value = [];
      returnMrsDetailsModel.value!.cmmrsFaultyItems?.forEach((element) {
        rowFaultyItem.value.add([
          {
            "key": "Drop_down",
            "value": '${element.name}',
            "id": '${element.mrs_item_id}'
          },
          {
            'key': "assets",
            "value": '${element.fromActorName}',
            "id": '${element.fromActorID}'
          },

          // {'key': "code", "value": ''},
          // {'key': "Material_Type", "value": ''},
          // {'key': "Material_Category", "value": ''},
          {'key': "Sr_no", "value": '${element.serial_number}'},
          {'key': "Return_Qty", "value": '${element.returned_qty}'},
          {'key': "Remark", "value": '${element.return_remarks}'},
          {'key': "Action ", "value": ''},
          // {'key': "Action ", "value": ''},
        ]);
        dropdownFaultyMapperData[element.name] = assetList.firstWhere(
            (e) => e!.asset_code == element.asset_code,
            orElse: null);
        if (returnMrsDetailsModel.value?.whereUsedType == "JOBCARD") {
          checkdropdownMapperData[element.fromActorName ?? ""] =
              workingAreaList!.firstWhere(
                  (e) => e.name == element.fromActorName,
                  orElse: null);
        } else {
          checkdropdownMapperData[element.fromActorName ?? ""] =
              scheduleCheckPointsdrop.firstWhere(
                  (e) => e.name == element.fromActorName,
                  orElse: null);
        }
      });
      update(["AssetList"]);
    }
    // addRowFaultyItem();
  }

  void addRowItem() {
    rowItem.add([
      {"key": "Drop_down", "value": 'Please Select', 'item_id': ''},
      {'key': "Sr_No", "value": ''},
      {'key': "code", "value": ''},
      // {'key': "Material_Type", "value": ''},
      {'key': "Issue_Qty", "value": ''},
      {'key': "Used_Qty", "value": ''},
      {'key': "Return_Qty", "value": ''},
      {'key': "Remark", "value": ''},
      // {'key': "Action ", "value": ''},
    ]);
  }

  Future<void> getPmtaskViewList(
      {int? scheduleId, bool? isloading, required int facilityId}) async {
    scheduleCheckPoints.value = <ScheduleCheckPoint>[];
    scheduleCheckPointsdrop.value = <ScheduleCheckPoint>[];

    // rowItemclone.value = [];
    final _permitDetails = await editmrsReturnPresenter.getPmtaskViewList(
        scheduleId: returnMrsDetailsModel.value?.whereUsedTypeId,
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

  void addRowFaultyItem() {
    rowFaultyItem.add([
      {"key": "Drop_down", "value": 'Please Select', "id": ''},
      {'key': "assets", "value": '', "id": ''},
      // {'key': "code", "value": ''},
      // {'key': "Material_Type", "value": ''},
      // {'key': "Material_Category", "value": ''},
      {'key': "Sr_no", "value": ''},
      {'key': "Return_Qty", "value": '1'},
      {'key': "Remark", "value": ''},
      {'key': "Action ", "value": ''},
    ]);
  }

  Future<void> updateReturnMrs() async {
    String _activity = activityCtrlr.text.trim();
    String _remark = remarkCtrlr.text.trim();
    List<CmmsItem> items = [];
    List<FaultyItemsCmms> faultyItems = [];
    rowItem.forEach((element) {
      CmmsItem item = CmmsItem(
        mrs_item_ID: int.tryParse(element[0]["item_id"] ?? ''),
        returned_qty: dropdownMapperData[element[0]["value"]].issued_qty -
            dropdownMapperData[element[0]["value"]]
                .consumed_qty, //double.tryParse(element[3]["value"] ?? '0'),

        return_remarks: element[7]["value"] ?? '0',
      );
      items.add(item);
    });
    rowFaultyItem.forEach((element) {
      FaultyItemsCmms item = FaultyItemsCmms(
        assetMasterItemID:
            dropdownFaultyMapperData.value[element[0]["value"]]?.id,
        mrsItemID: int.tryParse(element[0]["id"] ?? '0'),
        assetsID: returnMrsDetailsModel.value?.whereUsedType == "JOBCARD"
            ? checkdropdownMapperData[element[1]["value"]].asset_id
            : checkdropdownMapperData[element[1]["value"]].assetsID,
        sr_no: element[2]["value"] ?? '0',
        returned_qty: int.tryParse(element[3]["value"] ?? '0'),
        return_remarks: element[4]["value"] ?? '0',
      );
      faultyItems.add(item);
    });
    CreateReturnMrsModel createMrs = CreateReturnMrsModel(
        ID: mrsId.value,
        facility_ID: facilityId,
        setAsTemplate: "", //isSetTemplate == true ? 1 : 0,
        activity: _activity,
        //1 is job,2 is pm

        whereUsedType: returnMrsDetailsModel.value?.whereUsedType == "PMTASK"
            ? 27
            : 4, //27,
        whereUsedTypeId: returnMrsDetailsModel.value?.whereUsedTypeId,
        to_actor_id: facilityId, //
        to_actor_type_id: returnMrsDetailsModel.value?.whereUsedType == "PMTASK"
            ? 2
            : 2, // to_actor_type_id.value,
        from_actor_type_id:
            returnMrsDetailsModel.value?.whereUsedType == "PMTASK"
                ? 3
                : 4, // fromActorTypeId.value,
        from_actor_id: returnMrsDetailsModel.value?.whereUsedTypeId,
        remarks: _remark,
        cmmrsItems: items,
        faultyItems: faultyItems);

    var createReturnMrsJsonString = createMrs.toJson();

    print({"createReturnMrsJsonString", createReturnMrsJsonString});
    Map<String, dynamic>? responseCreateReturnMrs =
        await editmrsReturnPresenter.updateReturnMrs(
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
}
