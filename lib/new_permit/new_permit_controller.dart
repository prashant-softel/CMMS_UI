import 'dart:convert';

import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/app/widgets/create_permit_dialog.dart';
import 'package:cmms/app/widgets/job_saved_dialog.dart';
import 'package:cmms/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/domain/models/add_job_model.dart';
import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/create_permit_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cmms/domain/models/equipment_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/new_permit/new_permit_presenter.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/inventory_category_model.dart';

class NewPermitController extends GetxController {
 NewPermitController(
    this.permitPresenter,
    this.jobListPresenter
  );

  
  // PreventivePresenter preventivePresenter;


  int? selectedFacilityId = 0;
  int selectedTypePermitId = 0;

  NewPermitPresenter permitPresenter;
  JobListPresenter jobListPresenter;

  // create permit
  Rx<bool> isFormInvalid = false.obs;
  int selectedFacility_id = 0;
  RxList<InventoryModel?> selectedWorkAreaList = <InventoryModel>[].obs;








  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;

  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  Rx<String> selectedStartDate = ''.obs;
  Rx<bool> isStartdate = true.obs;
  Rx<bool> isEnddate = true.obs;



  var startDateTimeCtrlr = TextEditingController();
  var validTillTimeCtrlr = TextEditingController();

  var jobDescriptionCtrlr = TextEditingController();

  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;

  //block
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<bool> isBlockSelected = true.obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;

  int selectedBlockId = 0;
  RxList<EquipmentModel?> equipmentList = <EquipmentModel>[].obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  int selectedAssignedToId = 0;
  Rx<bool> isAssignedToSelected = true.obs;
  Rx<String> selectedAssignedTo = ''.obs;



    @override
  void onInit() async {
    //homePresenter.generateToken();
    //  Future.delayed(Duration(seconds: 1), () {
    await getInventoryCategoryList();
    await getAssignedToList();
    await getFacilityLists();
    await getFacilitiesLists();
    await getTypePermitList();

     
    //});

    super.onInit();
  }


  Future<void> getFacilitiesLists() async {
    facilityList.value = <FacilityModel>[];
    blockList.value = <BlockModel>[];
    final _facilityList = await jobListPresenter.getFacilityList();
     selectedFacilityId = Get.arguments;
    if (_facilityList != null) {
      facilityList.value = _facilityList;

      int facilityIndex =
          facilityList.indexWhere((x) => x?.id == selectedFacilityId);
      if (facilityIndex > -1) {
        selectedFacility.value = facilityList[facilityIndex]?.name ?? '';
        getBlocksList(selectedFacilityId!);
      }
    }
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

  Future<void> getAssignedToList() async {
    final _assignedToList =
        await permitPresenter.getAssignedToList();

    if (_assignedToList != null) {
      for (var _assignedTo in _assignedToList) {
        assignedToList.add(_assignedTo);
      }
      update(["assignedToList"]);
    }
  }


   void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
          if (selectedFacilityId != 0) {
            isFacilitySelected.value = true;
          }
          selectedFacility.value = value;
          getBlocksList(selectedFacilityId!);
        }
        break;

