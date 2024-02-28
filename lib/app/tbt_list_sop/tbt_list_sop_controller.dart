import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/tbt_list_sop/tbt_list_sop_presenter.dart';
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/update_sop_model.dart';

class TBTSOPListController extends GetxController {
  TBTSOPListController(
    this.tbtSOPListPresenter,
  );
  TBTSOPListPresenter tbtSOPListPresenter;
  final HomeController homecontroller = Get.find();

  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isChecked = true.obs;

  ////File UPload
  RxString fileName = "".obs;
  Uint8List? fileBytes;
  RxString fileName2 = "".obs;
  Uint8List? fileBytes2;

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

  SOPListModel? selectedItem;

  ///SOP Permit List
  RxList<SOPListModel> sopPermitList = <SOPListModel>[].obs;
  Rx<bool> isSopPermitListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;

  PaginationController jobSOPListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  PaginationController jobListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;

  /// Job Type Permit List
  RxList<JobTypeListModel> jobTypeList = <JobTypeListModel>[].obs;
  Rx<bool> isJobTypeListSelected = true.obs;
  Rx<String> selectedJobType = ''.obs;
  RxList<String?> selectedJobTypeDataList = <String>[].obs;
  RxList<int?> selectedJobTypeIdList = <int>[].obs;
  int selectedJobTypesId = 0;

  /// TextFields Controller
  TextEditingController titleTextFieldCtrlr = TextEditingController();
  TextEditingController descriptionTextFieldCtrlr = TextEditingController();

  FocusNode titleFocus = FocusNode();
  ScrollController titleScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();

