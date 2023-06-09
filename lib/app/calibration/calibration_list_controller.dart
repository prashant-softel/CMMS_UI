import 'dart:async';

import 'package:cmms/domain/models/request_calibration_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/business_list_model.dart';
import '../../domain/models/calibration_list_model.dart';
import '../home/home_controller.dart';
import '../navigators/app_pages.dart';
import 'calibration_list_presenter.dart';

class CalibrationListController extends GetxController {
  ///
  CalibrationListController(
    this.calibrationListPresenter,
  );
  CalibrationListPresenter calibrationListPresenter;
  final HomeController homecontroller = Get.find();

  TextEditingController previousDateController =
      TextEditingController(text: "");
  TextEditingController nextDueDateController = TextEditingController(text: "");

  RxList<BusinessListModel?> venderNameList = <BusinessListModel>[].obs;
  Rx<bool> isVenderNameSelected = true.obs;
  Rx<String> selectedVender = ''.obs;
  int selectedvenderId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<CalibrationListModel?>? calibrationList =
      <CalibrationListModel?>[].obs;
  CalibrationListModel? calibrationListModel;
  RxList<String> CalibrationListTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getCalibrationList(facilityId, false);
      });
    });
    Future.delayed(Duration(seconds: 1), () {
      getVenderNameList();
    });
    super.onInit();
  }

  Future<void> getCalibrationList(int facilityId, bool isLoading) async {
    calibrationList?.value = <CalibrationListModel>[];
    final _calibrationList = await calibrationListPresenter.getCalibrationList(
        facilityId: facilityId, isLoading: isLoading);
    if (_calibrationList != null) {
      calibrationList!.value = _calibrationList;
      paginationController = PaginationController(
        rowCount: calibrationList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (calibrationList != null && calibrationList!.isNotEmpty) {
        calibrationListModel = calibrationList![0];
        var calibrationListJson = calibrationListModel?.toJson();
        CalibrationListTableColumns.value = <String>[];
        for (var key in calibrationListJson?.keys.toList() ?? []) {
          CalibrationListTableColumns.add(key);
        }
      }
    }
  }

  void getVenderNameList() async {
    venderNameList.value = <BusinessListModel>[];
    final _venderNameList = await calibrationListPresenter.getVenderNameList(
      isLoading: true,
      businessType: 4,
    );
    if (_venderNameList != null) {
      for (var supplier_list in _venderNameList) {
        venderNameList.add(supplier_list);
      }
    }
  }

  Future<void> calibrationHistory() async {
    Get.toNamed(
      Routes.CalibrationHistory,
    );
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<BusinessListModel>:
        {
          int facilityIndex =
              venderNameList.indexWhere((x) => x?.name == value);
          selectedvenderId = venderNameList[facilityIndex]?.id ?? 0;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void requestCalibration() async {
    String _nextDueDate = nextDueDateController.text.trim();
    String _previousDate = previousDateController.text.trim();
    RequestCalibrationModel requestCalibrationModel = RequestCalibrationModel(
        vendorId: selectedvenderId,
        nextCalibrationDate: _nextDueDate,
        assetId: 27);
    var requestCalibrationJsonString = requestCalibrationModel.toJson();
    await calibrationListPresenter.requestCalibration(
      requestCalibration: requestCalibrationJsonString,
      isLoading: true,
    );
    // }
    // }
  }
}
