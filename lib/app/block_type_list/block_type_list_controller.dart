import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/block_type_list/block_type_list_presenter.dart';
import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/block_type_list_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_block_type_model copy.dart';
import '../../domain/models/facility_type_list_model.dart';
import '../../domain/models/update_block_type_list_model.dart';

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
  RxBool isContainerVisible = false.obs;
  RxBool isChecked = true.obs;
  BlockTypeListModel? selectedItem;
  Rx<bool> isNameInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;

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
  final isSuccess = false.obs;

  ///SOP Permit List
  RxList<BlockTypeListModel> blockTypeList = <BlockTypeListModel>[].obs;
  RxList<BlockTypeListModel> bufferblockTypeList = <BlockTypeListModel>[].obs;

  RxList<FacilityTypeListModel> facilityTypeList =
      <FacilityTypeListModel>[].obs;
  RxList<FacilityTypeListModel> BufferFacilityTypeList =
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
  FocusNode titleFocus = FocusNode();
  ScrollController titleScroll = ScrollController();
  var descriptionCtrlr = TextEditingController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      if (facilityId > 0) {
        Future.delayed(Duration(seconds: 1), () {
          getBlockTypeList(facilityId);
        });
      }
    });

    titleFocus.addListener(() {
      if (!titleFocus.hasFocus) {
        titleScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');

    if (keyword.isEmpty) {
      print('blockTypeList length (empty keyword): ${blockTypeList.length}');
      blockTypeList.value = bufferblockTypeList.value;
      return;
    }

    // Use print statements to debug the filtering logic
    List<BlockTypeListModel> filteredList = bufferblockTypeList
        .where((item) =>
            item.name
                ?.toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()) ??
            false)
        .toList();

    print('Filtered list length: ${filteredList.length}');

    blockTypeList.value = filteredList;
    print('blockTypeList length (non-empty keyword): ${blockTypeList.length}');
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<void> getBlockTypeList(selectedFacilityId) async {
    blockTypeList.value = <BlockTypeListModel>[];
    bufferblockTypeList.value = <BlockTypeListModel>[];

    final _blockTypePermitList = await blockTypeListPresenter.getBlockTypeList(
      isLoading: isLoading.value,
      // categoryIds: categoryIds,
      job_type_id: selectedFacilityId,
      // job_type_id: 36,
    );
    isLoading.value = false;
    for (var blockType_list in _blockTypePermitList) {
      blockTypeList.add(blockType_list);
      bufferblockTypeList.add(blockType_list);
    }
  
    update(['block_type_list']);
  }

  void checkForm() {
    if (isNameInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<bool> createBlockList() async {
    if (titleCtrlr.text.trim() == '') {
      isNameInvalid.value = true;
      // isDescriptionInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (descriptionCtrlr.text.trim() == '') {
      // isNameInvalid.value = true;
      isDescriptionInvalid.value = true;
      isFormInvalid.value = true;
    }
    checkForm();
    if (isFormInvalid.value == true) {
      return false;
    }
    print(
        "title : ${titleCtrlr.text.trim()} , description : ${descriptionCtrlr.text.trim()} ");
    if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
      print("Fields are blank, please enter data to create");
    } else {
      String _title = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();
      CreateBlockTypeModel createBlockList = CreateBlockTypeModel(
        name: _title,
        description: _description,
        photoId: 0,
        parentId: facilityId,
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
    // String newValue = list.toString();
    print(" Selected Facility : ");

    if(value != "Please Select"){
      int indexId = facilityTypeList.indexWhere((x) => x.name == list);
    int facilityIds = 0;
    if (indexId >= 0) {
      facilityIds = facilityTypeList[indexId].id ?? 0;
    }
    print("index received is : $indexId & facility id  : $facilityIds");
    print(selectedfacility);
    selectedFacilityId = facilityIds;

    getBlockTypeList(facilityId);
    }else{
      selectedFacilityId=0;
    }
  }

  Future<bool> updateBlock(int? businessId) async {
    // id = businessId;
    String _businessName = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();
    // String _email = emailCtrlr.text.trim();
    // String _contactPerson = contactpersonCtrlr.text.trim();
    // String _contactNumber = contactnumberCtrlr.text.trim();
    // String _website = websiteCtrlr.text.trim();
    // String _location = locationCtrlr.text.trim();
    // String _address = addressCtrlr.text.trim();
    // String _zip = zipCtrlr.text.trim();
    //
    UpdateBlockTypeListModel updateBusinessList = UpdateBlockTypeListModel(
      id: businessId,
      name: _businessName,
      description: _description,
      parentId: facilityId,
    );
    var modulelistJsonString = updateBusinessList.toJson();

    print({"modulelistJsonString", modulelistJsonString});
    await blockTypeListPresenter.updateBlock(
      modulelistJsonString: modulelistJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({String? business_id, String? business}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Block ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$business]",
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
                  deleteBusiness(business_id).then((value) {
                    Get.back();
                    getBlockTypeList(facilityId);
                    // getBusinessList(selectedBusinessTypeId, true);
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

  Future<void> deleteBusiness(String? business_id) async {
    {
      await blockTypeListPresenter.deleteBlock(
        business_id,
        isLoading: true,
      );
    }
  }

  Future<void> issuccessCreateBlock() async {
    isSuccess.toggle();
    await {cleardata()};
  }

  cleardata() {
    titleCtrlr.text = '';
    descriptionCtrlr.text = '';
    // manpowerCtrlr.text = '';
    // selectedfacility.value = '';
    // selectedFacilityId = 0;

    selectedItem = null;

    // selectedequipment.value = '';

    // selectedfrequency.value = '';
    Future.delayed(Duration(seconds: 1), () {
      // get(facilityId, type, true);
      getBlockTypeList(facilityId);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }
}
