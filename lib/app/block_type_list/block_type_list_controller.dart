import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/block_type_list/block_type_list_presenter.dart';
import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/block_type_list_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_block_type_model copy.dart';
import '../../domain/models/facility_type_list_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';

class BlockTypeListController extends GetxController {
  BlockTypeListController(
    this.blockTypeListPresenter,
  );
  BlockTypeListPresenter blockTypeListPresenter;
  final HomeController homecontroller = Get.find();

  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isChecked = true.obs;

  Rx<String> selectedfacility = ''.obs;
  Rx<bool> isSelectedfacility = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  int blockId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // PreventiveCheckListModel? preventiveCheckListModel;

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? blockIdStreamSubscription;

  ///SOP Permit List
  RxList<BlockTypeListModel> blockTypeList = <BlockTypeListModel>[].obs;
  RxList<FacilityTypeListModel> facilityTypeList =
      <FacilityTypeListModel>[].obs;
  Rx<bool> isblockTypeListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedFacilityId = 0;

  PaginationController blockTypeListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  //Facility list / demo plant
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<bool> isblockSelected = true.obs;
  Rx<String> selectedBlock = ''.obs;
  BehaviorSubject<int> _blockId = BehaviorSubject.seeded(0);
  Stream<int> get blockId$ => _blockId.stream;

  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    blockIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      blockId = event;
      Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
        getBlockTypeList();
      });
    });

    super.onInit();
  }

  Future<void> getFacilityList() async {
    facilityTypeList.value = <FacilityTypeListModel>[];
    final _FacilityTypeList = await blockTypeListPresenter.getFacilityList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedFacilityId,
      // job_type_id: 36,
    );
    if (_FacilityTypeList != null) {
      for (var facilityType_list in _FacilityTypeList) {
        facilityTypeList.add(facilityType_list);
      }
    }
  }

  Future<void> getBlocks(dynamic selected) async {
    print("in getBlocks function");
    print(selected);
  }

  Future<void> getBlockTypeList() async {
    blockTypeList.value = <BlockTypeListModel>[];
    final _blockTypePermitList = await blockTypeListPresenter.getBlockTypeList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedFacilityId,
      // job_type_id: 36,
    );
    if (_blockTypePermitList != null) {
      for (var blockType_list in _blockTypePermitList) {
        blockTypeList.add(blockType_list);
      }
      // selectedSopPermit.value = _facilityTypeList[0].name ?? '';
    }

    // supplierNameList = _supplierNameList;
    blockTypeListPaginationController = PaginationController(
      rowCount: blockTypeList.length,
      rowsPerPage: 10,
    );
    update(['block_type_list']);
  }

  Future<bool> createBlockList() async {
    print(
        "title : ${titleCtrlr.text.trim()} , description : ${descriptionCtrlr.text.trim()} ");
    if (titleCtrlr.text.trim() == '' ||
        descriptionCtrlr.text.trim() == '' ||
        selectedFacilityId == 0) {
      // Fluttertoast.showToast(
      //     msg: "Please enter required field", fontSize: 16.0);
      print("Fields are blank, please enter dat ato create");
    } else {
      String _title = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();
      CreateBlockTypeModel createBlockList = CreateBlockTypeModel(
        name: _title,
        description: _description,
        photoId: 0,
        parentId: selectedFacilityId,
      );
      var blockTypeJsonString = createBlockList
          .toJson(); //createCheckPointToJson([createCheckpoint]);
      bool loading = true;
      print({"checkpointJsonString", blockTypeJsonString});
      final bool res = await blockTypeListPresenter.createBlockType(
        blocktypelistJsonString: blockTypeJsonString,
        isLoading: loading,
      );
      print(res);
      return true;
    }
    return true;
  }

  dynamic onValueChanged(RxList<FacilityTypeListModel> value, dynamic list) {
    print("onValueChange function. list : $list and value is : $value");
    String newValue = list.toString();
    print(" Selected Facility : ");

    int indexId = facilityTypeList.indexWhere((x) => x.name == newValue);
    int facilityIds = 0;
    if (indexId > 0) {
      facilityIds = facilityTypeList[indexId].id ?? 0;
    }
    print("index received is : $indexId & facility id  : $facilityIds");
    print(selectedfacility);
    selectedFacilityId = facilityIds;
    getBlockTypeList();
  }

  Future<void> issuccessCreateBlock() async {
    isSuccess.toggle();
    await {_cleardata()};
  }

  _cleardata() {
    // checklistNumberCtrlr.text = '';
    // durationCtrlr.text = '';
    // manpowerCtrlr.text = '';

    // selectedequipment.value = '';

    // selectedfrequency.value = '';
    // Future.delayed(Duration(seconds: 1), () {
    //   getPreventiveCheckList(facilityId, type, true);
    // });
    // Future.delayed(Duration(seconds: 5), () {
    //   isSuccess.value = false;
    // });
  }
}
