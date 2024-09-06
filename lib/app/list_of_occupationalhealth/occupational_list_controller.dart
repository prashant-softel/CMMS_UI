
import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:cmms/app/list_of_occupationalhealth/occupational_list_presenter.dart';
import 'package:cmms/domain/models/get_occupational_list_model.dart';

class OccupationalDataListController extends GetxController {
  OccupationalDataListController(
    this.occupationalListPresenter,
  );
  OccupationalListPresenter occupationalListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetOccupationalList> occupationalhealthList = <GetOccupationalList>[].obs;
  RxList<GetOccupationalList> filteredData = <GetOccupationalList>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetOccupationalList? getoccupationaList;
  RxList<String> occupationalListListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  GetOccupationalList? selectedItem;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> occupationId = 0.obs;
   RxString idFilterText = ''.obs;
   RxString healthexamsFilterText = ''.obs;
  RxString periodictestsFilterText = ''.obs;
  RxString illnessesFilterText = ''.obs;
  RxString monthFilterText = ''.obs;
    RxString yearFilterText = ''.obs;
  RxString submitedFilterText = ''.obs;
  RxString createdbyFilterText = ''.obs;
  RxString createdatFilterText = ''.obs;
  RxString actionFilterText = ''.obs;


  RxString userDateFilterText = ''.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Id":true,
    "No Of Health Exams Of New Joiner": true,
    "Periodic Tests": true,
    "Occupational Illnesses": true,
    "Month": true,
    // "Created By": true,
       "Year": true,
    "Submited by": true,
    "Created At": true,
    // "Status": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Id": 100,
   "No Of Health Exams Of New Joiner": 350,
    "Periodic Tests": 220,
    "Occupational Illnesses": 230,
    "Month": 150,
        "Year": 100,
    "Submited by": 150,
    // "Created By": 150,
    "Created At": 150,
    // "Status": 100
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      "Id":idFilterText,
      "No Of Health Exams Of New Joiner": healthexamsFilterText,
      "Periodic Tests": periodictestsFilterText,
      "Occupational Illnesses": illnessesFilterText,
      "Month": monthFilterText,
          "Year": yearFilterText,
      "Submited by": submitedFilterText,
      // "Created By": createdbyFilterText,
      "Created At": createdatFilterText,
      "Action": actionFilterText,
      // "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getHealthDatalist(false);
      });
    });
    super.onInit();
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      occupationalhealthList.value = filteredData.value;
      return;
    }
    List<GetOccupationalList> filteredList = filteredData
        .where((item) =>
            (item.noOfHealthExamsOfNewJoiner
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) 
       
            )
        .toList();
    occupationalhealthList.value = filteredList;
  }

  Future<void> getHealthDatalist(
     bool isExport) async {
    occupationalhealthList.value = <GetOccupationalList>[];
    filteredData.value = <GetOccupationalList>[];

    final _goodsordersList =
        await occupationalListPresenter.getHealthDatalist(
            isLoading: isLoading.value,
            // start_date: startDate,
            // end_date: endDate,
            // facility_id: facilityId,
            isExport: isExport);
    occupationalhealthList.value = _goodsordersList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: occupationalhealthList.length,
      rowsPerPage: 10,
    );
    if (occupationalhealthList.isNotEmpty) {
      filteredData.value = occupationalhealthList.value;
      getoccupationaList = occupationalhealthList[0];
      var newOccupationalListJson = getoccupationaList?.toJson();
      occupationalListListTableColumns.value = <String>[];
      for (var key in newOccupationalListJson?.keys.toList() ?? []) {
        occupationalListListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }



  void clearStoreData() {
    occupationalListPresenter.clearValue();
  }

  Future<void> editHealth({int? healthId}) async {
    clearStoreData();
    Get.toNamed(Routes.createOccupationalScreen, arguments: {
      "healthId": healthId,
    });
  }
  Future<void> deleteHealth({int? HealthId}) async {
    {
      await occupationalListPresenter.deleteHealth(
        Id: HealthId,
        isLoading: true,
      );
    }
  getHealthDatalist(false);
}
void isDeleteDialog({int? HealthId, String? Healthlist}) {
    Get.dialog(
      AlertDialog(
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Delete Health List", style: Styles.blackBold16),
              Divider(
                color: ColorValues.appLightGreyColor,
              ),
              Dimens.boxHeight5,
              RichText(
                text: TextSpan(
                    text: 'Are you sure you want to delete the Health Data',
                    style: Styles.blackBold16,
                    children: [
                      TextSpan(
                        text: Healthlist,
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
              CustomElevatedButton(
                  backgroundColor: ColorValues.appRedColor,
                  onPressed: () {
                    Get.back();
                  },
                  text: 'No'),
              CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  onPressed: () {
                    deleteHealth(HealthId: HealthId).then((value) {
                      Get.back();
                      getHealthDatalist(false);
                    });
                  },
                  text: 'Yes'),
            ],
          ),
          Dimens.boxHeight5
        ],
      ),
    );
  }
}
