import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/competency_model.dart';
import '../../domain/models/create_competency_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'competency_list_presenter.dart';

class CompetencyListController extends GetxController {
  CompetencyListController(
    this.competencyListPresenter,
  );
  CompetencyListPresenter competencyListPresenter;
  final HomeController homecontroller = Get.find();
  FocusNode nameFocus = FocusNode();
  ScrollController nameScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  Rx<bool> isTitleInvalid = false.obs;
  RxBool isContainerVisible = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<CompetencyModel?>? competencyList = <CompetencyModel?>[].obs;
  RxList<CompetencyModel> filteredData = <CompetencyModel>[].obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  CompetencyModel? competencyListModel;

  RxList<String> competencyListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var nameCtrlr = TextEditingController();
  CompetencyModel? selectedItem;
  var descriptionCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<bool> isLoading = true.obs;

  @override
  void onInit() async {
    // facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
    //   facilityId = event;
    //   Future.delayed(Duration(seconds: 2), () {
    getCompetencyList();
    //   });
    // });
    nameFocus.addListener(() {
      if (!nameFocus.hasFocus) {
        nameScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<void> getCompetencyList() async {
    competencyList?.value = <CompetencyModel>[];
    final _competencyList =
        await competencyListPresenter.getCompetencyList(isLoading: isLoading.value);

    if (_competencyList != null) {
      competencyList!.value = _competencyList.cast<CompetencyModel?>();
      isLoading.value = false;
      paginationController = PaginationController(
        rowCount: competencyList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (competencyList != null && competencyList!.isNotEmpty) {
        competencyListModel = competencyList![0];
        var competencyListJson = competencyListModel?.toJson();
        competencyListTableColumns.value = <String>[];
        for (var key in competencyListJson?.keys.toList() ?? []) {
          competencyListTableColumns.add(key);
        }
      }
    }
  }

  Future<void> createCompetencyList() async {
    Get.toNamed(
      Routes.createCheckList,
    );
  }

  void checkForm() {
    if (isTitleInvalid.value == true || isDescriptionInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  Future<bool> createCompetency() async {
    if (nameCtrlr.text.trim() == '') {
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
    if (nameCtrlr.text.trim() == '' || descriptionCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _name = nameCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CreateCompetency createCompetencyList =
          CreateCompetency(name: _name, description: _description);
      var competencyJsonString = createCompetencyList
          .toJson(); //createCheckListToJson([createCompetencyList]);

      print({"competencyJsonString", competencyJsonString});
      await competencyListPresenter.createCompetency(
        competencyJsonString: competencyJsonString,
        isLoading: true,
      );
      return true;
    }
    getCompetencyList();
    return true;
  }

  Future<void> issuccessCompetency() async {
    isSuccess.toggle();

    await {cleardata()};
  }

  cleardata() {
    nameCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getCompetencyList();
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      competencyList?.value = filteredData;
      // return;
    }

    competencyList?.value = filteredData
        .where((item) =>
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.description
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
  }
  // void search(String keyword) {
  //   print('Keyword: $keyword');
  //   if (keyword.isEmpty) {
  //     competencyList?.value = BufferCompetencyList.value;
  //     return;
  //   }
  //   List<CompetencyModel> filteredList = BufferCompetencyList.where((item) =>
  //           (item.name
  //                   ?.toString()
  //                   .toLowerCase()
  //                   .contains(keyword.toLowerCase()) ??
  //               false) ||
  //           (item.description
  //                   ?.toString()
  //                   .toLowerCase()
  //                   .contains(keyword.toLowerCase()) ??
  //               false) // Add this condition to filter by searchId
  //       ).toList();
  //   competencyList?.value = filteredList;
  // }

  void isDeleteDialog(
      {String? checklist_id,
      String? checklist,
      String? business_id,
      String? business}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the competency ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "[${checklist}]",
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
                  deleteCompetencyList(checklist_id).then((value) {
                    Get.back();
                    getCompetencyList();
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

  Future<void> deleteCompetencyList(String? checklist_id) async {
    {
      await competencyListPresenter.deleteCompetencyList(
        checklist_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateCompetency(checklistId) async {
    String _name = nameCtrlr.text.trim();
    String _description = descriptionCtrlr.text.trim();

    CompetencyModel createCompetencyList = CompetencyModel(
        id: checklistId, name: _name, description: _description);
    var competencyJsonString = createCompetencyList
        .toJson(); //createCheckListToJson([createCompetencyList]);

    print({"competencyJsonString", competencyJsonString});
    await competencyListPresenter.updateCompetency(
      competencyJsonString: competencyJsonString,
      isLoading: true,
    );
    return true;
  }
}
