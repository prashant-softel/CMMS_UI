import 'package:cmms/app/pm_task_view/pm_task_view_presenter.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class PreventiveMaintenanceTaskViewController extends GetxController {
  ///
  PreventiveMaintenanceTaskViewController(
    this.preventiveMaintenanceTaskViewPresenter,
  );
  PreventiveMaintenanceTaskViewPresenter preventiveMaintenanceTaskViewPresenter;
  int? scheduleId = 0;
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
    getPmtaskViewList();

    super.onInit();
  }

  void getPmtaskViewList() async {
    scheduleId = 5326;
    final _permitDetails = await preventiveMaintenanceTaskViewPresenter
        .getPmtaskViewList(scheduleId: scheduleId);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;
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
}
