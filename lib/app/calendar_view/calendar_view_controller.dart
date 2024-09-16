import 'dart:async';
import 'package:cmms/app/calendar_view/calendar_view_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/dashboard_model.dart';
import 'package:cmms/domain/models/doc_upload_list_model.dart';
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

  GetDocUploadListModel? selectedItem;
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
    dashboardList.value = <DashboardModel>[];
    allItems.value = <Itemlist>[];

    String lststrFacilityIds = homecontroller.selectedFacilityIdList.join(',');

    print({"facilityData1": lststrFacilityIds});

    final _dashboardList = await calendarViewPresenter.getdashboardList(
        facilityId: lststrFacilityIds,
        endDate: formattedTodate1,
        startDate: formattedFromdate1,
        isLoading: true);
  }
}
