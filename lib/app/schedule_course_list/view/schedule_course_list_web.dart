import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/schedule_course_list/schedule_course_list_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/schedule_course_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ScheduleCourseWeb extends StatefulWidget {
  const ScheduleCourseWeb({Key? key}) : super(key: key);

  @override
  _ScheduleCourseWebState createState() => _ScheduleCourseWebState();
}

class _ScheduleCourseWebState extends State<ScheduleCourseWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleCourseListController>(
      id: "schedule_list",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => SelectionArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      HeaderWidget(),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 227, 224, 224),
                              width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 236, 234, 234)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: ColorValues.greyLightColor,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offNamed(Routes.home);
                              },
                              child: Text(
                                "DASHBOARD",
                                style: Styles.greyLight14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offNamed(Routes.misDashboard);
                              },
                              child: Text(
                                " / MIS",
                                style: Styles.greyLight14,
                              ),
                            ),
                            Text(
                              " /TRAINING SCHEDULE LIST",
                              style: Styles.greyLight14,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            child: Container(
                              width: Get.width * 7,
                              margin: EdgeInsets.all(10),
                              height: Get.height * .84,
                              child: Card(
                                color: Color.fromARGB(255, 245, 248, 250),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Training Schedule List",
                                            style: Styles.blackBold16,
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Date Range'),
                                              Dimens.boxWidth10,
                                              CustomTextFieldForStock(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                numberTextField: true,
                                                onTap: () {
                                                  controller
                                                          .openFromDateToStartDatePicker =
                                                      !controller
                                                          .openFromDateToStartDatePicker;
                                                  controller.update(
                                                      ['stock_Mangement_Date']);
                                                },
                                                hintText:
                                                    '${controller.formattedFromdate.toString()} - ${controller.formattedTodate.toString()}',
                                              ),
                                            ],
                                          ),
                                            Dimens.boxWidth10,
                                          ActionButton(
                                            icon: Icons.calendar_month_outlined,
                                            label: "Add Schedule",
                                            onPressed: () {
                                                controller.scheduleCourse(
                                              // courseId:ScheduleCourse.courseID??0,
                                              courseId:0,
                                              scheduleId:0,
                                            );
                                            },
                                            color: ColorValues.addNewColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: ColorValues.greyLightColour,
                                    ),
                                    Dimens.boxHeight10,
                                    Row(
                                      children: [
                                        PopupMenuButton<String>(
                                          tooltip: "",
                                          elevation: 25.0,
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.only(left: 10),
                                            padding: EdgeInsets.only(
                                                top: 4,
                                                bottom: 4,
                                                right: 8,
                                                left: 8),
                                            decoration: BoxDecoration(
                                                color: ColorValues
                                                    .appLightBlueColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset:
                                                        const Offset(4.0, 2.0),
                                                    blurRadius: 5.0,
                                                    spreadRadius: 1.0,
                                                  ),
                                                ]),
                                            child: Text(
                                              'Column Visibility',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry<String>>[]
                                                ..addAll(
                                                  controller.columnVisibility
                                                      .value.entries
                                                      .map(
                                                    (e) {
                                                      return PopupMenuItem<
                                                          String>(
                                                        child:
                                                            ValueListenableBuilder(
                                                          valueListenable:
                                                              controller
                                                                  .columnVisibility,
                                                          builder: (
                                                            context,
                                                            value,
                                                            child,
                                                          ) {
                                                            return Row(
                                                              children: [
                                                                Checkbox(
                                                                  value: value[
                                                                      e.key],
                                                                  onChanged:
                                                                      (newValue) {
                                                                    controller
                                                                        .setColumnVisibility(
                                                                      e.key,
                                                                      newValue!,
                                                                    );
                                                                  },
                                                                ),
                                                                Text(e.key),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                          onSelected: (String value) {},
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 300,
                                          height: 40,
                                          margin: Dimens.edgeInsets0_0_16_0,
                                          child: TextField(
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                fontSize: 16.0,
                                                height: 1.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                            onChanged: (value) {
                                              controller.search(value);
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0,
                                                ),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0,
                                                ),
                                              ),
                                              contentPadding:
                                                  Dimens.edgeInsets05_10,
                                              hintText: 'search'.tr,
                                              hintStyle: Styles.grey16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    controller.scourseList.isEmpty == true &&
                                            controller.isLoading == false
                                        ? Center(
                                            child: Text('No data'),
                                          )
                                        : controller.isLoading.value == true
                                            ? Center(
                                                child:
                                                    Text("Data Loading......"),
                                              )
                                            : Expanded(
                                                child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        ScheduleCourseListDataSource(
                                                            controller);
                                                    return PaginatedDataTable2(
                                                      dataRowHeight: 55,
                                                      source: dataSource,
                                                      minWidth: Get.width * 1.2,
                                                      showCheckboxColumn: false,
                                                      rowsPerPage: 10,
                                                      availableRowsPerPage: [
                                                        10,
                                                        20,
                                                        30,
                                                        50
                                                      ],
                                                      columns: [
                                                        for (var entry
                                                            in value.entries)
                                                          if (entry.value)
                                                            buildDataColumn(
                                                              entry.key,
                                                              controller
                                                                      .filterText[
                                                                  entry.key]!,
                                                              controller
                                                                      .columnwidth[
                                                                  entry.key],
                                                            ),
                                                        buildDataColumn(
                                                          'Actions',
                                                          controller
                                                              .ActionFilterText,
                                                          250,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      right: 230,
                      top: 90,
                      child: DatePickerWidget(
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          todayCellDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorValues.appDarkBlueColor),
                        ),
                        initialSelectedRange: PickerDateRange(
                          controller.fromDate.value,
                          controller.toDate.value,
                        ),
                        onSubmit: (value) {
                          print('po valu ${value.toString()}');
                          PickerDateRange? data = value as PickerDateRange;
                          var pickUpDate =
                              DateTime.parse(data.startDate.toString());
                          controller.fromDate.value = pickUpDate;
                          var dropDate =
                              DateTime.parse(data.endDate.toString());
                          dropDate != null
                              ? controller.toDate.value = dropDate
                              : controller.toDate.value = pickUpDate;
                          controller.geScheduleCourseListByDate();
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

DataColumn2 buildDataColumn(
  String header,
  RxString filterText,
  double? fixedWidth,
) {
  return DataColumn2(
    fixedWidth: fixedWidth,
    label: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            header,
            style: Styles.black16W500,
          ),
        ),
      ],
    ),
  );
}

class ScheduleCourseListDataSource extends DataTableSource {
  final ScheduleCourseListController controller;

  late List<ScheduleCourseListModel?> filteredScheduleCourseList;

  ScheduleCourseListDataSource(this.controller) {
    filterUsers();
  }

  void filterUsers() {
    filteredScheduleCourseList = <ScheduleCourseListModel?>[];
    filteredScheduleCourseList = controller.scourseList.where((ScheduleCourse) {
      return (ScheduleCourse?.scheduleID ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.ScheduleIdFilterText.value.toLowerCase()) &&
          (ScheduleCourse?.courseID ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.CourseIdFilterText.value.toLowerCase()) &&
          (ScheduleCourse?.scheduleDate ?? '')
              .toString()
              .toLowerCase()
              .contains(
                  controller.ScheduledateFilterText.value.toLowerCase()) &&
          (ScheduleCourse?.trainingCompany ?? '')
              .toString()
              .toLowerCase()
              .contains(
                  controller.TrainingcompanyFilterText.value.toLowerCase()) &&
          (ScheduleCourse?.trainer ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.trainerFilterText.value.toLowerCase()) &&
          (ScheduleCourse?.mode ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.modeFilterText.value.toLowerCase()) &&
          (ScheduleCourse?.venue ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.venueFilterText.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final ScheduleCourse = filteredScheduleCourseList[index];
    String schedDate = ScheduleCourse!.scheduleDate != null
        ? ScheduleCourse.scheduleDate.toString()
        : '';
    // print("Schedule Date: ${ScheduleCourse.scheduleDate}");
    // if (schedDate.length > 0) {
    //   schedDate = schedDate.substring(0, schedDate.length - 9);
    // }

    var cellsBuffer = [
      "scheduleID",
      'TC${ScheduleCourse.courseID ?? ''}',
      schedDate,
      '${ScheduleCourse.trainingCompany ?? ''}',
      '${ScheduleCourse.trainer ?? 0}',
      '${ScheduleCourse.mode ?? 0}',
      '${ScheduleCourse.venue ?? ''}',
      'Actions',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            
                child: (value == 'scheduleID')
                    ?
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SC${ScheduleCourse.scheduleID}',
                          ),
                          Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                               decoration: BoxDecoration(
                                    color:  ColorValues.appGreenColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${ScheduleCourse.short_status}',
                            style: Styles.white10.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                        ],
                      )
                :(value == 'Actions')
                    ? Wrap(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                   TableActionButton(
                                         color: ColorValues.appDarkBlueColor,
                                          icon: Icons.visibility,
                                          message: "View Schedule",
                                          onPress: () {
                                            controller.viewScheduleCourse(
                                              scheduleId:ScheduleCourse.scheduleID??
                                                  0,
                                            );
                                          },
                                        ),

                                    TableActionButton(
                                          color: ColorValues.editColor,
                                          icon: Icons.edit,
                                          message: "Edit Schedule",
                                          onPress: () {
                                            controller.scheduleCourse(
                                              courseId:  ScheduleCourse.courseID??0,
                                              scheduleId: ScheduleCourse.scheduleID??0 ,
                                            );
                                          },
                                        ),
                                  //                TableActionButton(
                                  //   color: ColorValues.appDarkBlueColor,
                                  //   icon: Icons.visibility,
                                  //   message: 'View',
                                  //   onPress: () {
                                  //     controller.clearStoreData();
                                  //     Get.toNamed(
                                  //       Routes.executeCourse,
                                  //       arguments: {
                                  //         "schedule_id":
                                  //             ScheduleCourse.scheduleID,
                                  //         "type": 1,
                                  //       },
                                  //     );
                                  //   },
                                  // ),
                                  TableActionButton(
                                    color: ColorValues.executeColor,
                                    icon: Icons.arrow_forward,
                                    message: 'Execute',
                                    onPress: () {
                                      controller.clearStoreData();
                                      Get.toNamed(
                                        Routes.executeCourse,
                                        arguments: {
                                          "schedule_id":
                                              ScheduleCourse.scheduleID,
                                               "type": 1,
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      onSelectChanged: (_) {
        controller.clearStoreData();
        Get.toNamed(
          Routes.executeCourse,
          arguments: {"schedule_id": ScheduleCourse.scheduleID, "type": 1},
        );
      },
    );
  }

  @override
  int get rowCount => filteredScheduleCourseList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
