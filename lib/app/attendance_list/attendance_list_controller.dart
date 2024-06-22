import 'dart:async';

import 'package:cmms/app/attendance_list/attendance_list_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/attendance_list_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:get/get.dart';

class AttendanceListController extends GetxController {
  AttendanceListController(this.attendanceListPresenter);
  AttendanceListPresenter attendanceListPresenter;

  RxList<AttendanceListModel> attendance_list = <AttendanceListModel>[].obs;
  RxBool isLoading = true.obs;
  List<String> financialYears = [];
  RxList<GenderModel> year = <GenderModel>[].obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<int> facilityId = 0.obs;
  final HomeController homecontroller = Get.find();
  RxString selectedYear = "2023-24".obs;

  @override
  void onInit() async {
    try {
      await generateFinancialYears(20);
      facilityIdStreamSubscription =
          homecontroller.facilityId$.listen((event) async {
        facilityId.value = event;
        await getAttendanceList(
          facilityId: facilityId.value,
          year: selectedYear.value,
          isLoading: isLoading.value,
        );
      });
    } catch (e) {
      print('error: $e');
    }
    super.onInit();
  }

  List<String> generateFinancialYears(int numberOfYears) {
    int currentYear = DateTime.now().year;
    for (int i = 0; i < numberOfYears; i++) {
      financialYears.add(
          '${currentYear - i}-${(currentYear - i + 1).toString().substring(2)}');
    }
    for (var financialYear in financialYears) {
      year.add(
        GenderModel(
          name: financialYear,
          id: int.tryParse(financialYear),
        ),
      );
    }
    return financialYears;
  }

  Future<void> getAttendanceList({
    required int facilityId,
    required String year,
    bool? isLoading,
  }) async {
    attendance_list.value = <AttendanceListModel>[];
    final _attendanceList = await attendanceListPresenter.getAttendanceList(
      facilityId: facilityId,
      year: year,
      isLoading: isLoading,
    );
    attendance_list.value = _attendanceList;
    isLoading = false;
    update(['attendance-list']);
  }

  addAttendance() {
    Get.toNamed(Routes.attendanceScreen);
  }
}
