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
  RxList<ScheduleCheckPoint?>? scheduleCheckPoint = <ScheduleCheckPoint?>[].obs;
  ScheduleCheckPoint? scheduleCheckPointModel;
  PaginationController schedulePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxList<String> scheduleCheckPointTableColumns = <String>[].obs;
  RxList<HistoryLog?>? historyLog = <HistoryLog?>[].obs;
  HistoryLog? historyLogModel;
  @override
  void onInit() async {
    scheduleId = Get.arguments;
    print('scheduleId:$scheduleId');
    if (scheduleId != 0) {
      await getPmtaskViewList(scheduleId: scheduleId, isloading: true);
    }

    super.onInit();
  }

  Future<void> getPmtaskViewList({int? scheduleId, bool? isloading}) async {
//scheduleId = 5326;
    final _permitDetails = await preventiveMaintenanceTaskViewPresenter
        .getPmtaskViewList(scheduleId: scheduleId, isloading: isloading);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;
      scheduleCheckPoint!.value = _permitDetails.schedule_check_points ?? [];
      historyLog!.value = _permitDetails.history_log ?? [];

      schedulePaginationController = PaginationController(
        rowCount: scheduleCheckPoint?.length ?? 0,
        rowsPerPage: 10,
      );
      if (scheduleCheckPoint != null && scheduleCheckPoint!.isNotEmpty) {
        scheduleCheckPointModel = scheduleCheckPoint![0];
        var scheduleCheckPointJson = scheduleCheckPointModel?.toJson();
        scheduleCheckPointTableColumns.value = <String>[];
        for (var key in scheduleCheckPointJson?.keys.toList() ?? []) {
          scheduleCheckPointTableColumns.add(key);
        }
      }
    }
  }
}