  ///Browse File Id's
  var jsaFileId;
  var sopFileId;

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getJobTypePermitList();
      });
      // Future.delayed(Duration(seconds: 1), () {
      //   getSopPermitList(selectedJobTypesId);
      // });

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
    });

    super.onInit();
  }

  Future<void> getSopPermitList(selectedJobTypesId) async {
    sopPermitList.value = <SOPListModel>[];
    final _sopPermitList = await tbtSOPListPresenter.getSopPermitList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobTypesId,
      // job_type_id: 36,
    );

    for (var sopPermit_list in _sopPermitList) {
      sopPermitList.add(sopPermit_list);
    }
    // selectedSopPermit.value = _sopPermitList[0].name ?? '';
    // selectedSopPermit.value = sopPermitList[0].name!;

    // supplierNameList = _supplierNameList;
    jobSOPListPaginationController = PaginationController(
      rowCount: sopPermitList.length,
      rowsPerPage: 10,
    );
    update(['sop_permit_list']);
  }

  Future<void> getJobTypePermitList() async {
    jobTypeList.value = <JobTypeListModel>[];
    final _jobTypeList = await tbtSOPListPresenter.getJobTypePermitList(
      isLoading: true,
      // categoryIds: cPategoryIds,
      facility_id: facilityId,
    );
    for (var jobType_list in _jobTypeList) {
      jobTypeList.add(jobType_list);
    }
    selectedJobType.value = jobTypeList[0].name ?? '';
    selectedJobTypesId = jobTypeList[0].id ?? 0;
    getSopPermitList(selectedJobTypesId);
    // supplierNameList = _supplierNameList;
    // jobListPaginationController = PaginationController(
    //   rowCount: jobTypeList.length,
    //   rowsPerPage: 10,
    // );
    // update(['job_Type_list']);
  }

  ///For View JSA File

  Future<bool> browseFiles(
      {Uint8List? fileBytes, required int position}) async {
    CreateSOPModel? createSOPModel =
        await tbtSOPListPresenter.browseFiles(fileBytes, fileName.value, true);
    if (position == 0) {
      jsaFileId = createSOPModel?.jsa_fileId;
    } else {
      sopFileId = createSOPModel?.sop_fileId;
    }
    return true;
  }

  void isSuccessDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Import JSA File'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 7, 161, 17),
              border: Border.all(
                color: Color.fromARGB(255, 7, 161, 17),
                width: 1,
              ),
            ),
            child: Icon(Icons.check, size: 35, color: ColorValues.whiteColor),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text("${fileName.value} \n JSA File import Successfully....",
                style: TextStyle(fontSize: 16, color: ColorValues.blackColor)),
          )
        ]),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              // Get.back();
              // Future.delayed(Duration(seconds: 2), () {
              //   fileName.value = "";
              // });
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  ///For View Sop Success Dialog

  void isSuccessDialog2() {
    Get.dialog(
      AlertDialog(
        title: Text('Import SOP File'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 7, 161, 17),
              border: Border.all(
                color: Color.fromARGB(255, 7, 161, 17),
                width: 1,
              ),
            ),
            child: Icon(Icons.check, size: 35, color: ColorValues.whiteColor),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
                "${fileName2.value} \n SOP File import Successfully....",
                style: TextStyle(fontSize: 16, color: ColorValues.blackColor)),
          )
        ]),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              // Get.back();
              // Future.delayed(Duration(seconds: 2), () {
              //   fileName.value = "";
              // });
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  ///Create SOP
  Future<bool> createSOP() async {
    if (titleTextFieldCtrlr.text.trim() == '' ||
        descriptionTextFieldCtrlr.text.trim() == '') {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = htmlEscape.convert(titleTextFieldCtrlr.text.trim());
      String _description =
          htmlEscape.convert(descriptionTextFieldCtrlr.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');

      CreateSOPModel createSOPModel = CreateSOPModel(
          title: _title,
          description: _description,
          tbt_jobType: selectedJobTypesId,
          tbt_remarks: "PM Document",
          sop_fileId: sopFileId,
          sop_file_desc: "PM Document",
          jsa_fileId: jsaFileId);
      var sopJsonString = createSOPModel.toJson();
      Map<String, dynamic>? responseSopCreate =
          await tbtSOPListPresenter.createSOP(
        createSop: sopJsonString,
        isLoading: true,
      );

      return true;
    }

    getSopPermitList(selectedJobTypesId);
    return true;
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
      case RxList<JobTypeListModel>:
        {
          int jobTypeListIndex = jobTypeList.indexWhere((x) => x.name == value);
          int jobIds = 0;
          if (jobTypeListIndex >= 0) {
            jobIds = jobTypeList[jobTypeListIndex].id ?? 0;
          }
          selectedJobTypesId = jobIds;
          print('TBT_JobType:$selectedJobTypesId');
          getSopPermitList(selectedJobTypesId);
          //}
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
    await {cleardata()};
  }

  cleardata() {
    // checklistNumberCtrlr.text = '';
    titleTextFieldCtrlr.text = '';
    descriptionTextFieldCtrlr.text = '';
    selectedItem = null;
    // selectedequipment.value = '';

    // selectedfrequency.value = '';
    Future.delayed(Duration(seconds: 1), () {
      // getPreventiveCheckList(facilityId, type, true);
      getSopPermitList(selectedJobTypesId);
    });

    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? business_id, String? business}) {
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
                  deleteSopType(business_id).then((value) {
                    Get.back();
                    getSopPermitList(selectedJobTypesId);
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

  Future<void> deleteSopType(String? business_id) async {
    {
      await tbtSOPListPresenter.deleteSopType(
        business_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateSop(checklistId) async {
    String _title = htmlEscape.convert(titleTextFieldCtrlr.text.trim());
    String _description =
        htmlEscape.convert(descriptionTextFieldCtrlr.text.trim());
    // "id": 314,
    // "title": "BM Document",
    // "description": "BM Document",
    // "tbt_jobType": 47,
    // "tbt_remarks": "BM Document",
    // "sop_fileId": 225,
    // "sop_file_desc": "BM Document",
    // "jsa_fileId": 220
    UpdateSOPModel createTbt = UpdateSOPModel(
        id: checklistId,
        title: _title,
        description: _description,
        tbt_jobType: selectedJobTypesId,
        tbt_remarks: "PM Document",
        sop_fileId: sopFileId,
        sop_file_desc: "PM Document",
        jsa_fileId: jsaFileId);
    var updateSop = createTbt.toJson();

    print({"updateTbt", updateSop});
    await tbtSOPListPresenter.updateSop(
      tbtJsonString: updateSop,
      isLoading: true,
    );
    return true;
  }
}
