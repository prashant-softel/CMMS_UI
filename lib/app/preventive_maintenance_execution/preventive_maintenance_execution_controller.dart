import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/pm_task_view_list_model.dart';
import '../../domain/models/update_pm_task_execution_model.dart';
import 'preventive_maintenance_execution_presenter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PreventiveMaintenanceExecutionController extends GetxController {
  ///
  PreventiveMaintenanceExecutionController(
    this.preventiveMaintenanceExecutionPresenter,
  );
  PreventiveMaintenanceExecutionPresenter
      preventiveMaintenanceExecutionPresenter;
  int scheduleId = 0;
  RxBool isTouchable = false.obs;
  var isToggleOn = false.obs;
  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  RxList<ScheduleCheckList?>? scheduleCheckList = <ScheduleCheckList?>[].obs;
  ScheduleCheckList? scheduleCheckListModel;
  PaginationController schedulePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<String> scheduleCheckListTableColumns = <String>[].obs;
  RxList<HistoryLog?>? historyLog = <HistoryLog?>[].obs;
  HistoryLog? historyLogModel;
  @override
  void onInit() async {
    scheduleId = Get.arguments;
    if (scheduleId != 0) {
      await getPmtaskViewList(scheduleId: scheduleId, isloading: false);
    }
    super.onInit();
  }

  void toggleTouch() {
    isTouchable.value = !isTouchable.value;
  }

  Future<void> getPmtaskViewList({int? scheduleId, bool? isloading}) async {
//scheduleId = 5326;
    final _permitDetails = await preventiveMaintenanceExecutionPresenter
        .getPmtaskViewList(scheduleId: scheduleId, isloading: isloading);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;

      // print({"werr", pmtaskViewModel.value?.category_name});
      scheduleCheckList!.value = _permitDetails.schedule_check_list ?? [];
      historyLog!.value = _permitDetails.history_log ?? [];

      schedulePaginationController = PaginationController(
        rowCount: scheduleCheckList?.length ?? 0,
        rowsPerPage: 10,
      );
      if (scheduleCheckList != null && scheduleCheckList!.isNotEmpty) {
        scheduleCheckListModel = scheduleCheckList![0];
        var scheduleCheckListJson = scheduleCheckListModel?.toJson();
        scheduleCheckListTableColumns.value = <String>[];
        for (var key in scheduleCheckListJson?.keys.toList() ?? []) {
          scheduleCheckListTableColumns.add(key);
        }
      }
    }
  }

  void updatePmExecution() async {
    List<AddObservations> addObservations = <AddObservations>[];
    scheduleCheckList?.forEach((e) {
      addObservations.add(AddObservations(
          execution_id: e!.execution_id ?? 0,
          observation: e.observation ?? "",
          job_create: e.is_job_created ?? 0,
          pm_files: []));
    });
    UpdatePmExecutionMdel updatePmExecutionMdel = UpdatePmExecutionMdel(
        schedule_id: scheduleId, add_observations: addObservations);
    var pmExecutionJsonString = updatePmExecutionMdel.toJson();
    print({"pmExecutionJsonString", pmExecutionJsonString});
    List<dynamic>? responsePmScheduleCreated =
        await preventiveMaintenanceExecutionPresenter.updatePmExecution(
      pmExecutionJsonString: pmExecutionJsonString,
      isLoading: true,
    );
    if (responsePmScheduleCreated == []) {
      Fluttertoast.showToast(
          msg: "PM Schedule Successfully...", fontSize: 16.0);
    }
  }
}
