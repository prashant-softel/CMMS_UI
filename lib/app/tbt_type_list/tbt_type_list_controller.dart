import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/tbt_type_list/tbt_type_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';

import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';


class TBTTypeListController extends GetxController {
  TBTTypeListController(
    this.tbtTypeListPresenter,
  );
  TBTTypeListPresenter tbtTypeListPresenter;
  final HomeController homecontroller = Get.find();

 RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value = !isCheckedRequire.value; // Toggle the checkbox state
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

/// Job Type Permit List
  RxList<JobTypeListModel> jobTypeList = <JobTypeListModel>[].obs;
  Rx<bool> isJobTypeListSelected = true.obs;
  Rx<String> selectedJobType = ''.obs;
  RxList<String?> selectedJobTypeDataList = <String>[].obs;
  RxList<int?> selectedJobTypeIdList = <int>[].obs;
  
   PaginationController jobTypeListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;


  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
       Future.delayed(Duration(seconds: 1), () {
        getJobTypePermitList();
      });
       Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
      
    });
    
    super.onInit();
  }


   Future<void> getFacilityList() async {
    final _facilityList = await tbtTypeListPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }



  Future<void> getJobTypePermitList() async {
    jobTypeList.value = <JobTypeListModel>[];
    final _jobTypeList = await tbtTypeListPresenter.getJobTypePermitList(
      isLoading: true,
      // categoryIds: cPategoryIds,
      facility_id: 45,
    );
    if (_jobTypeList != null) {
      for (var jobType_list in _jobTypeList) {
        jobTypeList.add(jobType_list);
      }
      // selectedJobType.value = _jobTypeList[0].name ?? '';
      
    }
    // supplierNameList = _supplierNameList;
    jobTypeListPaginationController = PaginationController(
      rowCount: jobTypeList.length,
      rowsPerPage: 10,
    );
    update(['job_Type_list']);
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
