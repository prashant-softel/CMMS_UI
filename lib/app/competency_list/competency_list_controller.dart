import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
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
  // final HomeController homecontroller = Get.put( HomeController.new);
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<CompetencyModel?>? competencyList =
      <CompetencyModel?>[].obs;
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
  @override
  void onInit() async {

    // facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
    //   facilityId = event;
    //   Future.delayed(Duration(seconds: 2), () {
        getCompetencyList( true);
    //   });
    // });
    super.onInit();
  }


  Future<void> getCompetencyList(
       bool isLoading) async {
    competencyList?.value = <CompetencyModel>[];
    final _competencyList =
    await competencyListPresenter.getCompetencyList(
         isLoading: isLoading);

    if (_competencyList != null) {
      competencyList!.value = _competencyList.cast<CompetencyModel?>();
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


  Future<bool> createCompetency() async {
    if (nameCtrlr.text.trim() == '' ||
        descriptionCtrlr.text.trim()=='') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _name = nameCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CreateCompetency createCompetencyList = CreateCompetency(
          name: _name,
          description: _description
      );
      var competencyJsonString = 
        createCompetencyList.toJson(); //createCheckListToJson([createCompetencyList]);

      print({"competencyJsonString", competencyJsonString});
      await competencyListPresenter.createCompetency(
        competencyJsonString: competencyJsonString,
        isLoading: true,
      );
      return true;
    }
    getCompetencyList(true);
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();

    await {_cleardata()};
  }

  _cleardata() {
    nameCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;
    Future.delayed(Duration(seconds: 1), () {
      getCompetencyList( true);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? checklist_id, String? checklist}) {
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
                    text: checklist,
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
                    getCompetencyList( true);
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
        id:checklistId,
        name: _name,
        description: _description
    );
    var competencyJsonString =
    createCompetencyList.toJson(); //createCheckListToJson([createCompetencyList]);

    print({"competencyJsonString", competencyJsonString});
    await competencyListPresenter.updateCompetency(
      competencyJsonString: competencyJsonString,
      isLoading: true,
    );
    return true;
  }
}
