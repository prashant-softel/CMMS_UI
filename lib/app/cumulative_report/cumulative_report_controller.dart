// ignore_for_file: invalid_use_of_protected_member

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/cumulative_report/cumulative_report_presenter.dart';
import 'package:cmms/app/utils/save_file_web.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/cumulative_report_model.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/job_card_details_model.dart';
import 'package:cmms/domain/models/job_details_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/models/module_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../domain/models/history_model.dart';
import '../../domain/models/pm_task_view_list_model.dart';
import '../../domain/models/veg_execution_details_model.dart';

class CumulativeReportController extends GetxController {
  ///
  CumulativeReportController(
    this.cumulativeReportPresenter,
  );
  CumulativeReportPresenter cumulativeReportPresenter;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<int> selectedFacilityIdList = <int>[].obs;
  RxList<int> selectedCategoryIdList = <int>[].obs;

  bool openFromDateToStartDatePicker = false;
  RxList<JobCardDetailsModel?> jobCardList = <JobCardDetailsModel?>[].obs;
  Rx<JobCardDetailsModel?> jobCardDetailsModel = JobCardDetailsModel().obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  RxList<ModuleModel?> moduleList = <ModuleModel>[].obs;

  Rx<bool> isModuleListSelected = true.obs;
  Rx<String> selectedModuleList = ''.obs;
  RxInt module_id = 0.obs;
  RxList<Cumulativereport?> cumulativereport = <Cumulativereport>[].obs;
  Rx<int> type = 0.obs;
  RxList<PmTaskListModel?> pmTaskList = <PmTaskListModel?>[].obs;
  RxList<PmTaskListModel?> pmfilteredData = <PmTaskListModel>[].obs;

  RxList<JobModel?> jobList = <JobModel?>[].obs;
  RxList<JobModel?> filteredData = <JobModel?>[].obs;
  RxList<VegTaskListModel?> vegTaskList = <VegTaskListModel?>[].obs;
  RxList<MCTaskListModel?> mcTaskList = <MCTaskListModel?>[].obs;
  Rx<PmtaskViewModel?> pmtaskViewModel = PmtaskViewModel().obs;
  RxList<ScheduleCheckPoint?>? scheduleCheckPoint = <ScheduleCheckPoint?>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  List<JobCardDetailsModel> allJobCardDetails = [];
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<EndMCExecutionDetailsModel?> mcExecutionDetailsModel =
      EndMCExecutionDetailsModel().obs;
  // RxList<VegTaskEquipmentList?> vegTaskEquipment = <VegTaskEquipmentList>[].obs;
  Rx<VegExecutionDetailsModel?> vegExecutionDetailsModel =
      VegExecutionDetailsModel().obs;
  Rx<JobDetailsModel?> jobDetailsModel = JobDetailsModel().obs;
  RxList<JobAssociatedModel?>? jobAssociatedModelsList =
      <JobAssociatedModel?>[].obs;
  RxList<MRSListByJobIdModel?>? listMrsByJobId = <MRSListByJobIdModel?>[].obs;
  RxList<JobDetailsModel?>? jobDetailsList = <JobDetailsModel?>[].obs;
  RxList<AssociatedPermit>? associatedPermitList = <AssociatedPermit>[].obs;

  @override
  void onInit() async {
    // await setReportType();

    await getFacilityList();
    await getModuleList();
    await getInventoryCategoryList();

    super.onInit();
  }

  var checkpointType = 'Basic'.obs;

  void updatecheCkpointType(String value) {
    checkpointType.value = value;
  }

