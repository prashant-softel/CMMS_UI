import 'dart:async';
import 'package:cmms/app/calendar_view/calendar_view_presenter.dart';
import 'package:cmms/app/calendar_view/view/calendar_view_web.dart';
import 'package:cmms/app/home/home_controller.dart';
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
          module?.module_name == 'Module Cleaning') {
        var details = module?.cmDashboadDetails;
        allItems.addAll(details?.item_list ?? []);
      }
    }
  }

  List<Meeting> getDataSource() {
    print("Creating data source from allItems.");
    final List<Meeting> meetings = <Meeting>[];

    // Iterate over allItems to create meeting entries
    for (var item in allItems) {
      final DateTime startTime =
          DateTime.parse(item?.start_date ?? "2024-09-11T09:13:00");
      final DateTime endTime = item?.end_date == null
          ? DateTime.parse(item?.end_date ?? '2024-09-11T09:13:00')
          : DateTime.parse(item?.start_date ?? "2024-09-11T09:13:00");
      final String eventName = item?.wo_number ?? "";
      final bool isAllDay = false;

      meetings.add(Meeting(
        eventName,
        startTime,
        endTime,
        Colors
            .blue, // You can dynamically change the color based on item properties if needed
        isAllDay,
      ));
    }

    return meetings;
  }
}
