import 'dart:async';
import 'package:cmms/app/calendar_view/calendar_view_presenter.dart';
import 'package:cmms/app/calendar_view/view/calendar_view_web.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/domain/models/dashboard_model.dart';
// import 'package:cmms/domain/models/doc_upload_list_model.dart';
import 'package:cmms/domain/models/view_doc_upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarViewController extends GetxController {
  CalendarViewController(this.calendarViewPresenter);

  final CalendarViewPresenter calendarViewPresenter;
  final HomeController homecontroller = Get.find();

  var docUploadDateTc = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> selectedDocUploadId = 0.obs;
  RxList<ViewDocUpload> viewDocUploadList = <ViewDocUpload>[].obs;
  RxList<double> totalColumn = <double>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;

  // GetDocUploadListModel? selectedItem;
  var subDocName = TextEditingController();

  // dashbord data
  RxList<DashboardModel?> dashboardList = <DashboardModel?>[].obs;

  RxList<Itemlist?> allItems = <Itemlist?>[].obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get end_date => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get start_date => DateFormat('yyyy-MM-dd').format(fromDate.value);

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;

      if (facilityId != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getdashboardList();
        });
      }
    });

    super.onInit();
  }

  Future<void> getdashboardList() async {
    allItems.clear(); // Clear previous data

    String lststrFacilityIds = homecontroller.selectedFacilityIdList.join(',');

    print({"facilityData1": lststrFacilityIds});

    final _dashboardList = await calendarViewPresenter.getdashboardList(
        facilityId: lststrFacilityIds,
        endDate: formattedTodate1,
        startDate: formattedFromdate1,
        isLoading: true);
    dashboardList.value = _dashboardList ?? [];

    // Process the dashboard list and populate allItems
    for (var module in dashboardList) {
      if (module?.module_name == 'Breakdown Maintenance' ||
          module?.module_name == 'Preventive Maintenance' ||
          module?.module_name == 'Module Cleaning' ||
          module?.module_name == 'Incident Report' ||
          module?.module_name == 'Stock Management') {
        var details = module?.cmDashboadDetails;
        allItems.addAll(details?.item_list ?? []);
      }
    }
  }

  List<Meeting> getDataSource() {
    print("Creating data source from allItems.");
    final List<Meeting> meetings = <Meeting>[];

    // Define a map for module name and corresponding color
    final Map<String, Color> moduleColors = {
      'Breakdown Maintenance': ColorValues.appGreenColor,
      'Preventive Maintenance': ColorValues.appDarkBlueColor,
      'Module Cleaning': Color.fromARGB(255, 133, 97, 163),
      'Incident Report': Color.fromARGB(255, 78, 126, 129),
      'Stock Management': ColorValues.facebookButtonColor
    };

    for (var item in allItems) {
      final String? startDateString = item?.start_date;
      final DateTime? start_date =
          startDateString != null ? DateTime.tryParse(startDateString) : null;

      final String? endDateString = item?.end_date;
      final DateTime? end_date =
          endDateString != null ? DateTime.tryParse(endDateString) : start_date;

      if (start_date == null) {
        continue;
      }

      final String eventName = item?.wo_decription ?? "";
      final bool isAllDay = false;

      // Use the module name from the parent dashboard item
      final String? moduleName = dashboardList
          .firstWhere(
              (dashboard) =>
                  dashboard?.cmDashboadDetails?.item_list?.contains(item) ??
                  false, // Ensure the closure returns bool
              orElse: () => null)
          ?.module_name;

      final Color moduleColor = moduleColors[moduleName] ??
          Colors.grey; // Default to grey if module name is not found

      meetings.add(Meeting(
        eventName,
        start_date,
        end_date ?? start_date,
        moduleColor,
        isAllDay,
      ));
    }

    return meetings;
  }
}
