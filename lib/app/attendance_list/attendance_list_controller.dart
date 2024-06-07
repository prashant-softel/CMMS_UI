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

  RxList<AttendanceListModel> attendance_list = <AttendanceListModel>[
    AttendanceListModel(
      month_id: 4,
      month_name: "April",
      year: 2024,
      month_data: [
        MonthData(
          date: 1,
          hfe_employees: 1,
          less_than_35: 1,
          between_30_to_50: 1,
          greater_than_50: 1,
        ),
        MonthData(
          date: 2,
          hfe_employees: 2,
          less_than_35: 2,
          between_30_to_50: 2,
          greater_than_50: 2,
        ),
        MonthData(
          date: 3,
          hfe_employees: 3,
          less_than_35: 3,
          between_30_to_50: 3,
          greater_than_50: 3,
        ),
        MonthData(
          date: 4,
          hfe_employees: 4,
          less_than_35: 4,
          between_30_to_50: 4,
          greater_than_50: 4,
        ),
        MonthData(
          date: 5,
          hfe_employees: 5,
          less_than_35: 5,
          between_30_to_50: 5,
          greater_than_50: 5,
        ),
        MonthData(
          date: 6,
          hfe_employees: 6,
          less_than_35: 6,
          between_30_to_50: 6,
          greater_than_50: 6,
        ),
        MonthData(
          date: 7,
          hfe_employees: 7,
          less_than_35: 7,
          between_30_to_50: 7,
          greater_than_50: 7,
        ),
        MonthData(
          date: 8,
          hfe_employees: 8,
          less_than_35: 8,
          between_30_to_50: 8,
          greater_than_50: 8,
        ),
      ],
    ),
    AttendanceListModel(
      month_id: 5,
      month_name: "May",
      year: 2024,
      month_data: [
        MonthData(
          date: 1,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 2,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 3,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 4,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 5,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 6,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 7,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 8,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
      ],
    ),
    AttendanceListModel(
      month_id: 6,
      month_name: "June",
      year: 2024,
      month_data: [
        MonthData(
          date: 1,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 2,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 3,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 4,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 5,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 6,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 7,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
        MonthData(
          date: 8,
          hfe_employees: 3,
          less_than_35: 10,
          between_30_to_50: 20,
          greater_than_50: 5,
        ),
      ],
    ),
  ].obs;
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
        // await getAttendanceList(
        //   facilityId: facilityId.value,
        //   year: selectedYear.value,
        //   isLoading: isLoading.value,
        // );
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
