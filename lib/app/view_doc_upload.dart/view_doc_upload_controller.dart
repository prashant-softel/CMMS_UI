import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/view_doc_upload.dart/view_doc_upload_presenter.dart';
import 'package:cmms/domain/models/doc_upload_list_model.dart';
import 'package:cmms/domain/models/view_doc_upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewDocUploadController extends GetxController {
  ViewDocUploadController(
    this.viewDocUploadPresenter,
  );
  ViewDocUploadPresenter viewDocUploadPresenter;
  final HomeController homecontroller = Get.find();
  var docUploadDateTc = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<int> facilityId = 0.obs;
  Rx<int> selectedDocUploadId = 0.obs;
  RxList<ViewDocUpload> viewDocUploadList = <ViewDocUpload>[].obs;
  RxList<double> totalColumn = <double>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;
  GetDocUploadListModel? selectedItem;
  var subDocName = TextEditingController();

  String get end_date => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get start_date => DateFormat('yyyy-MM-dd').format(fromDate.value);

  @override
  void onInit() async {
    await setViewDocUpload();
    facilityIdStreamSubscription =
        homecontroller.facilityId$.listen((event) async {
      facilityId.value = event;
      await getDocuementListById(
        facilityID: facilityId.value,
        start_date: start_date,
        end_date: end_date,
        docUploadId: selectedDocUploadId.value,
        sub_doc_name: subDocName.text.isEmpty ? '' : subDocName.text,
      );
    });
    super.onInit();
  }

  Future<void> setViewDocUpload() async {
    try {
      var dataFromPreviousScreen = Get.arguments;
      selectedDocUploadId.value = dataFromPreviousScreen['docUploadId'];
      selectedItem = dataFromPreviousScreen['selectedItem'];

      if (selectedItem != null) {
        subDocName.text = selectedItem!.subDocName ?? '';
      }

      viewDocUploadPresenter.saveValue(
          docUploadId: selectedDocUploadId.value.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> getViewDocUploadListByDate() async {
    await getDocuementListById(
        facilityID: facilityId.value,
        start_date: start_date,
        end_date: end_date,
        docUploadId: selectedDocUploadId.value,
        sub_doc_name: subDocName.text);
  }

  Future<void> getDocuementListById({
    String? start_date,
    required String end_date,
    required int docUploadId,
    required int facilityID,
    String? sub_doc_name,
  }) async {
    String? _subDocName = sub_doc_name.toString();

    final _viewDocUploadDetail =
        await viewDocUploadPresenter.getDocuementListById(
      docUploadId: docUploadId,
      start_date: start_date,
      end_date: end_date,
      facilityID: facilityID,
      sub_doc_name: _subDocName,
    );

    if (_viewDocUploadDetail != null) {
      viewDocUploadList.value =
          _viewDocUploadDetail.whereType<ViewDocUpload>().toList();
    } else {
      viewDocUploadList.clear();
    }
  }

  void clearStoreData() {
    viewDocUploadPresenter.clearValue();
  }
}