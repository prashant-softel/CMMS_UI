import 'dart:async';
import 'package:cmms/app/calendar_view/calendar_view_presenter.dart';
import 'package:cmms/app/calendar_view/view/calendar_view_web.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/domain/models/dashboard_model.dart';
import 'package:cmms/domain/models/module_model.dart';
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
  RxBool isHovered = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> selectedDocUploadId = 0.obs;
  RxList<ViewDocUpload> viewDocUploadList = <ViewDocUpload>[].obs;
  RxList<double> totalColumn = <double>[].obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  bool openFromDateToStartDatePicker = false;
  RxList<ModuleModel?> moduleList = <ModuleModel>[].obs;
  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  RxInt module_id = 0.obs;

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
  RxList<int> selectedModuleIdList = <int>[].obs;

  @override
  void onInit() async {
    facilityIdStreamSubscription =
        homecontroller.facilityId$.listen((event) async {
      facilityId = event;

      if (facilityId != 0) {
        await getdashboardList();
        await getModuleList();
      }
    });

    super.onInit();
  }

  Future<void> getdashboardList() async {
    allItems.clear(); // Clear previous data

    String lststrFacilityIds = homecontroller.selectedFacilityIdList.join(',');
    String moduleId = selectedModuleIdList.join(',');

    print({"facilityData1": lststrFacilityIds});

    final _dashboardList = await calendarViewPresenter.getdashboardList(
        facilityId: lststrFacilityIds,
        endDate: formattedTodate1,
        startDate: formattedFromdate1,
        isLoading: true,
        moduleId: moduleId);
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

  Future<void> getModuleList() async {
    moduleList.value = <ModuleModel>[];

    // Fetch the complete module list
    final _moduleList =
        await calendarViewPresenter.getModuleList(isLoading: true);

    // Check if the list is not null
    if (_moduleList != null) {
      // Filter the modules to include only the specified items
      final filteredModules = _moduleList.where((module) {
        return module?.software_id == 2 ||
            module?.software_id == 26 ||
            module?.software_id == 81; //||
        // module?.id == ;
      }).toList();

      moduleList.value = filteredModules;
    }
  }

  List<Meeting> getDataSource() {
    print("Creating data source from allItems.");
    final List<Meeting> meetings = <Meeting>[];

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
      final String? currentStatus = item?.current_status;
      final String fullEventName =
          currentStatus != null && currentStatus.isNotEmpty
              ? "$eventName - $currentStatus"
              : eventName;
      final int planId = item?.plan_id ?? 0;

      final bool isAllDay = false;
      final String woNumber = item?.wo_number ?? "N/A"; // Add wo_number
      final String woDescription =
          item?.wo_decription ?? "No description"; // Add wo_description

      final String? moduleName = dashboardList
          .firstWhere(
              (dashboard) =>
                  dashboard?.cmDashboadDetails?.item_list?.contains(item) ??
                  false,
              orElse: () => null)
          ?.module_name;

      final Color moduleColor = moduleColors[moduleName] ?? Colors.grey;

      meetings.add(Meeting(
          fullEventName,
          start_date,
          end_date ?? start_date,
          moduleColor,
          isAllDay,
          woNumber, // Include wo_number
          woDescription,
          planId // Include wo_description
          ));
    }

    return meetings;
  }

  void selectedMultiFacility(List<int> _selectedFacilityIds) {
    homecontroller.selectedFacilityIdList.clear(); // Clear the existing list
    homecontroller.selectedFacilityIdList
        .addAll(_selectedFacilityIds); // Add the new selections
    // print('Selected facility IDs: ${homecontroller.selectedFacilityIdList}');
    getdashboardList();
  }

  void selectedMultiModule(List<int> _selectedModuleIdList) {
    selectedModuleIdList.clear(); // Clear the existing list

// Clear the existing list
    // for (var _selectedId in _selectedModuleIdList) {
    //   selectedModuleIdList.add(_selectedId);
    // }
    selectedModuleIdList
        .addAll(_selectedModuleIdList); // Add the new selections
    // print('Selected facility IDs: ${homecontroller.selectedFacilityIdList}');
    getdashboardList();
  }

  void getDashBordListByDate() {
    getdashboardList();
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<ModuleModel>):
        {
          if (value != "Please Select") {
            int moduleListIndex =
                moduleList.indexWhere((x) => x?.name == value);
            module_id.value = moduleList[moduleListIndex]?.id ?? 0;
          } else {
            module_id.value = 0;
          }
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
