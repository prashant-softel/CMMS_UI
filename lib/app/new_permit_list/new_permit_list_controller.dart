import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/permit_issue_message_dialog.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/block_model.dart';
// import '../navigators/app_pages.dart';
// import 'job_list_presenter.dart';

class NewPermitListController extends GetxController {
  ///
  NewPermitListController(
    this.newPermitListPresenter,
  );
  NewPermitListPresenter newPermitListPresenter;

  final HomeController controller = Get.find();

  ///
  // var newPermitLists = <NewPermitListModel>[];

  RxList<NewPermitListModel?>? newPermitList = <NewPermitListModel?>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  int facilityId = 45;
  int userId = 33;
  Rx<int> permitId = 0.obs;
  var breakdownTime;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  NewPermitListModel? newPermitListModel;
  RxList<String> newPermitListTableColumns = <String>[].obs;
  PaginationController newPermitPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  TextEditingController commentTextFieldCtrlr = TextEditingController();







  ///
  @override
  void onInit() async {
    //homePresenter.generateToken();

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList(isLoading: true);
      Future.delayed(Duration(milliseconds: 500), () {
        getNewPermitList(facilityId, userId);
      });
      // Future.delayed(Duration(milliseconds: 500), () {
      //   getPermitIssueButton();
      // });
    });

    super.onInit();
  }

  void switchFacility(String? facilityName) {
    facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
    getNewPermitList(facilityId, userId);
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await newPermitListPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getNewPermitList(int facilityId, int userId) async {
    newPermitList!.value = <NewPermitListModel>[];
    final _newPermitList = await newPermitListPresenter.getNewPermitList(
        facilityId: facilityId,
        // facilityId: 45,
        // userId: userId,
        userId: userId
        );


    if (_newPermitList != null) {
      newPermitList!.value = _newPermitList;
      newPermitPaginationController = PaginationController(
        rowCount: newPermitList!.length,
        rowsPerPage: 10,
      );

      if (newPermitList != null && newPermitList!.isNotEmpty) {
        newPermitListModel = newPermitList![0];
        var newPermitListJson = newPermitListModel?.toJson();
        newPermitListTableColumns.value = <String>[];
        for (var key in newPermitListJson?.keys.toList() ?? []) {
          newPermitListTableColumns.add(key);
        }
      }
    }

    update(['new_permit_list']);
  }

  Future<void> permitIssueButton({String? permitId}) async{    String _comment = commentTextFieldCtrlr.text.trim();

    final _permitIssueBtn = await newPermitListPresenter.permitIssueButton(
    comment: _comment,id:permitId ,employee_id: "136",
        );

  }

  //  void getNewPermitList() async {
  //   newPermitLists = <NewPermitListModel>[];

  //   final list = await newPermitListPresenter.getNewPermitList(
  //     isLoading: true,
  //     // categoryIds: categoryIds,
  //     facilityId: facilityId,
  //     userId: 33

  //   );
  //    print('New Permit List:$newPermitLists');
  //   if (list != null) {
  //     // selectedSupplierNameList.clear();
  //     // supplierNameList.clear();
  //     Set<String> newPermitSet = {};
  //     for(var _newPermitList in list){
  //       if(_newPermitList.permitId != null){
  //         newPermitSet.add(_newPermitList.equipment ?? "");
  //         // supplierNameList.add(_supplierNameList);
  //       }
  //       print('New Permit Data:$newPermitSet');
  //       // selectedSupplierNameList.addAll(supplierNameSet.toList());
  //       // print('New Permit5:$selectedSupplierNameList');

  //     }

  //     // for (var supplier_name_list in list) {
  //     //   supplierNameList.add(supplier_name_list);
  //     // }
  //   }
  //   newPermitLists = list;
  //   newPermitPaginationController = PaginationController(
  //     rowCount: newPermitLists.length,
  //     rowsPerPage: 10,
  //   );
  //   update(['new_permit_list']);
  // }

  Future<void> permitIssueButton({String? permitId}) async{    String _comment = commentTextFieldCtrlr.text.trim();

    final _permitIssueBtn = await newPermitListPresenter.permitIssueButton(
    comment: _comment,id:permitId ,employee_id: "136",
        );

  }

//  void getNewPermitList() async {
  //   newPermitLists = <NewPermitListModel>[];

  //   final list = await newPermitListPresenter.getNewPermitList(
  //     isLoading: true,
  //     // categoryIds: categoryIds,
  //     facilityId: facilityId,
  //     userId: 33

  //   );
  //    print('New Permit List:$newPermitLists');
  //   if (list != null) {
  //     // selectedSupplierNameList.clear();
  //     // supplierNameList.clear();
  //     Set<String> newPermitSet = {};
  //     for(var _newPermitList in list){
  //       if(_newPermitList.permitId != null){
  //         newPermitSet.add(_newPermitList.equipment ?? "");
  //         // supplierNameList.add(_supplierNameList);
  //       }
  //       print('New Permit Data:$newPermitSet');
  //       // selectedSupplierNameList.addAll(supplierNameSet.toList());
  //       // print('New Permit5:$selectedSupplierNameList');

  //     }

  //     // for (var supplier_name_list in list) {
  //     //   supplierNameList.add(supplier_name_list);
  //     // }
  //   }
  //   newPermitLists = list;
  //   newPermitPaginationController = PaginationController(
  //     rowCount: newPermitLists.length,
  //     rowsPerPage: 10,
  //   );
  //   update(['new_permit_list']);
  // }

  Future<void> permitIssueButton({String? permitId}) async{    String _comment = commentTextFieldCtrlr.text.trim();

    final _permitIssueBtn = await newPermitListPresenter.permitIssueButton(
    comment: _comment,id:permitId ,employee_id: "136",
        );

  }

  Future<void> permitIssueButton({String? permitId}) async{    String _comment = commentTextFieldCtrlr.text.trim();

    final _permitIssueBtn = await newPermitListPresenter.permitIssueButton(
    comment: _comment,id:permitId ,employee_id: "136",
        );

  }


  Future<void> addNewPermitList() async {
    Get.toNamed(Routes.newPermit, arguments: facilityId);
  }

  void goToJobCardScreen(int? jobId) {
    Get.toNamed(Routes.jobCard, arguments: jobId);
  }


  void showNewPermitListDetails(int _jobId) {
    // Get.toNamed(Routes.jobDetails, arguments: _jobId);
  }

   static void showAlertDialog({
    String? comment,
    int? employee_id,
    int? id,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(PermitMessageIssueDialog());
  }

   static void showAlertDialog({
    String? comment,
    int? employee_id,
    int? id,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(PermitMessageIssueDialog());
  }

  ///
}
