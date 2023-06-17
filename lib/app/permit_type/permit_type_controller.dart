import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/permit_type/permit_type_presenter.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../constant/constant.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PermitTypeController extends GetxController {
  PermitTypeController(
    this.permitTypePresenter,
  );
  PermitTypePresenter permitTypePresenter;
  final HomeController homecontroller = Get.find();

  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<PreventiveCheckListModel?>? preventiveCheckList =
      <PreventiveCheckListModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // PreventiveCheckListModel? preventiveCheckListModel;

  ///Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  // int get facilityId => _facilityId.value;

  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<TypePermitModel?> typePermitModel = TypePermitModel().obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var checklistNumberCtrlr = TextEditingController();
  var manpowerCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

   PaginationController permitTypePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );


  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
       Future.delayed(Duration(seconds: 1), () {
        getTypePermitList();
      });
      // getPreventiveCheckList(facilityId, type, true);
      Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    });
    
    super.onInit();
  }

   Future<void> getFacilityList() async {
    final _facilityList = await permitTypePresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList = await permitTypePresenter.getTypePermitList(
      facility_id: facilityId
    );

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }

     permitTypePaginationController = PaginationController(
      rowCount: typePermitList.length,
      rowsPerPage: 10,
    );

  }

  // Future<void> getFrequencyList() async {
  //   final list = await permitTypePresenter.getFrequencyList();

  //   if (list != null) {
  //     for (var _frequencyList in list) {
  //       frequencyList.add(_frequencyList);
  //     }
  //   }
  // }

  // Future<void> getInventoryCategoryList() async {
  //   final list = await permitTypePresenter.getInventoryCategoryList();

  //   if (list != null) {
  //     for (var _equipmentCategoryList in list) {
  //       equipmentCategoryList.add(_equipmentCategoryList);
  //     }
  //   }
  // }

  // Future<void> getPreventiveCheckList(
  //     int facilityId, int type, bool isLoading) async {
  //   preventiveCheckList?.value = <PreventiveCheckListModel>[];
  //   final _preventiveCheckList =
  //       await permitTypePresenter.getPreventiveCheckList(
  //           facilityId: facilityId, type: type, isLoading: isLoading);

  //   if (_preventiveCheckList != null) {
  //     preventiveCheckList!.value = _preventiveCheckList;
  //     paginationController = PaginationController(
  //       rowCount: preventiveCheckList?.length ?? 0,
  //       rowsPerPage: 10,
  //     );

  //     if (preventiveCheckList != null && preventiveCheckList!.isNotEmpty) {
  //       preventiveCheckListModel = preventiveCheckList![0];
  //       var preventiveCheckListJson = preventiveCheckListModel?.toJson();
  //       preventiveCheckListTableColumns.value = <String>[];
  //       for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
  //         preventiveCheckListTableColumns.add(key);
  //       }
  //     }
  //   }
  // }

  // Future<void> createChecklist() async {
  //   Get.toNamed(
  //     Routes.createCheckList,
  //   );
  // }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          // int frequencyIndex =
              // frequencyList.indexWhere((x) => x?.name == value);
          // selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
       case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  // Future<bool> createChecklistNumber() async {
  //   if (checklistNumberCtrlr.text.trim() == '' ||
  //       selectedEquipmentId == 0 ||
  //       selectedfrequencyId == 0) {
  //     Fluttertoast.showToast(
  //         msg: "Please enter required field", fontSize: 16.0);
  //   } else {
  //     String _checklistNumber = checklistNumberCtrlr.text.trim();
  //     String _duration = durationCtrlr.text.trim();
  //     String _manpower = manpowerCtrlr.text.trim();

  //     CreateChecklist createChecklist = CreateChecklist(
  //         category_id: selectedEquipmentId,
  //         duration: int.tryParse(_duration) ?? 0,
  //         manPower: int.tryParse(_manpower) ?? 0,
  //         facility_id: facilityId,
  //         frequency_id: selectedfrequencyId,
  //         status: 1,
  //         type: 1,
  //         checklist_number: _checklistNumber);
  //     var checklistJsonString = [
  //       createChecklist.toJson()
  //     ]; //createCheckListToJson([createChecklist]);

  //     print({"checklistJsonString", checklistJsonString});
  //     await permitTypePresenter.createChecklistNumber(
  //       checklistJsonString: checklistJsonString,
  //       isLoading: true,
  //     );
  //     return true;
  //   }
  //   return true;
  // }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {_cleardata()};
  }

  _cleardata() {
    checklistNumberCtrlr.text = '';
    durationCtrlr.text = '';
    manpowerCtrlr.text = '';

    selectedequipment.value = '';

    selectedfrequency.value = '';
    // Future.delayed(Duration(seconds: 1), () {
    //   getPreventiveCheckList(facilityId, type, true);
    // });
    // Future.delayed(Duration(seconds: 5), () {
    //   isSuccess.value = false;
    // });
  }
}
