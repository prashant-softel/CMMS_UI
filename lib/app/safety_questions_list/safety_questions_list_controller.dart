import 'dart:async';

import 'package:cmms/app/app.dart';

import 'package:cmms/app/safety_questions_list/safety_questions_presenter.dart';

import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';

class SafetyQuestionsListController extends GetxController {
  SafetyQuestionsListController(
    this.safetyQuestionsListPresenter,
  );
  SafetyQuestionsListPresenter safetyQuestionsListPresenter;
  final HomeController homecontroller = Get.find();

  ///Permit Type list
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  int selectedTypePermitId = 0;


  ////
  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///Safety Measurement Question List
  RxList<SafetyMeasureListModel> safetyMeasureList =
      <SafetyMeasureListModel>[].obs;

  PaginationController safetyQuestionListPaginationController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      print('FacilityIdSafetyQuestion$facilityId');
      Future.delayed(Duration(seconds: 1), () {
       
        getTypePermitList();
      });
      
      // getPreventiveCheckList(facilityId, type, true);
    });

    super.onInit();
  }

  Future<void> getSafetyMeasureList() async {
    safetyMeasureList.value = <SafetyMeasureListModel>[];
    final _safetyMeasureList =
        await safetyQuestionsListPresenter.getSafetyMeasureList(
      isLoading: true,
      // categoryIds: categoryIds,
      permit_type_id: selectedTypePermitId,
      // job_type_id: 36,
    );
    if (_safetyMeasureList != null) {
      for (var safetyMeasure_list in _safetyMeasureList) {
        safetyMeasureList.add(safetyMeasure_list);
      }
    }
    // supplierNameList = _supplierNameList;
    safetyQuestionListPaginationController = PaginationController(
      rowCount: safetyMeasureList.length,
      rowsPerPage: 10,
    );
    update(['safety_measure_list']);
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList =
        await safetyQuestionsListPresenter.getTypePermitList(
            facility_id:facilityId 
            // facility_id: 45
            );
    print('FacilityIdForSafetyQuestions$facilityId');

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      // selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          // int equipmentIndex =
          //     equipmentCategoryList.indexWhere((x) => x?.name == value);
          // selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          // int frequencyIndex =
          // frequencyList.indexWhere((x) => x?.name == value);
          // selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
        case RxList<TypePermitModel>:
        {
          int typePermitIndex =
          typePermitList.indexWhere((x) => x?.name == value);
          selectedTypePermitId = typePermitList[typePermitIndex]?.id ?? 0;
           getSafetyMeasureList();
          print('Permit Type Id:$selectedTypePermitId');
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> issuccessCreatechecklist() async {
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