      case RxList<BlockModel>:
        {
          int blockIndex = blockList.indexWhere((x) => x?.name == value);
          selectedBlockId = blockList[blockIndex]?.id ?? 0;
          if (selectedBlockId > 0) {
            isBlockSelected.value = true;
          }
          selectedBlock.value = value;
          getInventoryCategoryList(facilityId: selectedBlockId.toString());
        }
        break;
      case RxList<EquipmentModel>:
        {
          int equipmentIndex =
              equipmentList.indexWhere((x) => x?.name == value);
          int selectedEquipmentId = equipmentList[equipmentIndex]?.id ?? 0;
          print(selectedEquipmentId);
        }
        break;
      case RxList<InventoryModel>:
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex = selectedEquipmentCategoryList
                .indexWhere((x) => x?.name == equipCat);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
          }
        }
        break;

      case RxList<EmployeeModel>:
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId != 0) {
            isAssignedToSelected.value = true;
          }
          selectedAssignedTo.value = value;
        }
        break;
         case RxList<TypePermitModel>:
        {
          int permitTypeIndex = typePermitList.indexWhere((x) => x?.name == value);
          selectedTypePermitId = facilityList[permitTypeIndex]?.id ?? 0;
          if (selectedTypePermitId != 0) {
            isTypePermitSelected.value = true;
          }
          selectedTypePermit.value = value;
          getBlocksList(selectedTypePermitId);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

Future<void> getBlocksList(int _facilityId) async {
    blockList.value = <BlockModel>[];
    final _blockList =
        await permitPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      update(["blockList"]);
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await permitPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityLists() async {
    final _facilityList = await permitPresenter.getFacilityLists();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList = await permitPresenter.getTypePermitList();

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  void checkForm() {
    if (selectedFacility.value == '') {
      isFacilitySelected.value = false;
    }
    if (selectedBlock.value == '') {
      isBlockSelected.value = false;
    }
    if (selectedTypeOfPermit.value == '') {
      isTypePermit.value = false;
    }
    if (startDateTimeCtrlr.text == '') {
      Fluttertoast.showToast(msg: 'Start date Field cannot be empty');
    }
    if (validTillTimeCtrlr.text == '') {
      Fluttertoast.showToast(msg: 'End date Field cannot be empty');
    }
    if(selectedTypePermit.value == ''){
      isTypePermitSelected.value = false;

    }
    if (jobDescriptionCtrlr.text.trim().length < 3) {
      isJobDescriptionInvalid.value = true;
    }
    if (isAssignedToSelected.value == false ||
        isFacilitySelected.value == false ||
        isBlockSelected.value == false ||
        isJobDescriptionInvalid == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  void createNewPermit() async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      //
      int facility_id = selectedFacility_id;
      // String _title = htmlEscape.convert(jobTitleCtrlr.text.trim());
      String _description = htmlEscape.convert(jobDescriptionCtrlr.text.trim());

      // List<Employeelist> employee_list= <Employeelist>[];
      // List<Safetyquestionlist> safety_question_list = <Safetyquestionlist>[];
      // List<LotoList> loto_list = <LotoList>[];



      // for (var _selectedWorkArea in selectedWorkAreaList) {
      //   var json = '{"asset_id": ${_selectedWorkArea?.id},'
      //       '"category_ids": ${_selectedWorkArea?.categoryId}}';

      //   // CreatePermitModel _employeeList = addCreatePermitModelFromJson(json);
      //   // employee_list.add(_employeeList as Employeelist);
      //   // CreatePermitModel _safetyQuestionList = addCreatePermitModelFromJson(json);
      //   // safety_question_list.add(_safetyQuestionList as Safetyquestionlist);
      //   // CreatePermitModel _lotoList = addCreatePermitModelFromJson(json);
      //   // loto_list.add(_lotoList as LotoList);
        

      //   // SafetyQuestionList _safetyQuestionList = addSafetyQuestionListFromJson(json);
      //   // safety_question_list.add(_safetyQuestionList);
      // }

      CreatePermitModel createPermitModel = CreatePermitModel(
        facility_id: 0,
        blockId: selectedBlockId,
        description: _description, 
        approver_id: 0, 
        category_ids: [], 
        block_ids: [], 
        employee_list: [], 
        start_datetime: "2022-12-26",
        end_datetime: "2022-12-27", 
        is_isolation_required: true, 
        isolated_category_ids: [], 
        issuer_id: 0, 
        lotoId: 0, 
        safety_question_list: [], 
        sop_type_id: 0, 
        typeId: 0, 
        user_id: 2, 
        work_type_id: 0, 
        Loto_list: [], 
      );
       var jobJsonString = createPermitModel.toJson();
       print({"jsonData5",jobJsonString});
      Map<String, dynamic>? responseNewPermitCreated =
          await permitPresenter.createNewPermit(
         newPermit: jobJsonString,
        isLoading: true,
      );
      if (responseNewPermitCreated != null) {
        print("respomsecghj,$responseNewPermitCreated");
        //  CreateNewPermitDialog();
         showAlertDialog();

        // print('NewCreated:$_facilityId');
      }
    }
  }

  static void showAlertDialog({
    int? facility_id,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(CreateNewPermitDialog());
  }

  //  void createCheckList() async {
  //   {
  //     await permitPresenter.createCheckList(
  //       isLoading: true,
  //     );
  //   }
  // }

  // void switchFacility(String? facilityName) {
  //   facilityId =
  //       facilityList.indexWhere((facility) => facility?.name == facilityName);
  //   getJobList(facilityId, userId);
  // }
  //  void onValueChanged(dynamic list, dynamic value) {
     
  //         int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
  //         selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
  //         if (selectedFacilityId != 0) {
  //           isFacilitySelected.value = true;
  //         }
  //         selectedFacility.value = value;
  //       }
    Future<void> createNewPermits() async {
    Get.toNamed(
      Routes.new_permit,
      
    );
    
  }
    
}
