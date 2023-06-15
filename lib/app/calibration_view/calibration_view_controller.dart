import 'package:cmms/app/calibration_view/calibration_view_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CalibrationViewController extends GetxController {
  ///
  CalibrationViewController(
    this.calibrationViewPresenter,
  );
  CalibrationViewPresenter calibrationViewPresenter;
  final HomeController homecontroller = Get.find();
  int? calibrationId = 0;

  var isToggleOn = false.obs;
  @override
  void onInit() async {
    calibrationId = Get.arguments;
    print('calibrationId:$calibrationId');
    if (calibrationId != 0) {
      await getCalibrationView(calibrationId: calibrationId, isloading: true);
    }

    super.onInit();
  }

  Future<void> getCalibrationView({int? calibrationId, bool? isloading}) async {
//calibrationId = 5326;
    final _calibrationDetails = await calibrationViewPresenter
        .getCalibrationView(calibrationId: calibrationId, isloading: isloading);
    if (_calibrationDetails != null) {
      //   pmtaskViewModel.value = _permitDetails;
      //   scheduleCheckPoint!.value = _permitDetails.schedule_check_points ?? [];
      //   historyLog!.value = _permitDetails.history_log ?? [];

      //   schedulePaginationController = PaginationController(
      //     rowCount: scheduleCheckPoint?.length ?? 0,
      //     rowsPerPage: 10,
      //   );
      //   if (scheduleCheckPoint != null && scheduleCheckPoint!.isNotEmpty) {
      //     scheduleCheckPointModel = scheduleCheckPoint![0];
      //     var scheduleCheckPointJson = scheduleCheckPointModel?.toJson();
      //     scheduleCheckPointTableColumns.value = <String>[];
      //     for (var key in scheduleCheckPointJson?.keys.toList() ?? []) {
      //       scheduleCheckPointTableColumns.add(key);
      //     }
      //  }
    }
  }

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }
}
