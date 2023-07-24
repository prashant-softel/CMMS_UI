import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_presenter.dart';

import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ModuleCleaningListExecutionController extends GetxController {
  ModuleCleaningListExecutionController(
    this.moduleCleaningListExecutionPresenter,
  );
  ModuleCleaningListExecutionPresenter moduleCleaningListExecutionPresenter;
  final HomeController homecontroller = Get.find();

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;

      super.onInit();
    });
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList =
        await moduleCleaningListExecutionPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }
}
