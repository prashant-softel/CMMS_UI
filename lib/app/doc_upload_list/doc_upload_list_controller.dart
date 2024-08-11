import 'dart:async';
import 'package:cmms/app/doc_upload_list/doc_upload_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/doc_upload_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class DocumentManagerController extends GetxController {
  DocumentManagerController(
    this.documentManagerPresenter,
  );
  DocumentManagerPresenter documentManagerPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetDocUploadListModel> docUploadList = <GetDocUploadListModel>[].obs;
  RxList<GetDocUploadListModel> filteredData = <GetDocUploadListModel>[].obs;
  Rx<int> docUploadId = 0.obs;
  RxString docIdFilterText = ''.obs;
  RxString docNameFilterText = ''.obs;
  RxString subDocNameFilterText = ''.obs;
  RxString renewDateFilterText = ''.obs;
  RxString addedAtFilterText = ''.obs;
  RxString addedByFilterText = ''.obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Doc ID": true,
    "Doc Name": true,
    "Sub Doc Name": true,
    "Renew Date": true,
    "Added At": true,
    "Added By": true,
  });
  final Map<String, double> columnwidth = {
    "Doc ID": 103,
    "Doc Name": 320,
    "Sub Doc Name": 220,
    "Renew Date": 250,
    "Added At": 250,
    "Added By": 250,
  };

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetDocUploadListModel? docUploadListModel;
  RxList<String> docUploadListTableColumns = <String>[].obs;
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
      "Doc ID": docIdFilterText,
      "Doc Name": docNameFilterText,
      "Sub Doc Name": subDocNameFilterText,
      "Renew Date": renewDateFilterText,
      "Added At": addedAtFilterText,
      "Added By": addedByFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        await getDocUploadList(
            facilityId, formattedTodate1, formattedFromdate1, false);
      });
    });
    super.onInit();
  }

  Future<void> getDocUploadList(
      int facilityId, dynamic startDate, dynamic endDate, bool isExport) async {
    docUploadList.value = <GetDocUploadListModel>[];
    filteredData.value = <GetDocUploadListModel>[];

    final _docUploadList = await documentManagerPresenter.getDocUploadList(
        isLoading: isLoading.value,
        start_date: startDate,
        end_date: endDate,
        facility_id: facilityId,
        isExport: isExport);
    docUploadList.value = _docUploadList;
    isLoading.value = false;
    paginationController = PaginationController(
      rowCount: docUploadList.length ?? 0,
      rowsPerPage: 10,
    );

    if (docUploadList.isNotEmpty) {
      filteredData.value = docUploadList.value;
      docUploadListModel = docUploadList[0];
      var docUploadListJson = docUploadListModel?.toJson();
      docUploadListTableColumns.value = <String>[];
      for (var key in docUploadListJson?.keys.toList() ?? []) {
        docUploadListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void getROListByDate() {
    getDocUploadList(facilityId, formattedTodate1, formattedFromdate1, false);
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      docUploadList.value = filteredData.value;
      return;
    }
    List<GetDocUploadListModel> filteredList = filteredData
        .where((item) =>
            (item.id
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.addedAt
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.addedBy
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.docMasterId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.fileId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.renewDate
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    docUploadList.value = filteredList;
  }

  // Future<void> deleteGoodsOrders(String? id) async {
  //   await documentManagerPresenter.deleteFacility(
  //     id,
  //     isLoading: true,
  //   );
  // }

  void clearStoreData() {
    documentManagerPresenter.clearValue();
  }

  void export() {
    getDocUploadList(facilityId, formattedTodate1, formattedFromdate1, true);
  }
}
