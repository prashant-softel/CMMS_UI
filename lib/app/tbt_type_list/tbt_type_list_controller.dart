import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/tbt_type_list/tbt_type_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/create_tbt_type_list_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  JobTypeListModel? selectedItem;
  Rx<bool> isTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;

  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
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
  int? selectedFacilityId = 0;

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
        getJobTypePermitList(selectedFacilityId);
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
      selectedFacilityId = facilityList[0]?.id ;
      getJobTypePermitList(selectedFacilityId);
    }
  }



  Future<void> getJobTypePermitList(selectedFacilityId) async {
    jobTypeList.value = <JobTypeListModel>[];
    final _jobTypeList = await tbtTypeListPresenter.getJobTypePermitList(
      isLoading: true,
      // categoryIds: cPategoryIds,
      facility_id: selectedFacilityId,
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


  void checkForm() {
    if(isTitleInvalid.value == true || isDescriptionInvalid.value == true){
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }
  Future<bool> createJobType() async {
    if (titleCtrlr.text.trim() == '' ) {
      isTitleInvalid.value = true;
      isFormInvalid.value = true;
      // isDescriptionInvalid.value = true;
    }
    if (descriptionCtrlr.text.trim() == '' ) {
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

      CreateTbtTypeModel createCheckpoint = CreateTbtTypeModel(
          title: _title,
          description: _description,
        facilityId:selectedFacilityId
      );
      print("OUT ");
      var facilitylistJsonString = createCheckpoint.toJson(); //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", facilitylistJsonString});
      await tbtTypeListPresenter.createJobType(
        facilitylistJsonString: facilitylistJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {

       case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          // int facilityId = 0;
          if (facilityIndex >= 0) {
            facilityId = facilityList[facilityIndex]?.id ?? 0;
          }
          selectedFacilityId = facilityId;

          // _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          getJobTypePermitList(selectedFacilityId);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }
  Future<bool> updateTbt(checklistId) async {
    String _name = titleCtrlr.text.trim();

    JobTypeListModel createTbt = JobTypeListModel(
      id: checklistId,
      name : _name,
      facilityId: selectedFacilityId,
    );
    var updateTbt =
    createTbt.toJson();

    print({"updateTbt", updateTbt});
    await tbtTypeListPresenter.updateTbt(
      tbtJsonString: updateTbt,
      isLoading: true,
    );
    return true;
  }
 

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {cleardata()};
  }

  cleardata() {

    titleCtrlr.text = '';
    descriptionCtrlr.text = '';
    selectedItem = null;
    isCheckedRequire.value = false;
    Future.delayed(Duration(seconds: 1), () {
      getJobTypePermitList(selectedFacilityId);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({
    String? business_id ,
    String? business
  }) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),

          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the TBT Type ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: business,
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
                  deleteJobType(business_id).then((value) {
                    Get.back();
                    getJobTypePermitList(selectedFacilityId);
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
  Future<void> deleteJobType(String? business_id) async {
    {
      await tbtTypeListPresenter.deleteJobType(
        business_id,
        isLoading: true,
      );
    }
  }

}