  Future<void> setReportType() async {
    final String? _type = Get.parameters['type'];
    type.value = int.tryParse(_type ?? "") ?? 0;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await cumulativeReportPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
    }
  }

  void facilitySelected(_selectedFacilityIds) {
    selectedFacilityIdList.value = <int>[];
    for (var _selectedId in _selectedFacilityIds) {
      selectedFacilityIdList.add(_selectedId);
    }
  }

  void categorySelected(_selectedCategoryIds) {
    selectedCategoryIdList.value = <int>[];
    for (var _selectedId in _selectedCategoryIds) {
      selectedCategoryIdList.add(_selectedId);
    }
  }

  Future<void> getModuleList() async {
    moduleList.value = <ModuleModel>[];

    // Fetch the complete module list
    final _moduleList =
        await cumulativeReportPresenter.getModuleList(isLoading: true);

    // Check if the list is not null
    if (_moduleList != null) {
      // Filter the modules to include only the specified items
      final filteredModules = _moduleList.where((module) {
        return module?.id == 2 ||
            module?.id == 39 ||
            module?.id == 43 ||
            module?.id == 44;
      }).toList();

      moduleList.value = filteredModules;
    }
  }

  Future<void> getInventoryCategoryList() async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await cumulativeReportPresenter.getInventoryCategoryList(
      isLoading: false,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
      equipmentCategoryList.sort((a, b) => a!.name.compareTo(b!.name));
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case const (RxList<ModuleModel>):
        {
          if (value != "Please Select") {
            cumulativereport.value = <Cumulativereport>[];

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

  Future<void> getCumulativeReportList() async {
    cumulativereport.value = <Cumulativereport>[];

    String lststrFacilityIds = selectedFacilityIdList.join(',');

    final list = await cumulativeReportPresenter.getCumulativeReportList(
      selectedFacilityIdList: lststrFacilityIds,
      module_id: module_id.value,
      endDate: formattedTodate1,
      startDate: formattedFromdate1,
    );

    if (list != null) {
      for (var _cumulativereport in list) {
        cumulativereport.add(_cumulativereport);
      }
    }
  }

  Future<void> getJobList(
      // {bool isExportOnly = false}
      ) async {
    // if (!isExportOnly) {
    //   jobList.value = <JobModel>[];
    //   filteredData.value = <JobModel>[];
    // }

    // if (facilityId > 0) {
    String lststrFacilityIds = selectedFacilityIdList.join(',');
    String categoryid = selectedCategoryIdList.join(',');

    pmTaskList.value = <PmTaskListModel>[];
    jobList.value = <JobModel>[];

    final _jobList = await cumulativeReportPresenter.getJobList(
      facilityId: lststrFacilityIds,
      self_view: varUserAccessModel.value.access_list!
                  .where((e) =>
                      e.feature_id == UserAccessConstants.kJobFeatureId &&
                      e.selfView == UserAccessConstants.kHaveSelfViewAccess)
                  .length >
              0
          ? true
          : false,
      isLoading: true,
      isExport: false,
      categoryid: categoryid,
      startDate: formattedTodate1,
      endDate: formattedFromdate1,
    );

    if (_jobList != null && _jobList.isNotEmpty) {
      filteredData.value = _jobList;

      jobList.value = _jobList;
      update(["jobList"]);
      // paginationController = PaginationController(
      //   rowCount: jobList.length,
      //   rowsPerPage: 10,
      // );

      // jobModel = jobList[0];
      // var jobJson = jobModel?.toJson();
      // jobListTableColumns.value = <String>[];
      // for (var key in jobJson?.keys.toList() ?? []) {
      //   jobListTableColumns.add(key);
      // }
    }
    // }
    // update(['PreventiveMaintenanceTask']);
  }

  String formatDate(String? inputDateTime) {
    ///
    String formattedDateTimeString = '';

    if (inputDateTime != null &&
        inputDateTime.isNotEmpty &&
        inputDateTime != "null")
    // Parse the input DateTime string
    {
      DateFormat inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss.SSS");
      DateTime parsedDateTime = inputFormat.parse(inputDateTime);

      // Format the parsed DateTime to the desired format
      DateFormat outputFormat = DateFormat("yyyy-MM-dd hh:mm");
      formattedDateTimeString = outputFormat.format(parsedDateTime);
    }

    return formattedDateTimeString;
  } // sort

  Future<void> getPmTaskList() async {
    pmTaskList.value = <PmTaskListModel>[];
    jobList.value = <JobModel>[];

    // pmTaskList?.clear();
    String lststrFacilityIds = selectedFacilityIdList.join(',');
    String categoryIds = selectedCategoryIdList.join(',');

    final _pmTaskList = await cumulativeReportPresenter.getPmTaskList(
        facilityId: lststrFacilityIds,
        isLoading: true, //isLoading.value,
        startDate: formattedTodate1,
        endDate: formattedFromdate1,
        isExport: false,
        categoryIds: categoryIds);
    if (_pmTaskList != null) {
      pmTaskList.value = _pmTaskList;
      pmfilteredData.value = pmTaskList.value;
      // isLoading.value = false;
    }
  }

  Future<void> getVegTaskList() async {
    // if (!isExportOnly) {
    //   vegTaskList.value = <VegTaskListModel>[];
    // }
    String lststrFacilityIds = selectedFacilityIdList.join(',');

    final list = await cumulativeReportPresenter.getVegTaskList(
        isLoading: true,
        startDate: formattedTodate1,
        endDate: formattedFromdate1,
        facility_id: lststrFacilityIds,
        isExport: false);

    // if (!isExportOnly) {
    // for (var veg_task_list in list) {
    //   vegTaskList.add(veg_task_list);
    // }

    vegTaskList.value = list;
    // filteredData.value = vegTaskList.value;
    // isLoading.value = false;

    // paginationController = PaginationController(
    //   rowCount: vegTaskList.length,
    //   rowsPerPage: 10,
    // );

    // if (filteredData.isNotEmpty) {
    //   vegTaskListModel = filteredData[0];
    //   var vegTaskListJson = vegTaskListModel?.toJson();
    //   vegTaskListTableColumns.value = <String>[];
    //   for (var key in vegTaskListJson?.keys.toList() ?? []) {
    //     vegTaskListTableColumns.add(key);
    //   }
    // }
    //  }

    //  isLoading.value = false;
    update(['veg_task_list']);
  }

  Future<void> getMCTaskList() async {
    // if (!isExportOnly) {
    //   mcTaskList.value = <MCTaskListModel>[];
    // }
    String lststrFacilityIds = selectedFacilityIdList.join(',');

    final list = await cumulativeReportPresenter.getMCTaskList(
        isLoading: true,
        isExport: false,
        start_date: formattedTodate1,
        end_date: formattedFromdate1,
        facility_id: lststrFacilityIds);

    // isLoading.value = false;

    // if (!isExportOnly) {
    // for (var mc_task_list in list) {
    //   mcTaskList.add(mc_task_list);
    // }

    mcTaskList.value = list;
    // filteredData.value = mcTaskList.value;

    //   paginationController = PaginationController(
    //     rowCount: mcTaskList.length,
    //     rowsPerPage: 10,
    //   );

    //   if (filteredData.isNotEmpty) {
    //     mcTaskModelList = filteredData[0];
    //     var mcTaskListJson = mcTaskModelList?.toJson();
    //     mcTaskListTableColumns.value = <String>[];
    //     for (var key in mcTaskListJson?.keys.toList() ?? []) {
    //       mcTaskListTableColumns.add(key);
    //     }
    //   }
    // }

    update(['mc_task_list']);
  }

  ///
  Future<void> getPmtaskViewList(
      {required int scheduleId,
      required bool isloading,
      required int facilityId}) async {
//scheduleId = 5326;
    final _permitDetails = await cumulativeReportPresenter.getPmtaskViewList(
        scheduleId: scheduleId, isloading: isloading, facilityId: facilityId);
    if (_permitDetails != null) {
      pmtaskViewModel.value = _permitDetails;

      scheduleCheckPoint!.value = _permitDetails.schedules ?? [];
      getHistory(27, scheduleId, facilityId);
    }
  }

  Future<void> getHistory(
    int moduleType,
    int taskId,
    int facilityId,
  ) async {
    /// TODO: CHANGE THESE VALUES
    // int moduleType = 27;
    //
    historyList?.value = await cumulativeReportPresenter.getHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          taskId,
          facilityId,
          true,
        ) ??
        [];
    if (historyList != null) {
      moduleType == 82
          ? generateInvoiceMc()
          : moduleType == 27
              ? generateInvoicePm()
              : generateInvoice();
    }
    update(["historyList"]);
  }

  Future<void> generateInvoicePm() async {
    final PdfDocument document = PdfDocument();

    final PdfPage page = document.pages.add();

    final Size pageSize = page.getClientSize();
    var url = "assets/assets/files/HFELogo.png";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;

    PdfBitmap image = PdfBitmap(data);

    final PdfLayoutResult result =
        drawHeaderPm(page, pageSize, document, image);

    final List<int> bytes = await document.save();

    document.dispose();

    await saveAndLaunchFile(bytes, 'PM Task Report.pdf');
  }

  PdfLayoutResult drawHeaderPm(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    final PdfPen borderPen = PdfPen(PdfColor(142, 180, 219), width: 1.0);
    final PdfBrush backgroundBrush = PdfSolidBrush(PdfColor(217, 226, 243));
    final PdfFont headerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);

    double margin = 10; // Margin from all sides
    double currentY =
        100; // Start position for the first section below the image
    double sectionHeight = 20; // Height for each section header
    double pageWidth = pageSize.width - 2 * margin;

    // Draw images
    page.graphics.drawImage(image, Rect.fromLTWH(margin, 10, 100, 80));

    final String centerText = 'PM Task Report';
    final PdfFont centerTextFont =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    final Size centerTextSize = centerTextFont.measureString(centerText);

    // Calculate the X position to center the text
    double centerX = (pageSize.width - centerTextSize.width) / 2;

    // Draw the center text after the image
    page.graphics.drawString(
      centerText,
      centerTextFont,
      bounds: Rect.fromLTWH(
          centerX, 60, centerTextSize.width, centerTextSize.height),
    );

    // Site name section
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString(
        'Site name : ${pmtaskViewModel.value?.site_name ?? ''}', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // PM Information
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('PM Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw PM Information Details (Left Side)
    double labelWidth = 80;
    double valueWidth = 120;
    double labelX = margin + 5;
    double valueX = labelX + labelWidth + 5;

    List<String> pmInfoLabelsLeft = [
      'PM Plan ID',
      'PM Plan/task title',
      'Due date',
      'Start date',
      'PMT Status'
    ];

    List<String> pmInfoValuesLeft = [
      'PMT${pmtaskViewModel.value?.id ?? ''}',
      '${pmtaskViewModel.value?.plan_title ?? ''}',
      '${pmtaskViewModel.value?.due_date ?? ''}',
      '${pmtaskViewModel.value?.start_time == "0001-01-01T00:00:00" ? '' : pmtaskViewModel.value?.start_time ?? ''}',
      '${pmtaskViewModel.value?.status_short ?? ''}',
    ];

    double rowHeight = 15;

    for (int i = 0; i < pmInfoLabelsLeft.length; i++) {
      page.graphics.drawString(pmInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(pmInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw PM Information Details (Right Side)
    double labelWidthRight = 80;
    double valueWidthRight = 120;
    double labelXRight = pageWidth / 2 + margin; // Position on the right side
    double valueXRight = labelXRight + labelWidthRight + 5;

    List<String> pmInfoLabelsRight = [
      'PM Task ID',
      'Frequency',
      'Assigned to',
      'Done date'
    ];
    List<String> pmInfoValuesRight = [
      '${pmtaskViewModel.value?.id ?? ''}',
      '${pmtaskViewModel.value?.frequency_name ?? ''}',
      '${pmtaskViewModel.value?.assigned_to_name ?? ''}',
      '${pmtaskViewModel.value?.done_date ?? ''}',
    ];

    currentY -= pmInfoLabelsLeft.length *
        rowHeight; // Reset currentY to align with left side

    for (int i = 0; i < pmInfoLabelsRight.length; i++) {
      page.graphics.drawString(pmInfoLabelsRight[i], contentFont,
          bounds: Rect.fromLTWH(
              labelXRight, currentY + 5, labelWidthRight, rowHeight));
      page.graphics.drawString(pmInfoValuesRight[i], contentFont,
          bounds: Rect.fromLTWH(
              valueXRight, currentY + 5, valueWidthRight, rowHeight));
      currentY += rowHeight;
    }

    // Draw Equipment details
    currentY += 20; // Adding some space before the next section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Equipment details', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw Equipment Details Table
    double columnWidth = pageWidth / 3;
    List<String> equipmentHeaders = [
      'S. No',
      'Equipment category',
      'Equipment name'
    ];

    for (int i = 0; i < equipmentHeaders.length; i++) {
      page.graphics.drawString(equipmentHeaders[i], contentFont,
          bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
              columnWidth, rowHeight));
    }

    currentY += rowHeight;

    // Draw each equipment name from the schedules
    for (int i = 0; i < (pmtaskViewModel.value?.schedules?.length ?? 0); i++) {
      var schedule = pmtaskViewModel.value!.schedules![i];

      page.graphics.drawString('${i + 1}', contentFont,
          bounds: Rect.fromLTWH(
              margin, currentY + 5, columnWidth, rowHeight)); // S. No
      page.graphics.drawString(
          '${pmtaskViewModel.value?.category_name ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + columnWidth, currentY + 5, columnWidth,
              rowHeight)); // Equipment category
      page.graphics.drawString('${schedule.name ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
              columnWidth, rowHeight)); // Equipment name

      currentY += rowHeight;
    }

    // Permit carried by section
    currentY += 10; // Adding some space before the next section

// Draw the permit section with header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Permit carried by', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

// Column Headers
    columnWidth = pageWidth / 4; // Adjust column width as needed
    List<String> permitHeaders = [
      'S. No',
      'Employee ID',
      'Employee name',
      'Company'
    ];

    for (int i = 0; i < permitHeaders.length; i++) {
      page.graphics.drawString(permitHeaders[i], contentFont,
          bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
              columnWidth, rowHeight));
    }

    currentY += sectionHeight;

    if (pmtaskViewModel.value!.permit_id != 0) {
      // Draw Permit Data
      page.graphics.drawString('1', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString(
          '${pmtaskViewModel.value!.employee_ID}', contentFont,
          bounds: Rect.fromLTWH(
              margin + columnWidth, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString(
          '${pmtaskViewModel.value!.employee_name}', contentFont,
          bounds: Rect.fromLTWH(
              margin + 2 * columnWidth, currentY + 5, columnWidth, rowHeight));
      page.graphics.drawString('${pmtaskViewModel.value!.company}', contentFont,
          bounds: Rect.fromLTWH(
              margin + 3 * columnWidth, currentY + 5, columnWidth, rowHeight));

      currentY += rowHeight;
    } else {
      // Draw the "No permit carried out" message below the headers
      page.graphics.drawString('No Permit Carried Out', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

// Continue with the next section or other content

    currentY += 10; // Adding some space before the next section

// Draw the PTW Information section header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('PTW Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

// Define static widths for the S. No, PTW ID, and Isolation taken columns
    double serialNoWidth = 40; // Width for S. No
    double ptwIdWidth = 50; // Width for PTW ID
    double isolationTakenWidth = 80; // Width for Isolation taken
    double remainingWidth = pageWidth -
        (ptwIdWidth +
            serialNoWidth +
            isolationTakenWidth); // Calculate remaining width

// Headers for PTW Information section
    List<String> ptwHeaders = [
      'S. No',
      'PTW ID',
      'Isolation taken',
      'Permit type',
      'Isolated equipment\'s'
    ];

// Draw the headers with static widths
    page.graphics.drawString(ptwHeaders[0], contentFont,
        bounds: Rect.fromLTWH(margin, currentY + 5, serialNoWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[1], contentFont,
        bounds: Rect.fromLTWH(
            margin + serialNoWidth, currentY + 5, ptwIdWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidth + ptwIdWidth, currentY + 5,
            isolationTakenWidth, rowHeight));
    page.graphics.drawString(ptwHeaders[3], contentFont,
        bounds: Rect.fromLTWH(
            margin + serialNoWidth + ptwIdWidth + isolationTakenWidth,
            currentY + 5,
            remainingWidth / 2,
            rowHeight));
    page.graphics.drawString(ptwHeaders[4], contentFont,
        bounds: Rect.fromLTWH(
            margin +
                serialNoWidth +
                ptwIdWidth +
                isolationTakenWidth +
                remainingWidth / 2,
            currentY + 5,
            remainingWidth / 2,
            rowHeight));

    currentY += rowHeight;

    if (pmtaskViewModel.value!.permit_id != 0) {
      // Draw the PTW data
      page.graphics.drawString('1', contentFont,
          bounds: Rect.fromLTWH(
              margin, currentY + 5, serialNoWidth, rowHeight)); // S. No
      page.graphics.drawString(
          '${pmtaskViewModel.value?.permit_id ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + serialNoWidth, currentY + 5,
              ptwIdWidth, rowHeight)); // PTW ID
      page.graphics.drawString(
          '${pmtaskViewModel.value?.isolation_taken ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + serialNoWidth + ptwIdWidth,
              currentY + 5, isolationTakenWidth, rowHeight)); // Isolation taken
      page.graphics.drawString(
          '${pmtaskViewModel.value?.permit_type ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin + serialNoWidth + ptwIdWidth + isolationTakenWidth,
              currentY + 5,
              remainingWidth / 2,
              rowHeight)); // Permit type
      page.graphics.drawString(
          '${pmtaskViewModel.value?.isolated_equipment ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  serialNoWidth +
                  ptwIdWidth +
                  isolationTakenWidth +
                  remainingWidth / 2,
              currentY + 5,
              remainingWidth / 2,
              rowHeight)); // Isolated equipment's

      currentY += rowHeight;
    } else {
      // Draw the "No PTW information available" message below the headers
      page.graphics.drawString('No PTW information available', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

// Continue with the next section or other content

    // Adding some space before the next section
    currentY += 25;

// TBT section header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('TBT conducted by', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

// Define static widths for the TBT table columns
    double tbtConductedByWidth = pageWidth / 4; // Width for 'TBT conducted by'
    double tbtDoneTimeWidth = pageWidth / 4; // Width for 'TBT done time'
    double startTimeWidth = pageWidth / 4; // Width for 'Start time'
    double statusWidth = pageWidth / 4; // Width for 'Status'

// Headers for TBT section
    List<String> tbtHeaders = [
      'TBT conducted by',
      'TBT done time',
      'Start time',
      'Status'
    ];

// Draw the headers with static widths
    page.graphics.drawString(tbtHeaders[0], contentFont,
        bounds: Rect.fromLTWH(
            margin, currentY + 5, tbtConductedByWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[1], contentFont,
        bounds: Rect.fromLTWH(margin + tbtConductedByWidth, currentY + 5,
            tbtDoneTimeWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + tbtConductedByWidth + tbtDoneTimeWidth,
            currentY + 5, startTimeWidth, rowHeight));
    page.graphics.drawString(tbtHeaders[3], contentFont,
        bounds: Rect.fromLTWH(
            margin + tbtConductedByWidth + tbtDoneTimeWidth + startTimeWidth,
            currentY + 5,
            statusWidth,
            rowHeight));

    currentY += rowHeight;

    if (pmtaskViewModel.value!.ptw_tbt_done == 1) {
      // Draw the TBT data
      page.graphics.drawString(
          '${pmtaskViewModel.value?.tbT_conducted_by_name ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, tbtConductedByWidth,
              rowHeight)); // TBT conducted by
      page.graphics.drawString(
          '${pmtaskViewModel.value?.tbT_done_time == "0001-01-01T00:00:00" ? '' : pmtaskViewModel.value?.tbT_done_time ?? ''}',
          contentFont,
          bounds: Rect.fromLTWH(margin + tbtConductedByWidth, currentY + 5,
              tbtDoneTimeWidth, rowHeight)); // TBT done time
      page.graphics.drawString(
          '${pmtaskViewModel.value?.start_time == "0001-01-01T00:00:00" ? '' : pmtaskViewModel.value?.start_time ?? ''}',
          contentFont,
          bounds: Rect.fromLTWH(margin + tbtConductedByWidth + tbtDoneTimeWidth,
              currentY + 5, startTimeWidth, rowHeight)); // Start time
      page.graphics.drawString(
          '${pmtaskViewModel.value?.status_short_ptw ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin + tbtConductedByWidth + tbtDoneTimeWidth + startTimeWidth,
              currentY + 5,
              statusWidth,
              rowHeight)); // Status

      currentY += rowHeight;
    } else {
      // Draw the "No TBT information available" message below the headers
      page.graphics.drawString('No TBT information available', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));

      currentY += rowHeight;
    }

// Continue with the next section or other content

    // Work description section
    currentY += 25;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Work description', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Add static description after Work description
    page.graphics.drawString(
        '${pmtaskViewModel.value?.workdescription ?? ''}', contentFont,
        bounds: Rect.fromLTWH(
            margin + 5, currentY + 5, pageWidth - 10, rowHeight * 2),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));
    currentY += rowHeight * 2;

    // Material consumption section
    currentY += 10;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Material consumption', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Define static widths
    double eqpIdWidth = 50;
    double idWidth = 40;
    double typeWidth = 80;
    double issuedQtyWidth = 60;
    double usedQtyWidth = 60;

    // Calculate remaining width for the name column
    double nameColumnWidth = pageWidth -
        (eqpIdWidth + idWidth + typeWidth + issuedQtyWidth + usedQtyWidth);

    // Draw the headers
    page.graphics.drawString('Eqp ID', contentFont,
        bounds: Rect.fromLTWH(margin, currentY + 5, eqpIdWidth, rowHeight));
    page.graphics.drawString('ID', contentFont,
        bounds: Rect.fromLTWH(
            margin + eqpIdWidth, currentY + 5, idWidth, rowHeight));
    page.graphics.drawString('name', contentFont,
        bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth, currentY + 5,
            nameColumnWidth, rowHeight));
    page.graphics.drawString('type', contentFont,
        bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth + nameColumnWidth,
            currentY + 5, typeWidth, rowHeight));
    page.graphics.drawString('Issued Qty', contentFont,
        bounds: Rect.fromLTWH(
            margin + eqpIdWidth + idWidth + nameColumnWidth + typeWidth,
            currentY + 5,
            issuedQtyWidth,
            rowHeight));
    page.graphics.drawString('Used Qty', contentFont,
        bounds: Rect.fromLTWH(
            margin +
                eqpIdWidth +
                idWidth +
                nameColumnWidth +
                typeWidth +
                issuedQtyWidth,
            currentY + 5,
            usedQtyWidth,
            rowHeight));

    currentY += rowHeight;

    // Draw the material consumption data
    for (int i = 0;
        i < (pmtaskViewModel.value?.material_consumption?.length ?? 0);
        i++) {
      var materialConsumption = pmtaskViewModel.value!.material_consumption![i];

      page.graphics.drawString(
          '${materialConsumption.equipment_ID ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin, currentY + 5, eqpIdWidth, rowHeight)); // Equipment ID

      page.graphics.drawString(
          '${materialConsumption.material_ID ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth, currentY + 5, idWidth,
              rowHeight)); // Material ID

      page.graphics.drawString(
          '${materialConsumption.material_name ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth, currentY + 5,
              nameColumnWidth, rowHeight)); // Material name

      page.graphics.drawString(
          '${materialConsumption.material_type ?? ''}', contentFont,
          bounds: Rect.fromLTWH(margin + eqpIdWidth + idWidth + nameColumnWidth,
              currentY + 5, typeWidth, rowHeight)); // Material type

      page.graphics.drawString(
          '${materialConsumption.issued_qty ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin + eqpIdWidth + idWidth + nameColumnWidth + typeWidth,
              currentY + 5,
              issuedQtyWidth,
              rowHeight)); // Issued quantity

      page.graphics.drawString(
          '${materialConsumption.used_qty ?? ''}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  eqpIdWidth +
                  idWidth +
                  nameColumnWidth +
                  typeWidth +
                  issuedQtyWidth,
              currentY + 5,
              usedQtyWidth,
              rowHeight)); // Used quantity

      currentY += rowHeight;
    }

    // Tools carried section
    currentY += 25; // Adding some space before the next section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Tools carried', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Define column widths for Tools carried section
    double serialNoWidthTools = 40;
    double toolNameWidth = pageWidth / 2;
    double toolCountWidth = pageWidth - serialNoWidthTools - toolNameWidth;

    // Draw the column headers for Tools carried section
    List<String> toolsHeaders = ['S. No', 'Tool name', 'No. of tools'];

    page.graphics.drawString(toolsHeaders[0], contentFont,
        bounds:
            Rect.fromLTWH(margin, currentY + 5, serialNoWidthTools, rowHeight));
    page.graphics.drawString(toolsHeaders[1], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidthTools, currentY + 5,
            toolNameWidth, rowHeight));
    page.graphics.drawString(toolsHeaders[2], contentFont,
        bounds: Rect.fromLTWH(margin + serialNoWidthTools + toolNameWidth,
            currentY + 5, toolCountWidth, rowHeight));

    currentY += rowHeight;

    // Loop through each schedule and its linked jobs to draw the rows for Tools carried section
    int toolIndex = 1; // Initialize tool serial number

    for (var schedule in pmtaskViewModel.value?.schedules ?? []) {
      if (schedule.schedule_link_job != null &&
          schedule.schedule_link_job!.isNotEmpty) {
        for (var job in schedule.schedule_link_job!) {
          if (job.tool_name != null &&
              job.no_of_tools != null &&
              job.no_of_tools! > 0) {
            page.graphics.drawString('$toolIndex', contentFont,
                bounds: Rect.fromLTWH(margin, currentY + 5, serialNoWidthTools,
                    rowHeight)); // S. No

            page.graphics.drawString(job.tool_name ?? '', contentFont,
                bounds: Rect.fromLTWH(margin + serialNoWidthTools, currentY + 5,
                    toolNameWidth, rowHeight)); // Tool name

            page.graphics.drawString('${job.no_of_tools}', contentFont,
                bounds: Rect.fromLTWH(
                    margin + serialNoWidthTools + toolNameWidth,
                    currentY + 5,
                    toolCountWidth,
                    rowHeight)); // No. of tools

            currentY += rowHeight;
            toolIndex++;
          }
        }
      }
    }

    // If no tools are found, you can add a message indicating that
    if (toolIndex == 1) {
      page.graphics.drawString('No tools carried', contentFont,
          bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));
      currentY += rowHeight;
    }

    // Remarks field
    currentY += 25;
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Remarks', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    page.graphics.drawString(
        '${pmtaskViewModel.value?.new_remark ?? ''}', contentFont,
        bounds: Rect.fromLTWH(
            margin + 5, currentY + 5, pageWidth - 10, rowHeight * 2),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));
    currentY += rowHeight * 2;

    // PM History section
    double pageHeight = pageSize.height;

    for (var history in historyList!.value) {
      // Check if we need to add a new page
      if (currentY + rowHeight > pageHeight - margin) {
        // Add a new page and reset the currentY
        page = document.pages.add();
        currentY = margin; // Reset Y position for the new page

        // Re-draw the "PM History" header on the new page
        page.graphics.drawRectangle(
            pen: borderPen,
            brush: backgroundBrush,
            bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
        page.graphics.drawString('PM History', headerFont,
            bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
        currentY += sectionHeight;

        // Draw column headers for "PM History"
        List<String> historyHeaders = [
          'Time Stamp',
          'Posted By',
          'Comments',
          'Status'
        ];

        for (int i = 0; i < historyHeaders.length; i++) {
          page.graphics.drawString(historyHeaders[i], contentFont,
              bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
                  columnWidth, rowHeight));
        }

        currentY += rowHeight; // Move down after drawing headers
      }

      // Render your history items as before
      if (history != null) {
        String timeStamp = history.createdAt?.result != null
            ? history.createdAt!.result
                .toString()
                .substring(0, 16)
                .replaceFirst('T', ' ')
            : 'N/A';
        String postedBy = history.createdByName ?? 'Unknown';
        String comments = history.comment ?? 'No comments';
        String status = history.status_name ?? 'Unknown status';

        page.graphics.drawString(timeStamp, contentFont,
            bounds:
                Rect.fromLTWH(margin, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(postedBy, contentFont,
            bounds: Rect.fromLTWH(
                margin + columnWidth, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(comments, contentFont,
            bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
                columnWidth, rowHeight));
        page.graphics.drawString(status, contentFont,
            bounds: Rect.fromLTWH(margin + 3 * columnWidth, currentY + 5,
                columnWidth, rowHeight));

        currentY += rowHeight;
      }
    }

    final String signatureText = 'Signature';
    final Size signatureSize = contentFont.measureString(signatureText);
    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageWidth - (signatureSize.width + margin),
            currentY + 20, signatureSize.width, signatureSize.height))!;
  }

  Future<void> generateInvoiceMc() async {
    try {
      final PdfDocument document = PdfDocument();

      final PdfPage page = document.pages.add();

      final Size pageSize = page.getClientSize();

      var url = "assets/assets/files/HFELogo.png";
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = response.bodyBytes;

        PdfBitmap image = PdfBitmap(data);

        final PdfLayoutResult result =
            drawHeaderMc(page, pageSize, document, image);

        final List<int> bytes = await document.save();

        document.dispose();

        await saveAndLaunchFile(bytes, 'MC Task Report.pdf');
      } else {
        print("Error fetching the image: ${response.statusCode}");
      }
    } catch (e) {
      print("Error generating invoice: $e");
    }
  }

  PdfLayoutResult drawHeaderMc(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    final PdfPen borderPen = PdfPen(PdfColor(142, 180, 219), width: 1.0);
    final PdfBrush backgroundBrush = PdfSolidBrush(PdfColor(217, 226, 243));
    final PdfFont headerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);

    double margin = 10; // Margin from all sides
    double currentY =
        100; // Start position for the first section below the image
    double sectionHeight = 20; // Height for each section header
    double pageWidth = pageSize.width - 2 * margin;

    // Draw image
    page.graphics.drawImage(image, Rect.fromLTWH(margin, 10, 100, 80));

    final String centerText = 'MC Task Report';
    final PdfFont centerTextFont =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    final Size centerTextSize = centerTextFont.measureString(centerText);

    // Calculate the X position to center the text
    double centerX = (pageSize.width - centerTextSize.width) / 2;

    // Draw the center text after the image
    page.graphics.drawString(
      centerText,
      centerTextFont,
      bounds: Rect.fromLTWH(
          centerX, 60, centerTextSize.width, centerTextSize.height),
    );

    // Site name section
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString(
        'Site name : ${mcExecutionDetailsModel.value?.site_name ?? ''}',
        headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // MC Information section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('MC Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw MC Information Details (Left Side)
    double labelWidth = 80;
    double valueWidth = 120;
    double labelX = margin + 5;
    double valueX = labelX + labelWidth + 5;

    List<String> mcInfoLabelsLeft = [
      'Plan ID',
      'Task ID',
      'Plan Title',
      'Frequency',
    ];

    List<String> mcInfoValuesLeft = [
      'MCP${mcExecutionDetailsModel.value?.id}',
      'MCT${mcExecutionDetailsModel.value?.executionId}',
      '${mcExecutionDetailsModel.value?.title ?? ''}',
      '${mcExecutionDetailsModel.value?.frequency ?? ''}',
    ];

    double rowHeight = 15;

    for (int i = 0; i < mcInfoLabelsLeft.length; i++) {
      page.graphics.drawString(mcInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(mcInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw MC Information Details (Right Side)
    double labelWidthRight = 80;
    double valueWidthRight = 120;
    double labelXRight = pageWidth / 2 + margin; // Position on the right side
    double valueXRight = labelXRight + labelWidthRight + 5;

    List<String> mcInfoLabelsRight = [
      'Planned By',
      'Schedule Date Time',
      'Planning Date Time',
      'Execution started by'
    ];
    List<String> mcInfoValuesRight = [
      '${mcExecutionDetailsModel.value?.plannedBy}',
      '${mcExecutionDetailsModel.value?.status != 360 ? mcExecutionDetailsModel.value?.scheduledDate : ''}',
      '${mcExecutionDetailsModel.value?.plannedAt}',
      '${mcExecutionDetailsModel.value?.startedBy ?? ''}',
    ];

    currentY -= mcInfoLabelsLeft.length *
        rowHeight; // Reset currentY to align with left side

    for (int i = 0; i < mcInfoLabelsRight.length; i++) {
      page.graphics.drawString(mcInfoLabelsRight[i], contentFont,
          bounds: Rect.fromLTWH(
              labelXRight, currentY + 5, labelWidthRight, rowHeight));
      page.graphics.drawString(mcInfoValuesRight[i], contentFont,
          bounds: Rect.fromLTWH(
              valueXRight, currentY + 5, valueWidthRight, rowHeight));
      currentY += rowHeight;
    }

    // Add "Schedule Execution" header before the table
    currentY += 15;
    double tableWidth =
        pageWidth; // Ensure the header width matches the table width
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, tableWidth, sectionHeight));
    page.graphics.drawString('Schedule Execution', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));

    currentY += sectionHeight;

    // Calculate column widths proportionally
    double totalColWidth = pageWidth - 2 * margin;
    double colWidthSchId = totalColWidth * 0.06;
    double colWidthDays = totalColWidth * 0.06;
    double colWidthScheduled = totalColWidth * 0.12;
    double colWidthCleaned = totalColWidth * 0.10;
    double colWidthAbandoned = totalColWidth * 0.12;
    double colWidthPending = totalColWidth * 0.10;
    double colWidthWaterUsed = totalColWidth * 0.08;
    double colWidthPermitID = totalColWidth * 0.10;
    double colWidthPermitStatus = totalColWidth * 0.15;
    double colWidthStatus = totalColWidth * 0.15;

    // Draw table header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, tableWidth, 25));
    page.graphics.drawString('Id', headerFont,
        bounds: Rect.fromLTWH(margin, currentY, colWidthSchId, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Days', headerFont,
        bounds:
            Rect.fromLTWH(margin + colWidthSchId, currentY, colWidthDays, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Scheduled', headerFont,
        bounds: Rect.fromLTWH(margin + colWidthSchId + colWidthDays, currentY,
            colWidthScheduled, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Cleaned', headerFont,
        bounds: Rect.fromLTWH(
            margin + colWidthSchId + colWidthDays + colWidthScheduled,
            currentY,
            colWidthCleaned,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Abandoned', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned,
            currentY,
            colWidthAbandoned,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Pending', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned,
            currentY,
            colWidthPending,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Water Used', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending,
            currentY,
            colWidthWaterUsed,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('PTW ID', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed,
            currentY,
            colWidthPermitID,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('PTW Status', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed +
                colWidthPermitID,
            currentY,
            colWidthPermitStatus,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Status', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed +
                colWidthPermitID +
                colWidthPermitStatus,
            currentY,
            colWidthStatus,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));

    currentY += 25;

    // Draw table rows
    for (var schedule in mcExecutionDetailsModel.value?.schedules ?? []) {
      page.graphics.drawRectangle(
          pen: borderPen,
          bounds: Rect.fromLTWH(margin, currentY, tableWidth, 25));
      page.graphics.drawString('${schedule.scheduleId}', contentFont,
          bounds: Rect.fromLTWH(margin, currentY, colWidthSchId, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.cleaningDay}', contentFont,
          bounds:
              Rect.fromLTWH(margin + colWidthSchId, currentY, colWidthDays, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.scheduled}', contentFont,
          bounds: Rect.fromLTWH(margin + colWidthSchId + colWidthDays, currentY,
              colWidthScheduled, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.cleaned}', contentFont,
          bounds: Rect.fromLTWH(
              margin + colWidthSchId + colWidthDays + colWidthScheduled,
              currentY,
              colWidthCleaned,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.abandoned}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned,
              currentY,
              colWidthAbandoned,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.pending}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned,
              currentY,
              colWidthPending,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.waterUsed}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending,
              currentY,
              colWidthWaterUsed,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString(
          'PTW${schedule.permit_id}', contentFont, // New Permit ID column
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed,
              currentY,
              colWidthPermitID,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.status_short_ptw}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed +
                  colWidthPermitID,
              currentY,
              colWidthPermitStatus,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.status_short}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed +
                  colWidthPermitID +
                  colWidthPermitStatus,
              currentY,
              colWidthStatus,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      currentY += 25;
    }

    // MC History Section
    currentY += rowHeight * 2;

    double pageHeight = pageSize.height;
    double columnWidth = pageWidth / 4;

    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('MC History', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    List<String> historyHeaders = [
      'Time Stamp',
      'Posted By',
      'Comments',
      'Status'
    ];

    for (int i = 0; i < historyHeaders.length; i++) {
      page.graphics.drawString(historyHeaders[i], contentFont,
          bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
              columnWidth, rowHeight));
    }

    currentY += rowHeight;

    for (var history in historyList!.value) {
      // Check if we need to add a new page
      if (currentY + rowHeight > pageHeight - margin) {
        // Add a new page and reset the currentY
        page = document.pages.add();
        currentY = margin; // Reset Y position for the new page

        // Re-draw the "PM History" header on the new page
        page.graphics.drawRectangle(
            pen: borderPen,
            brush: backgroundBrush,
            bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
        page.graphics.drawString('MC History', headerFont,
            bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
        currentY += sectionHeight;

        // Draw column headers for "PM History"
        for (int i = 0; i < historyHeaders.length; i++) {
          page.graphics.drawString(historyHeaders[i], contentFont,
              bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
                  columnWidth, rowHeight));
        }

        currentY += rowHeight; // Move down after drawing headers
      }

      // Render the history items
      if (history != null) {
        String timeStamp = history.createdAt?.result != null
            ? history.createdAt!.result
                .toString()
                .substring(0, 16)
                .replaceFirst('T', ' ')
            : 'N/A';
        String postedBy = history.createdByName ?? 'Unknown';
        String comments = history.comment ?? 'No comments';
        String status = history.status_name ?? 'Unknown status';

        page.graphics.drawString(timeStamp, contentFont,
            bounds:
                Rect.fromLTWH(margin, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(postedBy, contentFont,
            bounds: Rect.fromLTWH(
                margin + columnWidth, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(comments, contentFont,
            bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
                columnWidth, rowHeight));
        page.graphics.drawString(status, contentFont,
            bounds: Rect.fromLTWH(margin + 3 * columnWidth, currentY + 5,
                columnWidth, rowHeight));

        currentY += rowHeight;
      }
    }

    final String signatureText = 'Signature';
    final Size signatureSize = contentFont.measureString(signatureText);
    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageWidth - (signatureSize.width + margin),
            currentY + 20, signatureSize.width, signatureSize.height))!;
  }

  Future<void> getMCExecutionDetail(
      {required int executionId, required int facilityId}) async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    // mcExecutionDetailsModel?.value = <EndMCExecutionDetailsModel>[];

    final _mcExecutionDetails = await cumulativeReportPresenter
        .getMCExecutionDetail(executionId: executionId, facilityId: facilityId);
    print('MC Execution Detail:$_mcExecutionDetails');

    if (_mcExecutionDetails != null) {
      mcExecutionDetailsModel.value = _mcExecutionDetails;
      getHistory(82, executionId, facilityId);
    }
  }

  // Future<void> getVegTaskEquipmentList(
  //     {required int executionId,
  //     required int facilityId,
  //     required bool isLoading}) async {
  //   final _vegTaskEquipmentList =
  //       await cumulativeReportPresenter.getVegTaskEquipmentList(
  //     isLoading: isLoading,
  //     executionId: executionId,
  //     facilityId: facilityId,
  //   );
  //   if (_vegTaskEquipmentList.isNotEmpty) {
  //     vegTaskEquipment.value = _vegTaskEquipmentList;
  //   }
  // }
  Future<void> getVegExecutionDetail({
    required int executionId,
    required int facilityId,
  }) async {
    final _vegExecutionDetails =
        await cumulativeReportPresenter.getVegExecutionDetail(
      executionId: executionId,
      facilityId: facilityId,
    );
    if (_vegExecutionDetails != null) {
      vegExecutionDetailsModel.value = _vegExecutionDetails;
      getHistory(311, executionId, facilityId);
    }
  }

  Future<void> generateInvoice() async {
    try {
      final PdfDocument document = PdfDocument();

      final PdfPage page = document.pages.add();

      final Size pageSize = page.getClientSize();

      var url = "assets/assets/files/HFELogo.png";
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = response.bodyBytes;

        PdfBitmap image = PdfBitmap(data);

        final PdfLayoutResult result =
            drawHeader(page, pageSize, document, image);

        final List<int> bytes = await document.save();

        document.dispose();

        await saveAndLaunchFile(bytes, 'Veg Task Report.pdf');
      } else {
        print("Error fetching the image: ${response.statusCode}");
      }
    } catch (e) {
      print("Error generating invoice: $e");
    }
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    final PdfPen borderPen = PdfPen(PdfColor(142, 180, 219), width: 1.0);
    final PdfBrush backgroundBrush = PdfSolidBrush(PdfColor(217, 226, 243));
    final PdfFont headerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);

    double margin = 10; // Margin from all sides
    double currentY =
        100; // Start position for the first section below the image
    double sectionHeight = 20; // Height for each section header
    double pageWidth = pageSize.width - 2 * margin;

    // Draw image
    page.graphics.drawImage(image, Rect.fromLTWH(margin, 10, 100, 80));

    final String centerText = 'Veg Task Report';
    final PdfFont centerTextFont =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    final Size centerTextSize = centerTextFont.measureString(centerText);

    // Calculate the X position to center the text
    double centerX = (pageSize.width - centerTextSize.width) / 2;

    // Draw the center text after the image
    page.graphics.drawString(
      centerText,
      centerTextFont,
      bounds: Rect.fromLTWH(
          centerX, 60, centerTextSize.width, centerTextSize.height),
    );

    // Site name section
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString(
        'Site name : ${mcExecutionDetailsModel.value?.site_name ?? ''}',
        headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // MC Information section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('MC Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw MC Information Details (Left Side)
    double labelWidth = 80;
    double valueWidth = 120;
    double labelX = margin + 5;
    double valueX = labelX + labelWidth + 5;

    List<String> mcInfoLabelsLeft = [
      'Plan ID',
      'Task ID',
      'Plan Title',
      'Frequency',
    ];

    List<String> mcInfoValuesLeft = [
      'VCP${vegExecutionDetailsModel.value?.planId}',
      'VET${vegExecutionDetailsModel.value?.executionId}',
      '${vegExecutionDetailsModel.value?.title ?? ''}',
      '${vegExecutionDetailsModel.value?.frequency ?? ''}',
    ];

    double rowHeight = 15;

    for (int i = 0; i < mcInfoLabelsLeft.length; i++) {
      page.graphics.drawString(mcInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(mcInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw MC Information Details (Right Side)
    double labelWidthRight = 80;
    double valueWidthRight = 120;
    double labelXRight = pageWidth / 2 + margin; // Position on the right side
    double valueXRight = labelXRight + labelWidthRight + 5;

    List<String> mcInfoLabelsRight = [
      'Planned By',
      'Start Date Time',
      'Planning Date Time',
      'Execution started by'
    ];
    List<String> mcInfoValuesRight = [
      '${vegExecutionDetailsModel.value?.plannedBy}',
      '${vegExecutionDetailsModel.value?.status != 360 ? vegExecutionDetailsModel.value?.scheduledDate : ''}',
      '${vegExecutionDetailsModel.value?.plannedAt}',
      '${vegExecutionDetailsModel.value?.startedBy ?? ''}',
    ];

    currentY -= mcInfoLabelsLeft.length *
        rowHeight; // Reset currentY to align with left side

    for (int i = 0; i < mcInfoLabelsRight.length; i++) {
      page.graphics.drawString(mcInfoLabelsRight[i], contentFont,
          bounds: Rect.fromLTWH(
              labelXRight, currentY + 5, labelWidthRight, rowHeight));
      page.graphics.drawString(mcInfoValuesRight[i], contentFont,
          bounds: Rect.fromLTWH(
              valueXRight, currentY + 5, valueWidthRight, rowHeight));
      currentY += rowHeight;
    }

    // Add "Schedule Execution" header before the table
    currentY += 15;
    double tableWidth =
        pageWidth; // Ensure the header width matches the table width
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, tableWidth, sectionHeight));
    page.graphics.drawString('Schedule Execution', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));

    currentY += sectionHeight;

    // Calculate column widths proportionally
    double totalColWidth = pageWidth - 2 * margin;
    double colWidthSchId = totalColWidth * 0.06;
    double colWidthDays = totalColWidth * 0.06;
    double colWidthScheduled = totalColWidth * 0.12;
    double colWidthCleaned = totalColWidth * 0.10;
    double colWidthAbandoned = totalColWidth * 0.12;
    double colWidthPending = totalColWidth * 0.10;
    double colWidthWaterUsed = totalColWidth * 0.00;
    double colWidthPermitID = totalColWidth * 0.12;
    double colWidthPermitStatus = totalColWidth * 0.12;
    double colWidthStatus = totalColWidth * 0.15;

    // Draw table header
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, tableWidth, 25));
    page.graphics.drawString('Id', headerFont,
        bounds: Rect.fromLTWH(margin, currentY, colWidthSchId, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Days', headerFont,
        bounds:
            Rect.fromLTWH(margin + colWidthSchId, currentY, colWidthDays, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Scheduled', headerFont,
        bounds: Rect.fromLTWH(margin + colWidthSchId + colWidthDays, currentY,
            colWidthScheduled, 25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Cleaned', headerFont,
        bounds: Rect.fromLTWH(
            margin + colWidthSchId + colWidthDays + colWidthScheduled,
            currentY,
            colWidthCleaned,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Abandoned', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned,
            currentY,
            colWidthAbandoned,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Pending', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned,
            currentY,
            colWidthPending,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));

    ;
    page.graphics.drawString('Permit ID', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed,
            currentY,
            colWidthPermitID,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Permit Status', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed +
                colWidthPermitID,
            currentY,
            colWidthPermitStatus,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Status', headerFont,
        bounds: Rect.fromLTWH(
            margin +
                colWidthSchId +
                colWidthDays +
                colWidthScheduled +
                colWidthCleaned +
                colWidthAbandoned +
                colWidthPending +
                colWidthWaterUsed +
                colWidthPermitID +
                colWidthPermitStatus,
            currentY,
            colWidthStatus,
            25),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));

    currentY += 25;

    // Draw table rows
    for (var schedule in vegExecutionDetailsModel.value?.schedules ?? []) {
      page.graphics.drawRectangle(
          pen: borderPen,
          bounds: Rect.fromLTWH(margin, currentY, tableWidth, 25));
      page.graphics.drawString('${schedule.scheduleId}', contentFont,
          bounds: Rect.fromLTWH(margin, currentY, colWidthSchId, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.cleaningDay}', contentFont,
          bounds:
              Rect.fromLTWH(margin + colWidthSchId, currentY, colWidthDays, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.scheduled}', contentFont,
          bounds: Rect.fromLTWH(margin + colWidthSchId + colWidthDays, currentY,
              colWidthScheduled, 25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.cleaned}', contentFont,
          bounds: Rect.fromLTWH(
              margin + colWidthSchId + colWidthDays + colWidthScheduled,
              currentY,
              colWidthCleaned,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.abandoned}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned,
              currentY,
              colWidthAbandoned,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.pending}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned,
              currentY,
              colWidthPending,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));

      page.graphics.drawString(
          'PTW${schedule.permit_id}', contentFont, // New Permit ID column
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed,
              currentY,
              colWidthPermitID,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.status_short_ptw}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed +
                  colWidthPermitID,
              currentY,
              colWidthPermitStatus,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      page.graphics.drawString('${schedule.status_short}', contentFont,
          bounds: Rect.fromLTWH(
              margin +
                  colWidthSchId +
                  colWidthDays +
                  colWidthScheduled +
                  colWidthCleaned +
                  colWidthAbandoned +
                  colWidthPending +
                  colWidthWaterUsed +
                  colWidthPermitID +
                  colWidthPermitStatus,
              currentY,
              colWidthStatus,
              25),
          format: PdfStringFormat(
              alignment: PdfTextAlignment.center,
              lineAlignment: PdfVerticalAlignment.middle));
      currentY += 25;
    }

    // MC History Section
    currentY += rowHeight * 2;

    double pageHeight = pageSize.height;
    double columnWidth = pageWidth / 4;

    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('MC History', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    List<String> historyHeaders = [
      'Time Stamp',
      'Posted By',
      'Comments',
      'Status'
    ];

    for (int i = 0; i < historyHeaders.length; i++) {
      page.graphics.drawString(historyHeaders[i], contentFont,
          bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
              columnWidth, rowHeight));
    }

    currentY += rowHeight;

    for (var history in historyList!.value) {
      // Check if we need to add a new page
      if (currentY + rowHeight > pageHeight - margin) {
        // Add a new page and reset the currentY
        page = document.pages.add();
        currentY = margin; // Reset Y position for the new page

        // Re-draw the "PM History" header on the new page
        page.graphics.drawRectangle(
            pen: borderPen,
            brush: backgroundBrush,
            bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
        page.graphics.drawString('MC History', headerFont,
            bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
        currentY += sectionHeight;

        // Draw column headers for "PM History"
        for (int i = 0; i < historyHeaders.length; i++) {
          page.graphics.drawString(historyHeaders[i], contentFont,
              bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
                  columnWidth, rowHeight));
        }

        currentY += rowHeight; // Move down after drawing headers
      }

      // Render the history items
      if (history != null) {
        String timeStamp = history.createdAt?.result != null
            ? history.createdAt!.result
                .toString()
                .substring(0, 16)
                .replaceFirst('T', ' ')
            : 'N/A';
        String postedBy = history.createdByName ?? 'Unknown';
        String comments = history.comment ?? 'No comments';
        String status = history.status_name ?? 'Unknown status';

        page.graphics.drawString(timeStamp, contentFont,
            bounds:
                Rect.fromLTWH(margin, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(postedBy, contentFont,
            bounds: Rect.fromLTWH(
                margin + columnWidth, currentY + 5, columnWidth, rowHeight));
        page.graphics.drawString(comments, contentFont,
            bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
                columnWidth, rowHeight));
        page.graphics.drawString(status, contentFont,
            bounds: Rect.fromLTWH(margin + 3 * columnWidth, currentY + 5,
                columnWidth, rowHeight));

        currentY += rowHeight;
      }
    }

    final String signatureText = 'Signature';
    final Size signatureSize = contentFont.measureString(signatureText);
    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageWidth - (signatureSize.width + margin),
            currentY + 20, signatureSize.width, signatureSize.height))!;
  }

  Future<void> generateInvoiceJob() async {
    try {
      final PdfDocument document = PdfDocument();

      final PdfPage page = document.pages.add();

      final Size pageSize = page.getClientSize();

      var url = "assets/assets/files/HFELogo.png";
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = response.bodyBytes;

        PdfBitmap image = PdfBitmap(data);

        final PdfLayoutResult result =
            drawHeaderJob(page, pageSize, document, image);

        final List<int> bytes = await document.save();

        document.dispose();

        await saveAndLaunchFile(bytes, 'Job Details.pdf');
      } else {
        print("Error fetching the image: ${response.statusCode}");
      }
    } catch (e) {
      print("Error generating invoice: $e");
    }
  }

  PdfLayoutResult drawHeaderJob(
    PdfPage page,
    Size pageSize,
    PdfDocument document,
    PdfBitmap image,
  ) {
    final PdfPen borderPen = PdfPen(PdfColor(142, 180, 219), width: 1.0);
    final PdfBrush backgroundBrush = PdfSolidBrush(PdfColor(217, 226, 243));
    final PdfFont headerFont =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);

    double margin = 10; // Margin from all sides
    double currentY =
        100; // Start position for the first section below the image
    double sectionHeight = 20; // Height for each section header
    double pageWidth = pageSize.width - 2 * margin;
    double rowHeight = 20; // Height for each table row, including header

    // Draw image
    page.graphics.drawImage(image, Rect.fromLTWH(margin, 10, 100, 80));

    final String centerText = 'Job Details Report';
    final PdfFont centerTextFont =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    final Size centerTextSize = centerTextFont.measureString(centerText);

    // Calculate the X position to center the text
    double centerX = (pageSize.width - centerTextSize.width) / 2;

    // Draw the center text after the image
    page.graphics.drawString(
      centerText,
      centerTextFont,
      bounds: Rect.fromLTWH(
          centerX, 60, centerTextSize.width, centerTextSize.height),
    );

    // Site name section
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString(
        'Site name : ${jobDetailsModel.value?.facilityName ?? ''}', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Job Information section
    page.graphics.drawRectangle(
        pen: borderPen,
        brush: backgroundBrush,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Job Information', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
    currentY += sectionHeight;

    // Draw Job Information Details (Left Side)
    double labelWidth = 100; // Keeping width for labels consistent
    double valueWidth = 150; // Keeping value width consistent
    double labelX = margin + 5;
    double valueX = labelX + labelWidth + 5;

    List<String> jobInfoLabelsLeft = [
      'Job ID',
      'Job Title',
      'Equipment Categories',
      'Fault',
      'Job Description'
    ];

    List<String> jobInfoValuesLeft = [
      'JOb${jobDetailsModel.value?.id ?? ''}',
      '${jobDetailsModel.value?.jobTitle ?? ''}',
      '${jobDetailsModel.value?.equipmentCatList?.map((item) => item.name).join(", ") ?? ''}',
      '${jobDetailsModel.value?.workTypeList?.map((item) => item.name).join(", ") ?? ''}',
      '${jobDetailsModel.value?.jobDescription ?? ''}',
    ];

    for (int i = 0; i < jobInfoLabelsLeft.length; i++) {
      page.graphics.drawString(jobInfoLabelsLeft[i], contentFont,
          bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
      page.graphics.drawString(jobInfoValuesLeft[i], contentFont,
          bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
      currentY += rowHeight;
    }

    // Draw Job Information Details (Right Side)
    double labelWidthRight = 100;
    double valueWidthRight = 150;
    double labelXRight = pageWidth / 2 + margin; // Position on the right side
    double valueXRight = labelXRight + labelWidthRight + 5;

    List<String> jobInfoLabelsRight = [
      'Block Name',
      'Equipment Name',
      'Raised By',
      'Assigned To',
      'BreakDown'
    ];
    List<String> jobInfoValuesRight = [
      '${jobDetailsModel.value?.blockName}',
      '${jobDetailsModel.value?.workingAreaList?.map((item) => item.name).join(", ") ?? ''}',
      '${jobDetailsModel.value?.createdByName}',
      '${jobDetailsModel.value?.assignedName ?? ''}',
      '${jobDetailsModel.value?.breakdownTime ?? ''}',
    ];

    currentY -= jobInfoLabelsLeft.length *
        rowHeight; // Reset currentY to align with left side

    for (int i = 0; i < jobInfoLabelsRight.length; i++) {
      page.graphics.drawString(jobInfoLabelsRight[i], contentFont,
          bounds: Rect.fromLTWH(
              labelXRight, currentY + 5, labelWidthRight, rowHeight));
      page.graphics.drawString(jobInfoValuesRight[i], contentFont,
          bounds: Rect.fromLTWH(
              valueXRight, currentY + 5, valueWidthRight, rowHeight));
      currentY += rowHeight;
    }

    // Add "Associated JobCard(s)" header before the table
    currentY += 15;
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Associated JobCard(s)', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));

    currentY += sectionHeight;

    // Define the table column headers
    List<String> jobCardHeaders = [
      'Job Card Id',
      'Permit ID',
      'Permit Status',
      'Job Card Date',
      'Status'
    ];

    // Define the same width for all columns
    double colWidth = pageWidth / jobCardHeaders.length;

    // Render shaded header for table
    for (int i = 0; i < jobCardHeaders.length; i++) {
      page.graphics.drawRectangle(
          pen: borderPen,
          brush: backgroundBrush,
          bounds: Rect.fromLTWH(
              margin + i * colWidth, currentY, colWidth, rowHeight));
      page.graphics.drawString(jobCardHeaders[i], headerFont,
          bounds: Rect.fromLTWH(
              margin + i * colWidth + 5, currentY + 5, colWidth, rowHeight));
    }

    currentY += rowHeight; // Move to next row

    // Iterate through each row in `jobAssociatedModelsList`
    for (int index = 0;
        index < (jobAssociatedModelsList?.length ?? 0);
        index++) {
      var job = jobAssociatedModelsList?[index];

      // Map values from the model
      List<String> rowValues = [
        'JC${job?.jobCardId ?? ''}',
        'PTW${job?.permitId ?? ''}',
        job?.isExpired == 1
            ? '${job?.permit_status_short.toString()}(Expired)'
            : '${job?.permit_status_short ?? ''}',
        '${job?.jobCardDate ?? ''}',
        '${job?.status_short ?? ''}'
      ];

      // Render the row values
      for (int i = 0; i < rowValues.length; i++) {
        page.graphics.drawRectangle(
            pen: borderPen,
            bounds: Rect.fromLTWH(
                margin + i * colWidth, currentY, colWidth, rowHeight));
        page.graphics.drawString(rowValues[i], contentFont,
            bounds: Rect.fromLTWH(
                margin + i * colWidth + 5, currentY + 5, colWidth, rowHeight));
      }

      currentY += rowHeight; // Move to next row
    }

    // Add the Material Issue / Used section header
    currentY += 20; // Add some spacing
    page.graphics.drawRectangle(
        pen: borderPen,
        bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
    page.graphics.drawString('Material Issue / Used', headerFont,
        bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));

    currentY += sectionHeight;

// Define fixed column widths
    double colWidthJobCardId = 100;
    double colWidthMRSId = 100;
    double colWidthStatus = 100;

// Calculate the remaining width for "Mrs Items List"
    double colWidthMrsItemsList =
        pageWidth - (colWidthJobCardId + colWidthMRSId + colWidthStatus);

// Define the Material Issue / Used table headers
    List<String> materialHeaders = [
      'Job Card Id',
      'MRS ID',
      'Mrs Items List',
      'Status'
    ];

// Render shaded header for Material Issue / Used table
    double headerX = margin;
    for (int i = 0; i < materialHeaders.length; i++) {
      double colWidth = (i == 2)
          ? colWidthMrsItemsList
          : (i == 0
              ? colWidthJobCardId
              : (i == 1 ? colWidthMRSId : colWidthStatus));
      page.graphics.drawRectangle(
          pen: borderPen,
          brush: backgroundBrush,
          bounds: Rect.fromLTWH(headerX, currentY, colWidth, rowHeight));
      page.graphics.drawString(materialHeaders[i], headerFont,
          bounds:
              Rect.fromLTWH(headerX + 5, currentY + 5, colWidth, rowHeight));
      headerX += colWidth;
    }

    currentY += rowHeight; // Move to next row

// Iterate through each row in `listMrsByJobId`
    for (int index = 0; index < (listMrsByJobId?.length ?? 0); index++) {
      var mrs = listMrsByJobId?[index];

      // Map values from the model
      List<String> rowValues = [
        '${mrs?.jobCardId ?? ''}',
        mrs?.is_mrs_return == 0
            ? "MRS${mrs?.mrsId.toString() ?? ''}"
            : "RMRS${mrs?.mrs_return_ID.toString() ?? ''}",
        '${mrs?.mrsItems ?? ''}',
        '${mrs?.status_short ?? ''}'
      ];

      // Render the row values
      double rowX = margin;
      for (int i = 0; i < rowValues.length; i++) {
        double colWidth = (i == 2)
            ? colWidthMrsItemsList
            : (i == 0
                ? colWidthJobCardId
                : (i == 1 ? colWidthMRSId : colWidthStatus));
        page.graphics.drawRectangle(
            pen: borderPen,
            bounds: Rect.fromLTWH(rowX, currentY, colWidth, rowHeight));
        page.graphics.drawString(rowValues[i], contentFont,
            bounds: Rect.fromLTWH(rowX + 5, currentY + 5, colWidth, rowHeight));
        rowX += colWidth;
      }

      currentY += rowHeight; // Move to next row
    }
    for (var jobCard in allJobCardDetails) {
      // Add a new page for each JobCard if the content exceeds the page height
      if (currentY > pageSize.height - 120) {
        page = document.pages.add(); // Add a new page
        currentY = 30; // Reset the Y position for the new page
      }

      // Add the jobCardId at the top of the section
      page.graphics.drawString('JobCard ID: ${jobCard?.id ?? ''}', headerFont,
          bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
      currentY += sectionHeight;

      // Site name for each JobCard
      page.graphics.drawRectangle(
          pen: borderPen,
          bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
      page.graphics.drawString(
          'Site name : ${jobCard?.plantName ?? ''}', headerFont,
          bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
      currentY += sectionHeight;

      // Job Information for each JobCard
      page.graphics.drawRectangle(
          pen: borderPen,
          brush: backgroundBrush,
          bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
      page.graphics.drawString('Job Information', headerFont,
          bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
      currentY += sectionHeight;

      // Draw Job Information Details (Left Side)
      List<String> jobInfoLabelsLeft = [
        'Job ID',
        'Breakdown start time',
        'Job raised on',
        'Type of Job',
        'Performed by'
      ];

      // Accessing the values from LstCmjcJobDetailList
      LstCmjcJobDetailList? jobDetails =
          jobCard.lstCmjcJobDetailList?.isNotEmpty ?? false
              ? jobCard.lstCmjcJobDetailList!.first
              : null;

      List<String> jobInfoValuesLeft = [
        'JOB${jobCard?.jobId ?? ''}',
        '${jobDetails?.breakdownStartTime ?? ''}',
        '${jobDetails?.jobRaisedOn ?? ''}',
        '${jobDetails?.typeOfJob ?? ''}',
        '${jobDetails?.performBy ?? ''}',
      ];

      double rowHeight = 15;
      for (int i = 0; i < jobInfoLabelsLeft.length; i++) {
        page.graphics.drawString(jobInfoLabelsLeft[i], contentFont,
            bounds: Rect.fromLTWH(labelX, currentY + 5, labelWidth, rowHeight));
        page.graphics.drawString(jobInfoValuesLeft[i], contentFont,
            bounds: Rect.fromLTWH(valueX, currentY + 5, valueWidth, rowHeight));
        currentY += rowHeight;

        // Check if a new page is needed before continuing
        if (currentY > pageSize.height - 120) {
          page = document.pages.add(); // Add a new page
          currentY = 30; // Reset the Y position for the new page
        }
      }

      // Equipment details for each JobCard
      currentY += 20; // Adding some space before the next section
      page.graphics.drawRectangle(
          pen: borderPen,
          brush: backgroundBrush,
          bounds: Rect.fromLTWH(margin, currentY, pageWidth, sectionHeight));
      page.graphics.drawString('Equipment details', headerFont,
          bounds: Rect.fromLTWH(margin + 5, currentY + 5, 0, 0));
      currentY += sectionHeight;

      // Define column widths for the Equipment details table
      double columnWidth = pageWidth / 3; // Split page into 3 columns

      // Draw Equipment Headers
      List<String> equipmentHeaders = [
        'S. No',
        'Equipment category',
        'Equipment name'
      ];

      for (int i = 0; i < equipmentHeaders.length; i++) {
        page.graphics.drawString(equipmentHeaders[i], contentFont,
            bounds: Rect.fromLTWH(margin + (i * columnWidth), currentY + 5,
                columnWidth, rowHeight));
      }
      currentY += rowHeight; // Move down after rendering headers

      // Correctly accessing the equipment data from jobCard
      List<AssetCategories>? equipmentList = jobCard.assetCategoryName;

      if (equipmentList != null && equipmentList.isNotEmpty) {
        for (int i = 0; i < equipmentList.length; i++) {
          var equipment = equipmentList[i];

          // Draw the serial number
          page.graphics.drawString('${i + 1}', contentFont,
              bounds: Rect.fromLTWH(
                  margin, currentY + 5, columnWidth, rowHeight)); // S. No

          // Draw the equipment category
          page.graphics.drawString(
              '${equipment.equipmentCategory ?? ''}', contentFont,
              bounds: Rect.fromLTWH(margin + columnWidth, currentY + 5,
                  columnWidth, rowHeight)); // Equipment category

          // Draw the equipment name
          page.graphics.drawString(
              '${equipment.equipmentName ?? ''}', contentFont,
              bounds: Rect.fromLTWH(margin + 2 * columnWidth, currentY + 5,
                  columnWidth, rowHeight)); // Equipment name

          currentY += rowHeight; // Move to next row

          // Add a new page if content exceeds page height
          if (currentY > pageSize.height - 120) {
            page = document.pages.add(); // Add a new page
            currentY = 30; // Reset Y position for the new page
          }
        }
      } else {
        // Display a message if no equipment data is available
        page.graphics.drawString('No equipment data available', contentFont,
            bounds: Rect.fromLTWH(margin, currentY + 5, pageWidth, rowHeight));
      }

      currentY += 20; // Add space between jobCard sections
    }

    // Signature section
    final String signatureText = 'Signature';
    final Size signatureSize = contentFont.measureString(signatureText);
    return PdfTextElement(text: signatureText, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageWidth - (signatureSize.width + margin),
            currentY + 20, signatureSize.width, signatureSize.height))!;
  }

  Future<void> getJobDetails(int? jobId, int facilityId) async {
    try {
      jobDetailsList?.value = <JobDetailsModel>[];
      final _jobDetailsList = await cumulativeReportPresenter.getJobDetails(
          facilityId: facilityId, jobId: jobId, isLoading: false);

      if (_jobDetailsList != null && _jobDetailsList.isNotEmpty) {
        jobDetailsModel.value = _jobDetailsList[0];
        associatedPermitList?.value =
            jobDetailsModel.value?.associatedPermitList ?? [];
        await getMrsListByModule(jobId: jobId ?? 0, facilityId: facilityId);
        await getJobCardList(jobId ?? 0, facilityId);
        await generateInvoiceJob();
        update(["jobDetailsModel"]);
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'getJobDetails');
    }
  }

  Future<void> getJobCardDetails(int? jobCardId, int facilityId) async {
    try {
      // Await the result, which might contain nullable items
      List<JobCardDetailsModel?> jobCardDetails =
          await cumulativeReportPresenter.getJobCardDetails(
                jobCardId: jobCardId,
                isLoading: true,
              ) ??
              [];

      // Filter out any null values and add only non-null values to allJobCardDetails
      allJobCardDetails.addAll(jobCardDetails
          .where((detail) => detail != null)
          .cast<JobCardDetailsModel>());
    } catch (e) {
      Utility.showDialog(e.toString(), 'getJobDetails');
    }
  }

  Future<void> getJobCardList(int jobId, int facilityId) async {
    try {
      jobAssociatedModelsList?.value = <JobAssociatedModel>[];

      // Fetching the job details
      final _jobAssociatedModelsList =
          await cumulativeReportPresenter.getjobDetailsModel(
              jobId: jobId, isLoading: false, facilityId: facilityId);

      if (_jobAssociatedModelsList != null &&
          _jobAssociatedModelsList.isNotEmpty) {
        jobAssociatedModelsList!.value = _jobAssociatedModelsList;

        for (var job in _jobAssociatedModelsList) {
          final jobCardId = job?.jobCardId;

          if (jobCardId != null) {
            await getJobCardDetails(jobCardId, facilityId);
            print('jobCardId: $jobCardId');
          }
        }

        update(["getjobDetailsModel"]);
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'getjobDetailsModel');
    }
  }

  Future<void> getMrsListByModule(
      {required int jobId, required int facilityId}) async {
    /// TODO: CHANGE THESE VALUES
    // int moduleType = 81;
    // // int tempModuleType = 21;
    // int id = Get.arguments;
    //
    listMrsByJobId?.value = await cumulativeReportPresenter.getMrsListByModule(
          jobId,
          facilityId,
          false,
        ) ??
        [];
    update(["JobsLinkdToPermitList"]);
  }
}
