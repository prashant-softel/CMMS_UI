import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/wc_certificates_list/wc_certificates_list_presenter.dart';

import 'package:cmms/domain/models/wc_certificate_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WcCertificatesListController extends GetxController {
  WcCertificatesListController(this.wcCertificatesListPresenter);
  WcCertificatesListPresenter wcCertificatesListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<WcCertificatesListModel> wcCertificateList =
      <WcCertificatesListModel>[].obs;
  RxList<WcCertificatesListModel> filteredData =
      <WcCertificatesListModel>[].obs;
  Rx<int> assetsId = 0.obs;
  RxString assetsIdFilterText = ''.obs;

  RxString assetNameFilterText = ''.obs;
  RxString categoryNameFilterText = ''.obs;
  RxString warrantyDescriptionFilterText = ''.obs;
  RxString warrantyTypeNameFilterText = ''.obs;
  RxString warrantyTermNameFilterText = ''.obs;
  RxString warrantyStartDateFilterText = ''.obs;
  RxString warrantyExpiryDateFilterText = ''.obs;
  RxString certificateNumberFilterText = ''.obs;
  RxString warrantyProviderNameFilterText = ''.obs;

  // For sorting
  RxString currentSortColumn = ''.obs;
  RxBool isAscending = true.obs;

  // Start DateTime
  bool openStartDatePicker = false;
  var startDateTimeCtrlr = TextEditingController();

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Asset Id': true,
    'Asset Name': true,
    'Category Name': true,
    'Description': true,
    'Warranty Type': true,
    'Warranty Term': true,
    'Start Date': true,
    'Expiry Date': true,
    'Certificate Number': true,
    'Provider Name': true,
  });
  final Map<String, double> columnwidth = {
    'Asset Id': 150,
    'Asset Name': 200,
    'Category Name': 200,
    'Description': 200,
    'Warranty Type': 200,
    'Warranty Term': 200,
    'Start Date': 150,
    'Expiry Date': 150,
    'Certificate Number': 300,
    'Provider Name': 200,
  };

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
  }

  WcCertificatesListModel? wcCertificatesListModel;
  RxList<String> wcCertificatesListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  Rx<bool> isLoading = true.obs;
  @override
  void onInit() async {
    this.filterText = {
      'Asset Id': assetsIdFilterText,
      'Asset Name': assetNameFilterText,
      'Category Name': categoryNameFilterText,
      'Description': warrantyDescriptionFilterText,
      'Warranty Type': warrantyTypeNameFilterText,
      'Warranty Term': warrantyTermNameFilterText,
      'Start Date': warrantyStartDateFilterText,
      'Expiry Date': warrantyExpiryDateFilterText,
      'Certificate Number': certificateNumberFilterText,
      'Provider Name': warrantyProviderNameFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getwcCertifiacteList(facilityId, false);
      });
    });
    super.onInit();
  }

  void export() {
    getwcCertifiacteList(
      facilityId,
      true,
    );
  }

  Future<void> getwcCertifiacteList(int facilityId, bool isExport,
      {bool isExportOnly = false}) async {
    if (!isExportOnly) {
      wcCertificateList.value = <WcCertificatesListModel>[];
      filteredData.value = <WcCertificatesListModel>[];
    }

    final _wcCertificateList =
        await wcCertificatesListPresenter.getwcCertifiacteList(
            isLoading: isLoading.value,
            facility_id: facilityId,
            isExport: isExport);

    if (!isExportOnly) {
      wcCertificateList.value = _wcCertificateList;
      isLoading.value = false;

      paginationController = PaginationController(
        rowCount: wcCertificateList.length,
        rowsPerPage: 10,
      );

      if (wcCertificateList.isNotEmpty) {
        filteredData.value = wcCertificateList.value;

        wcCertificatesListModel = wcCertificateList[0];
        var wcCertificatesJson = wcCertificatesListModel?.toJson();
        wcCertificatesListTableColumns.value = <String>[];
        for (var key in wcCertificatesJson?.keys.toList() ?? []) {
          wcCertificatesListTableColumns.add(key);
        }
      }
    }
  }

  void wcCertifiacteListByDate() {
    getwcCertifiacteList(facilityId, false);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      wcCertificateList.value = filteredData.value;
      return;
    }
    List<WcCertificatesListModel> filteredList = filteredData
        .where((item) => (item.assetName
                ?.toString()
                .toLowerCase()
                .contains(keyword.toLowerCase()) ??
            false))
        .toList();
    wcCertificateList.value = filteredList;
  }

  void sortData(String columnName) {
    if (currentSortColumn.value == columnName) {
      isAscending.value = !isAscending.value;
    } else {
      currentSortColumn.value = columnName;
      isAscending.value = true;
    }

    switch (columnName) {
      case 'Asset Id':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.asset_id!.compareTo(b.asset_id!)
            : b.asset_id!.compareTo(a.asset_id!));
        break;
      case 'Asset Name':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.assetName!.compareTo(b.assetName!)
            : b.assetName!.compareTo(a.assetName!));
        break;
      case 'Category Name':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.categoryName!.compareTo(b.categoryName!)
            : b.categoryName!.compareTo(a.categoryName!));
        break;
      case 'Description':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.warrantyDescription!.compareTo(b.warrantyDescription!)
            : b.warrantyDescription!.compareTo(a.warrantyDescription!));
        break;
      case 'Warranty Type':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.warrantyTypeName!.compareTo(b.warrantyTypeName!)
            : b.warrantyTypeName!.compareTo(a.warrantyTypeName!));
        break;
      case 'Warranty Term':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.warrantyTermName!.compareTo(b.warrantyTermName!)
            : b.warrantyTermName!.compareTo(a.warrantyTermName!));
        break;
      case 'Start Date':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.warrantyStartDate!.compareTo(b.warrantyStartDate!)
            : b.warrantyStartDate!.compareTo(a.warrantyStartDate!));
        break;
      case 'Expiry Date':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.warrantyExpiryDate!.compareTo(b.warrantyExpiryDate!)
            : b.warrantyExpiryDate!.compareTo(a.warrantyExpiryDate!));
        break;
      case 'Certificate Number':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.certificateNumber!.compareTo(b.certificateNumber!)
            : b.certificateNumber!.compareTo(a.certificateNumber!));
        break;
      case 'Provider Name':
        wcCertificateList.sort((a, b) => isAscending.value
            ? a.warrantyProviderName!.compareTo(b.warrantyProviderName!)
            : b.warrantyProviderName!.compareTo(a.warrantyProviderName!));
        break;
      default:
        break;
    }
    update(); // Notify listeners about the change
  }
}
