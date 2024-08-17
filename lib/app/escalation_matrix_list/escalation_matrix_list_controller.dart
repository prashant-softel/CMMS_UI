import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/escalation_matrix_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class EscalationMatrixListController extends GetxController {
  EscalationMatrixListController(this.escalationMatrixPresenter);
  EscalationMatrixListPresenter escalationMatrixPresenter;

  final HomeController homeController = Get.find();
  RxList<EscalationMatListModel> matrixlist = <EscalationMatListModel>[].obs;
  RxList<EscalationMatListModel> buffermatrixlist =
      <EscalationMatListModel>[].obs;
  PaginationController paginationEscalationMatrixController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxBool isLoading = true.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  RxInt facilityId = 0.obs;

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Module ID": true,
    "Module Name": true,
    "Status Name": true,
    "No Of Escalation": true,
  });

  final Map<String, double> columnwidth = {
    "Module ID": 150,
    "Module Name": 400,
    "Status Name": 400,
    "No Of Escalation": 200,
  };

  RxString ModuleIdFilterText = ''.obs;
  RxString ModuleNameFilterText = ''.obs;
  RxString StatusNameFilterText = ''.obs;
  RxString NoOfEscalationFilterText = ''.obs;
  RxString ActionFilterText = ''.obs;

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  @override
  void onInit() async {
    try {
      this.filterText = {
        "Module ID": ModuleIdFilterText,
        "Module Name": ModuleNameFilterText,
        "Status Name": StatusNameFilterText,
        "No Of Escalation": NoOfEscalationFilterText,
      };
      facilityIdStreamSubscription =
          homeController.facilityId$.listen((event) async {
        facilityId.value = event;
        await getEscalationMatrixList();
      });
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  void clearStoreData() {
    escalationMatrixPresenter.clearStatusValue();
    escalationMatrixPresenter.clearModuleValue();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      matrixlist.value = buffermatrixlist;
      return;
    }
    List<EscalationMatListModel> filteredList = buffermatrixlist
        .where((item) =>
            (item.moduleId
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.moduleName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.statusName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.statusName
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    matrixlist.value = filteredList;
  }

  Future<void> getEscalationMatrixList() async {
    matrixlist.value = <EscalationMatListModel>[];
    buffermatrixlist.value = <EscalationMatListModel>[];
    final _matrixlist = await escalationMatrixPresenter.getEscalationMatrixList(
      isLoading: isLoading.value,
    );
    if (_matrixlist.isNotEmpty) {
      buffermatrixlist.value = _matrixlist;
      matrixlist.value = _matrixlist;
    }
    isLoading.value = false;
    paginationEscalationMatrixController = PaginationController(
      rowCount: matrixlist.length,
      rowsPerPage: 10,
    );
    update(['escalator_matrix_list']);
  }

  Future<void> viewEscalationMatrix({
    required int moudle_id,
    required int status_id,
  }) async {
    clearStoreData();
    Get.toNamed(
      Routes.viewEscalatiomMatrixContentWeb,
      arguments: {
        "module_id": moudle_id,
        "status_id": status_id,
      },
    );
  }

  Future<void> editEscalationMatrix({
    required int moudle_id,
    required int status_id,
  }) async {
    clearStoreData();
    Get.toNamed(
      Routes.addEscalatiomMatrixContentWeb,
      arguments: {
        "module_id": moudle_id,
        "status_id": status_id,
      },
    );
  }

  void escalateModule({required int moduleId, required int statusId}) async {
    Map<String, dynamic>? responseCreateEscalationMatrixModel =
        await escalationMatrixPresenter.escalateModule(
      moduleId: moduleId,
      statusId: statusId,
      isLoading: true,
    );
    if (responseCreateEscalationMatrixModel == null) {}
  }
}
