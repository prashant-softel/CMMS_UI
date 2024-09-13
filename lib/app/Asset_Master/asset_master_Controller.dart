// asset controller master
import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/asset_master_model.dart';
import '../../domain/models/create_modulelist_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'asset_master_Presenter.dart';

class AssetMasterController extends GetxController {
  AssetMasterController(
    this.moduleListPresenter,
  );
  // int scheduleId = 0;
  // RxBool isTouchable = true.obs;
  // var isToggleOn = false.obs;
  //
  // Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  // RxList<ScheduleCheckPoint?>? scheduleCheckPoints =
  //     <ScheduleCheckPoint?>[].obs;
  // ScheduleCheckPoint? scheduleCheckPointsModel;
  // PaginationController schedulePaginationController = PaginationController(
  //   rowCount: 0,
  //   rowsPerPage: 10,
  // );
  // RxList<String> scheduleCheckPointsTableColumns = <String>[].obs;
  // RxList<HistoryLog?>? historyLog = <HistoryLog?>[].obs;
  // HistoryLog? historyLogModel;
  AssetMasterPresenter moduleListPresenter;
  final HomeController homecontroller = Get.find();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
       // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  Rx<bool> isLoading = true.obs;
  RxString materialNameFilterText = ''.obs;
  RxString acdcFilterText = ''.obs;
  RxString materialTypeFilterText = ''.obs;
  RxString materialCategoryFilterText = ''.obs;

  RxString minRequiredQtyFilterText = ''.obs;
  RxString minReorderQtyTextFilterText = ''.obs;
  RxString descriptionFilterText = ''.obs;
  RxString unitofMeasurementFilterText = ''.obs;
  RxString approvalRequiredFilterText = ''.obs;

