import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_presenter.dart';
import 'package:cmms/app/module_cleaning_list_plan/view/module_cleaning_list_plan_web.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/module_cleaning_list_plan_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ModuleCleaningListPlanController extends GetxController {
  ModuleCleaningListPlanController(
    this.moduleCleaningListPlanPresenter,
  );
  ModuleCleaningListPlanPresenter moduleCleaningListPlanPresenter;
  final HomeController homecontroller = Get.find();

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<ModuleCleaningListPlanModel?>? moduleCleaningListPlan =
      <ModuleCleaningListPlanModel?>[].obs;
  RxList<String> moduleCleaningListPlanTableColumns = <String>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  ModuleCleaningListPlanModel? moduleCleaningListPlanModel;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      getModuleCleaningListPlan(facilityId, true);
      super.onInit();
    });
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await moduleCleaningListPlanPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getModuleCleaningListPlan(int facilityId, bool isLoading) async {
    moduleCleaningListPlan!.value = <ModuleCleaningListPlanModel>[];
    final _moduleCleaningListPlan = await moduleCleaningListPlanPresenter
        .getModuleCleaningListPlan(isLoading: true, facility_id: facilityId);
    if (_moduleCleaningListPlan != null) {
      moduleCleaningListPlan!.value = _moduleCleaningListPlan;
      paginationController = PaginationController(
        rowCount: moduleCleaningListPlan?.length ?? 0,
        rowsPerPage: 10,
      );

      // if (moduleCleaningListPlan != null &&
      //     moduleCleaningListPlan!.isNotEmpty) {
      //   // moduleCleaningListPlanModel = moduleCleaningListPlan![0];
      //   // var newPermitListJson = moduleCleaningListPlan?.toJson();
      //   // moduleCleaningListPlanTableColumns.value = <String>[];
      //   // for (var key in newPermitListJson?.keys.toList() ?? []) {
      //   //   moduleCleaningListPlanTableColumns.add(key);
      //   // }
      // }
    }
  }
}
