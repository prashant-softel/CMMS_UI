import 'package:cmms/domain/models/checkpoint_list_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_checkpoint_model.dart';
import 'preventive_check_point_presenter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PreventiveCheckPointController extends GetxController {
  PreventiveCheckPointController(
    this.preventiveCheckPointPresenter,
  );
  PreventiveCheckPointPresenter preventiveCheckPointPresenter;
  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  Rx<String> selectedchecklist = ''.obs;
  Rx<bool> isSelectedchecklist = true.obs;
  int facilityId = 45;
  int type = 1;
   var checkPointCtrlr = TextEditingController();
  var requirementCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
 Rx <int> selectedchecklistId = 0.obs;
  RxList<CheckPointModel?>? preventiveCheckpoint =
      <CheckPointModel?>[].obs;
        CheckPointModel? preventiveCheckpointmodel;
 RxList<String> preventiveCheckPointTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  @override
  void onInit() async {
    getPreventiveCheckList(facilityId, type);

    super.onInit();
  }

  var isToggleOn = false.obs;
 final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  Future<void> getPreventiveCheckList(facilityId, type) async {
    final list = await preventiveCheckPointPresenter.getPreventiveCheckList(
      facilityId: facilityId,
      type: type,
    );

    if (list != null) {
      for (var _checkList in list) {
        checkList.add(_checkList);
      }
    }
    selectedchecklist.value = checkList[0]?.id.toString() ?? '';
      // selectedchecklistId = checkList[0]?.id ?? 0;
     getCheckPointlist(selectedchecklistId: selectedchecklist.value);
  }
 Future<bool> createCheckpoint() async {
  if(checkPointCtrlr.text.trim()==''||requirementCtrlr.text.trim()==''){
        Fluttertoast.showToast(
            msg: "Please enter required field", fontSize: 16.0);
    }else{
    String _checkPoint = checkPointCtrlr.text.trim();
    String _requirement = requirementCtrlr.text.trim();
int _checklistId=int.tryParse(selectedchecklist.value)??0;
    CreateCheckpoint createCheckpoint= CreateCheckpoint(
        check_point: _checkPoint,
       
        requirement: _requirement,
        checklist_id: _checklistId,
        is_document_required:isToggleOn.value?1:0 ,status: 1
       );
              var checkpointJsonString = createCheckPointToJson([createCheckpoint]);

   print({"checkpointJsonString",checkpointJsonString});
    await preventiveCheckPointPresenter.createCheckPoint(
      checkpointJsonString: checkpointJsonString,
      isLoading: true,
    );
    return true;
    }return false;
  }
   Future<void> getCheckPointlist({required String selectedchecklistId }) async {
    preventiveCheckpoint?.value = <CheckPointModel>[];
    final _preventiveCheckpoint =
        await preventiveCheckPointPresenter.getCheckPointlist(selectedchecklistId:int.tryParse(selectedchecklistId)
     
    );

    if (_preventiveCheckpoint != null) {
      preventiveCheckpoint!.value = _preventiveCheckpoint;
      paginationController = PaginationController(
        rowCount: preventiveCheckpoint!.length,
        rowsPerPage: 10,
      );

      if (preventiveCheckpoint != null && preventiveCheckpoint!.isNotEmpty) {
        preventiveCheckpointmodel = preventiveCheckpoint![0];
        var preventiveCheckListJson = preventiveCheckpointmodel?.toJson();
        preventiveCheckPointTableColumns.value = <String>[];
        for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
          preventiveCheckPointTableColumns.add(key);
        }
      }
    }
  }

  void issuccessCreatecheckpont()  {
         isSuccess.toggle();
         checkPointCtrlr.text='';
         requirementCtrlr.text='';
         isToggleOn.value=false;
          getCheckPointlist(
                                              selectedchecklistId: 
                                                  selectedchecklist.value);
 
}
 
}

