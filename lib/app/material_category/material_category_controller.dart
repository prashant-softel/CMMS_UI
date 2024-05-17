// ignore_for_file: unused_import

import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/material_category/material_category_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/material_category_model.dart';
import 'package:cmms/domain/models/pm_mapping_list_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class MaterialCategoryController extends GetxController {
  MaterialCategoryController(
    this.materialCategoryPresenter,
  );
  MaterialCategoryPresenter materialCategoryPresenter;

  final HomeController homeController = Get.find();
  MaterialCategoryListModel? selectedItem;
  MaterialCategoryListModel? selectedItemupdate;

  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isCheckedRequire = false.obs;
  Rx<bool> isContainerVisible = false.obs;
  int facilityId = 0;
  int type = 1;

//PreventiveCheckListModel? preventiveCheckListModel;
  RxList<String> preventiveCheckListTableColumns = <String>[].obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

//SOP permit List
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  RxList<MaterialCategoryListModel> MaterialList =
      <MaterialCategoryListModel>[].obs;
  RxList<MaterialCategoryListModel> BufferMaterialList =
      <MaterialCategoryListModel>[].obs;
  Rx<bool> isSPVListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;
  PaginationController MaterialListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      MaterialList.value = BufferMaterialList.value;
      return;
    }
    List<MaterialCategoryListModel> filteredList = BufferMaterialList.where(
        (item) => (item.name
                ?.toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()) ??
            false)).toList();
    MaterialList.value = filteredList;
  }

//Facility list/demo plant
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
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getMaterialList();
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

  Future<void> getMaterialList() async {
    MaterialList.value = <MaterialCategoryListModel>[];
    BufferMaterialList.value = <MaterialCategoryListModel>[];
    final _materialList = await materialCategoryPresenter.getMaterialList(
      isLoading: isLoading.value,
      //categoryIds:categoryIds,
      job_type_id: selectedJobSOPId,
      //Job_type_id:36,
    );
    isLoading.value = false;
    for (var facilityType_list in _materialList) {
      MaterialList.add(facilityType_list);
      BufferMaterialList.add(facilityType_list);
    }
    MaterialListPaginationController = PaginationController(
      rowCount: MaterialList.length,
      rowsPerPage: 10,
    );
    update(['Material_List']);
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<bool> createMaterialCategory() async {
    print("CREATE CONTROLLER");
    if (titleCtrlr.text.trim() == '') {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
    }

    checkForm();
    print("FORMVALIDITIY : $isFormInvalid.value");
    print("TITLE : $isTitleInvalid.value");
    if (isFormInvalid.value == true) {
      return false;
    }
    if (titleCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();

      CreateMaterialCategory createCheckpoint =
          CreateMaterialCategory(name: _title);
      print("OUT ");
      var facilitylistJsonString = createCheckpoint
          .toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await materialCategoryPresenter.createMaterialCategory(
        facilitylistJsonString: facilitylistJsonString,
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
    selectedItem = null;

    Future.delayed(Duration(seconds: 1), () {
      getMaterialList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updateMaterialCategory() async {
    String _name = titleCtrlr.text.trim();
    MaterialCategoryListModel createCheckList = MaterialCategoryListModel(
      id: selectedItem!.id,
      name: _name,
    );
    // var businessTypeJsonString=createCheckList.toJson();
    var businessTypeJsonString = materialCategoryToJson(createCheckList);
    print({"businessTypeJsonString", businessTypeJsonString});
    await materialCategoryPresenter.updateMaterialCategory(
      modulelistJsonString: businessTypeJsonString,
      isLoading: true,
    );
    return true;
  }

  void isDeleteDialog({String? mcategory_id, String? mcatergory}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the Material Category  ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[$mcatergory]",
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
                  deleteMaterialCategory(mcategory_id).then((value) {
                    Get.back();
                    getMaterialList();
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

  Future<void> deleteMaterialCategory(String? business_id) async {
    {
      await materialCategoryPresenter.deleteFacility(
        business_id,
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