  RxList<AssetMasterModel?> AssetList = <AssetMasterModel?>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<AssetMasterModel?>? moduleList = <AssetMasterModel?>[].obs;
  RxList<AssetMasterModel> buffermodulelist = <AssetMasterModel>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxString mdmFilterText = ''.obs;
  Rx<int> AssetId = 0.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "MDM Code": true,
    "Material Name": true,
    "AC/DC": true,
    "Material Type": true,
    "Material Category": true,
    "Min. Qty": true,
    "Reorder Qty": true,
    "Description": true,
    "Unit Of Measurement": true,
    "Approval Required": true,
  });
  final Map<String, double> columnwidth = {
    "MDM Code": 200,
    "Material Name": 400,
    "AC/DC": 200,
    "Material Type": 200,
    "Material Category": 200,
    "Min. Qty": 200,
    "Reorder Qty": 200,
    "Description": 300,
    "Unit Of Measurement": 200,
    "Approval Required": 200,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  AssetMasterModel? moduleListModel;
  var isToggleOn = false.obs;
  var isToggle1On = false.obs;
  var isToggle2On = false.obs;
  var isToggle3On = false.obs;
  var isToggle4On = false.obs;
  var isToggle5On = false.obs;
  var isToggle6On = false.obs;
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  void toggle1() {
    isToggle1On.value = !isToggle1On.value;
  }

  void toggle2() {
    isToggle2On.value = !isToggle2On.value;
  }

  void toggle3() {
    isToggle3On.value = !isToggle3On.value;
  }

  void toggle4() {
    isToggle4On.value = !isToggle4On.value;
  }

  void toggle5() {
    isToggle5On.value = !isToggle5On.value;
  }

  void toggle6() {
    isToggle6On.value = !isToggle6On.value;
  }

  RxList<String> moduleListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var modulelistNumberCtrlr = TextEditingController();
  var featureCtrlr = TextEditingController();
  AssetMasterModel? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;
  @override
  void onInit() async {
    this.filterText = {
      "MDM Code": mdmFilterText,
      "Material Name": materialNameFilterText,
      "AC/DC": acdcFilterText,
      "Material Type": materialTypeFilterText,
      "Material Category": materialCategoryFilterText,
      "Min. Qty": minRequiredQtyFilterText,
      "Reorder Qty": minReorderQtyTextFilterText,
      "Description": descriptionFilterText,
      "Unit Of Measurement": unitofMeasurementFilterText,
      "Approval Required": approvalRequiredFilterText,
    };

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getAssetMasterList(facilityId, type, false);
      });
    });
    super.onInit();
  }

  void export() {
    getAssetMasterList(facilityId, type, true, isExportOnly: true);
  }

  Future<void> getAssetMasterList(int facilityId, int type, bool? isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      moduleList?.value = <AssetMasterModel>[];
      buffermodulelist.value = <AssetMasterModel>[];
    }

    final _moduleList = await moduleListPresenter.getAssetMasterList(
        facilityId: facilityId,
        type: type,
        isLoading: isLoading.value,
        isExport: isExport);

    if (_moduleList != null && !isExportOnly) {
      moduleList!.value = _moduleList;
      buffermodulelist.value =
          _moduleList.whereType<AssetMasterModel>().toList() ??
              <AssetMasterModel>[];
      isLoading.value = false;
    }
  }

  void search(String keyword) {
    print('Keyword: $keyword');

    if (keyword.isEmpty) {
      moduleList!.value = buffermodulelist.value;
    } else {
      List<AssetMasterModel> filteredList = buffermodulelist.where((Mrs) {
        return (Mrs.asset_code ?? '')
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            (Mrs.asset_name ?? '')
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            (Mrs.section ?? '').toLowerCase().contains(keyword.toLowerCase()) ||
            (Mrs.asset_type ?? '')
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            (Mrs.cat_name ?? '')
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            (Mrs.max_request_qty ?? '')
                .toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            (Mrs.reorder_qty ?? '')
                .toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            (Mrs.description ?? '')
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            (Mrs.measurement ?? '')
                .toLowerCase()
                .contains(keyword.toLowerCase()) ||
            (Mrs.approval_required ?? '')
                .toLowerCase()
                .contains(keyword.toLowerCase());
      }).toList();

      moduleList!.value = filteredList;

      // Update paginationController when the list changes
      paginationController = PaginationController(
        rowCount: moduleList!.length,
        rowsPerPage: 10,
      );
    }
  }

  Future<void> createModulelist() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }

  Future<bool> createModuleListNumber() async {
    if (modulelistNumberCtrlr.text.trim() == '' ||
        featureCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _moduleListNumber = modulelistNumberCtrlr.text.trim();
      String _featureNumber = featureCtrlr.text.trim();

      CreateModuleListModel createModuleList = CreateModuleListModel(
        moduleName: _moduleListNumber,
        featureName: _featureNumber,
        menuImage: null,
        add: isToggleOn.value ? 1 : 0,
        edit: isToggle1On.value ? 1 : 0,
        delete: isToggle2On.value ? 1 : 0,
        view: isToggle3On.value ? 1 : 0,
        approve: isToggle4On.value ? 1 : 0,
        issue: isToggle5On.value ? 1 : 0,
        selfView: isToggle6On.value ? 1 : 0,
      );

      var moduleListJsonString =
          createModuleList.toJson(); //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", moduleListJsonString});
      await moduleListPresenter.createModulelistNumber(
        modulelistJsonString: moduleListJsonString,
        isLoading: true,
      );
      return true;
    }
    getAssetMasterList(facilityId, type, false);
    return true;
  }

  Future<void> issuccessCreatemodulelist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {_cleardata()};
  }

  _cleardata() {
    modulelistNumberCtrlr.text = '';
    featureCtrlr.text = '';
    selectedItem = null;
    isToggleOn.value = false;
    isToggle1On.value = false;
    isToggle2On.value = false;
    isToggle3On.value = false;
    isToggle4On.value = false;
    isToggle5On.value = false;
    isToggle6On.value = false;
    Future.delayed(Duration(seconds: 1), () {
      getAssetMasterList(facilityId, type, false);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? module_id, String? module}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Module ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: module,
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
                  deleteModulelist(module_id).then((value) {
                    Get.back();
                    getAssetMasterList(facilityId, type, false);
                  });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deleteModulelist(String? module_id) async {
    {
      await moduleListPresenter.deleteModulelist(
        module_id,
        isLoading: true,
      );
    }
  }

  // Future<bool> updateModulelistNumber(moduleId) async {
  //   String _modulelistNumber = modulelistNumberCtrlr.text.trim();
  //   String _featurelistNumber = featureCtrlr.text.trim();
  //
  //   ModuleListModel createModulelist = ModuleListModel(
  //       id:moduleId,
  //       moduleName: _modulelistNumber,
  //       featureName: _featurelistNumber,
  //       menuImage : null,
  //       add : isToggleOn.value?1:0,
  //       edit: isToggle1On.value?1:0,
  //       delete: isToggle2On.value?1:0,
  //       view: isToggle3On.value?1:0,
  //       approve: isToggle4On.value?1:0,
  //       issue: isToggle5On.value?1:0,
  //       selfView: isToggle6On.value?1:0,
  //   )  ;
  //   var modulelistJsonString =
  //       createModulelist.toJson(); //createCheckListToJson([createChecklist]);
  //
  //   print({"modulelistJsonString", modulelistJsonString});
  //   await moduleListPresenter.updateModulelistNumber(
  //     modulelistJsonString: modulelistJsonString,
  //     isLoading: true,
  //   );
  //   return true;
  // }
  void getmoduleListByDate() {
    getAssetMasterList(facilityId, type, false);
  }

  void clearStoreData() {
    moduleListPresenter.clearValue();
  }

  void clearpmTaskValue() {
    moduleListPresenter.clearpmTaskValue();
  }

  void clearStoreTaskData() {
    moduleListPresenter.clearStoreTaskData();
  }

  void clearStoreTaskActivityData() {
    moduleListPresenter.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    moduleListPresenter.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    moduleListPresenter.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    moduleListPresenter.clearStoreTaskWhereUsedData();
  }
    void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }
    switch (columnName) {
      case 'MDM Code':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.asset_code ?? '').compareTo(b?.asset_code ?? '')
            : (b?.asset_code ?? '').compareTo(a?.asset_code ?? ''));
        break;
      case 'Material Name':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.asset_name ?? '').compareTo(b?.asset_name ?? '')
            : (b?.asset_name ?? '').compareTo(a?.asset_name ?? ''));
        break;
      case 'AC/DC':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.section ?? '').compareTo(b?.section ?? '')
            : (b?.section ?? '').compareTo(a?.section ?? ''));
        break;
      case 'Material Type':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.asset_type ?? '')
                .compareTo(b?.asset_type ?? '')
            : (b?.asset_type ?? '')
                .compareTo(a?.asset_type ?? ''));
        break;
      case 'Material Category':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.cat_name ?? '').compareTo(b?.cat_name ?? '')
            : (b?.cat_name ?? '').compareTo(a?.cat_name ?? ''));
        break;

      case 'Min. Qty':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.min_qty ?? 0).compareTo(b?.min_qty ?? 0)
            : (b?.min_qty ?? 0).compareTo(a?.min_qty ?? 0));
        break;
      case 'Reorder Qty':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.reorder_qty ?? 0).compareTo(b?.reorder_qty ?? 0)
            : (b?.reorder_qty ?? 0).compareTo(a?.reorder_qty ?? 0));
        break;
      case 'Description':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.description ?? '').compareTo(b?.description ?? '')
            : (b?.description ?? '').compareTo(a?.description ?? ''));
        break;
      case 'Unit Of Measurement':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.measurement ?? '').compareTo(b?.measurement ?? '')
            : (b?.measurement ?? '').compareTo(a?.measurement ?? ''));
        break;
      case 'Approval Required':
        moduleList!.sort((a, b) => isAscending.value
            ? (a?.approval_required ?? '').compareTo(b?.approval_required ?? '')
            : (b?.approval_required ?? '').compareTo(a?.approval_required ?? ''));
        break;
      default:
        break;
    }
    update();
  }
}
