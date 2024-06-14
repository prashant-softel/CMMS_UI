import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/document_master/document_master_presenter.dart';
import 'package:cmms/domain/models/documentmaster_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DocumentMasterController extends GetxController {
  DocumentMasterController(
    this.documentMasterPresenter,
  );
  DocumentMasterPresenter documentMasterPresenter;
  final HomeController homecontroller = Get.find();
  DocumentMasterModel? selectedItem;
  DocumentMasterModel? selectedItemupdate;
  Rx<bool> isFormInvalid = false.obs;
  RxBool isCheckedRequire = false.obs;
  RxBool isContainerVisible = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isChecked = true.obs;

  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  int facilityId = 0;
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
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///SOP Permit List
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<DocumentMasterModel> DocumentMaster = <DocumentMasterModel>[].obs;
  RxList<DocumentMasterModel> BufferDocumentMaster = <DocumentMasterModel>[].obs;
  Rx<bool> isDocumentMasterSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  RxList<DocumentMasterModel> filteredData = <DocumentMasterModel>[].obs;

  PaginationController DocumentMasterPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      DocumentMaster.value = BufferDocumentMaster.value;
      return;
    }
    List<DocumentMasterModel> filteredList = BufferDocumentMaster.where((item) =>
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.description
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) // Add this condition to filter by searchId
        ).toList();
    DocumentMaster.value = filteredList;
  }
  // void search(String keyword) {
  //   print('Keyword: $keyword');

  //   if (keyword.isEmpty) {
  //     DocumentMaster.value = filteredData.toList();
  //     print('DocumentMaster length (empty keyword): ${DocumentMaster.length}');
  //     return;
  //   }

  //   DocumentMaster.value = filteredData
  //       .where((item) =>
  //           item.name
  //               ?.toString()
  //               .toLowerCase()
  //               .contains(keyword.toLowerCase()) ??
  //           false)
  //       .toList();

  //   print('DocumentMaster length (non-empty keyword): ${DocumentMaster.length}');
  // }

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  FocusNode titleFocus = FocusNode();
  ScrollController titleScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getDocumentMaster();
      });
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

  Future<void> getDocumentMaster() async {
    DocumentMaster.value = <DocumentMasterModel>[];
    BufferDocumentMaster.value = <DocumentMasterModel>[];
    final _DocumentMaster = await documentMasterPresenter.getDocumentMaster(
      isLoading: isLoading.value,
      // categoryIds: categoryIds,
      job_type_id: selectedJobSOPId,
      // job_type_id: 36,
    );
    isLoading.value = false;
    for (var facilityType_list in _DocumentMaster) {
    DocumentMaster.add(facilityType_list);
    BufferDocumentMaster.add(facilityType_list);
  }
      // selectedSopPermit.value = _DocumentMaster[0].name ?? '';

    // supplierNameList = _supplierNameList;
    DocumentMasterPaginationController = PaginationController(
      rowCount: DocumentMaster.length,
      rowsPerPage: 10,
    );
    update(['DocumentMaster']);
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createDocumentMaster() async {
    print("CREATE CONTROLLER");
    if (titleCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
      // isDescriptionInvalid.value = true;
    }
    if (descriptionCtrlr.text.trim() == '') {
      // isTitleInvalid.value = true;
      isFormInvalid.value = true;
      isDescriptionInvalid.value = true;
    }
    checkForm();
    print("FORMVALIDITIY : $isFormInvalid.value");
    print("TITLE : $isTitleInvalid.value");
    print("DES : $isDescriptionInvalid.value");
    if (isFormInvalid.value == true) {
      return false;
    }
    if (titleCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      DocumentMasterModel createDocumentMaster =
          DocumentMasterModel( id:0,name: _title, description: _description);
      print("OUT ");
      var DocumentMasterJsonString = createDocumentMaster
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", DocumentMasterJsonString});
      await documentMasterPresenter.createDocumentMaster(
        DocumentMasterJsonString: DocumentMasterJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {cleardata()};
  }

  cleardata() {
    titleCtrlr.text = '';
    descriptionCtrlr.text = '';
    // selectedStateId = 0;
    // selectedCountryId = 0;
    // selectedCityId = 0;
    // ownerId = 0;
    selectedItem = null;
    // customerId = 0;
    // operatorId = 0;
    // SpvId = 0;

    Future.delayed(Duration(seconds: 1), () {
      getDocumentMaster();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateDocumentMaster(checklistId) async {
    String _name = titleCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    DocumentMasterModel createChecklist = DocumentMasterModel(
      id: checklistId,
      name: _name,
      description: _description,
    );
    var DocumentMasterJsonString = createChecklist.toJson();

    print({"DocumentMasterJsonString", DocumentMasterJsonString});
    await documentMasterPresenter.updateDocumentMaster(
      DocumentMasterJsonString: DocumentMasterJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({String? DocumentMaster_id, String? DocumentMaster}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the DocumentMaster ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$DocumentMaster]",
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
                  deleteDocumentMaster(DocumentMaster_id).then((value) {
                    Get.back();
                    getDocumentMaster();
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

  Future<void> deleteDocumentMaster(String? DocumentMaster_id) async {
    {
      await documentMasterPresenter.deleteDocumentMaster(
        DocumentMaster_id,
        isLoading: true,
      );
    }
  }

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
}
