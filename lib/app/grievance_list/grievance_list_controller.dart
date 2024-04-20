import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_grievance/widgets/grievance_created_dialog.dart';
import 'package:cmms/app/grievance_list/grievance_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/grievance_List_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../constant/constant.dart';

class GrievanceController extends GetxController {
  GrievanceController(
    this.grievanceListPresenter,
  );
  GrievanceListPresenter grievanceListPresenter;
  HomeController homeController = Get.find();
  RxList<GrievanceListModel?> grievanceList = <GrievanceListModel?>[].obs;
  RxList<String> grievanceListTableColumns = <String>[].obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<int> grievanceId = 0.obs;
  int facilityId = 0;
  int userId = 0;
  Rx<bool> isLoading = true.obs;
  bool openFromDateToStartDatePicker = false;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 70)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);
  RxString ActionFilterText = ''.obs;
  GrievanceListModel? grievanceModel;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  RxString GrievanceIdFilterText = ''.obs;
  RxString GrievanceTypeFilterText = ''.obs;
  RxString ConcernFilterText = ''.obs;
  RxString DescriptionFilterText = ''.obs;
  RxString CreatedAtFilterText = ''.obs;

  @override
  void onInit() async {
    this.filterText = {
      "Grievance Id": GrievanceIdFilterText,
      "Concern": ConcernFilterText,
      "Description": DescriptionFilterText,
      "Grievance Type": GrievanceTypeFilterText,
      "Created At": CreatedAtFilterText,
    };

    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        userId = varUserAccessModel.value.user_id ?? 0;
        getGrievanceList(facilityId, false, formattedFromdate, formattedTodate);
      });
    });
    super.onInit();
  }

  void onReady() {
    getGrievanceList(facilityId, false, formattedFromdate, formattedTodate);
    super.onReady();
  }

  void getGrievanceListByDate() {
    getGrievanceList(facilityId, false, formattedFromdate, formattedTodate);
  }

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Grievance Id": true,
    "Concern": true,
    "Description": true,
    "Grievance Type": true,
    "Created At": true,
  });

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  static void showAlertDialog({
    int? grievanceId,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
        GrievanceCreatedDialog(grievanceId: grievanceId, message: message));
  }

  Future<void> getGrievanceList(
    int facilityId,
    bool self_view,
    dynamic startDate,
    dynamic endDate,
  ) async {
    grievanceList.value = <GrievanceListModel>[];
    final _newPermitList = await grievanceListPresenter.getGrievanceList(
      facilityId: facilityId,
      isLoading: isLoading.value,
      self_view: true,
      start_date: startDate, //// "2020-01-01",
      end_date: endDate,
    );
    if (_newPermitList != null) {
      grievanceList.value = _newPermitList;
      // filteredData.value = grievanceList.value;
      isLoading.value = false;
      if (grievanceList.isNotEmpty) {
        GrievanceListModel? newPermitListModel = grievanceList[0];

        // newPermitListModel = filteredData[0];
        var newPermitListJson = newPermitListModel?.toJson();
        grievanceListTableColumns.value = <String>[];
        for (var key in newPermitListJson?.keys.toList() ?? []) {
          grievanceListTableColumns.add(key);
        }
      }
    }
    paginationController = PaginationController(
      rowCount: grievanceList.length,
      rowsPerPage: 10,
    );

    update(['grievance_list']);
  }

  void clearStoreData() {
    grievanceListPresenter.clearValue();
  }

  Future<void> editGrievance({int? grievanceId}) async {
    clearStoreData();
    Get.toNamed(Routes.addGrievance, arguments: {
      "grievanceId": grievanceId,
    });
  }

  Future<void> deleteGrievanceDetails({int? grievanceId}) async {
    {
      await grievanceListPresenter.deleteGrievanceDetails(
        Id: grievanceId,
        isLoading: true,
      );
    }
    getGrievanceList(facilityId, false, formattedFromdate, formattedTodate);
  }
}
