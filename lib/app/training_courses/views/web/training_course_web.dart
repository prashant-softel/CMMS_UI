import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/training_courses/training_course_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TrainingCourseWeb extends StatefulWidget {
  const TrainingCourseWeb({Key? key}) : super(key: key);

  @override
  _TrainingCourseWebState createState() => _TrainingCourseWebState();
}

class _TrainingCourseWebState extends State<TrainingCourseWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
      id: "training_list",
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
                              " / TRAINING COURSES",
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
                                            "Training Course List",
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
                                            icon: Icons.add,
                                            label: "Add New",
                                            onPressed: () {
                                              controller.addNewCourse();
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
                                    controller.courseList.isEmpty == true &&
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
                                                        TrainingListDataSource(
                                                            controller);
                                                    return PaginatedDataTable2(
                                                      dataRowHeight: 45,
                                                      source: dataSource,
                                                      minWidth: Get.width * 2,
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
                          controller.geTrainingCourseListByDate();
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
        // SizedBox(
        //   height: Get.height * 0.05,
        //   child: TextField(
        //     style: GoogleFonts.lato(
        //       textStyle:
        //           TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
        //     ),
        //     onChanged: (value) {
        //       filterText.value = value;
        //       //   onSearchCallBack(value);
        //     },
        //     textAlign: TextAlign.left,
        //     decoration: InputDecoration(
        //       hintText: 'Filter',
        //       contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(5),
        //         borderSide: BorderSide(color: Colors.black),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(5),
        //         borderSide: BorderSide(color: Colors.black),
        //       ),
        //       enabledBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(5),
        //         borderSide: BorderSide(color: Colors.black),
        //       ),
        //     ),
        //   ),
        // ),
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

class TrainingListDataSource extends DataTableSource {
  final TrainingController controller;

  late List<TrainingCourseListModel?> filteredTrainingCourseList;

  TrainingListDataSource(this.controller) {
    filterUsers();
  }

  void filterUsers() {
    filteredTrainingCourseList = <TrainingCourseListModel?>[];
    filteredTrainingCourseList = controller.courseList.where((TrainingCourse) {
      return (TrainingCourse?.id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.CourseIdFilterText.value.toLowerCase()) &&
          (TrainingCourse?.name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.CourseNameFilterText.value.toLowerCase()) &&
          (TrainingCourse?.groupName ?? '').toString().toLowerCase().contains(
              controller.CategoryNameFilterText.value.toLowerCase()) &&
          (TrainingCourse?.categoryName ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.GroupNameFilterText.value.toLowerCase()) &&
          (TrainingCourse?.number_of_days ?? '')
              .toString()
              .toLowerCase()
              .contains(
                  controller.NumberOfDaysFilterText.value.toLowerCase()) &&
          (TrainingCourse?.duration ?? '').toString().toLowerCase().contains(
              controller.DurationInMinutesFilterText.value.toLowerCase()) &&
          (TrainingCourse?.max_cap ?? '').toString().toLowerCase().contains(
              controller.MaximumCapacityFilterText.value.toLowerCase());
      // (TrainingCourse?.description ?? '')
      //     .toString()
      //     .toLowerCase()
      //     .contains(controller.DescriptionFilterText.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final TrainingCourse = filteredTrainingCourseList[index];
    var cellsBuffer = [
      'TC${TrainingCourse?.id ?? ''}',
      '${TrainingCourse?.name ?? ''}',
      '${TrainingCourse?.groupName ?? ''}',
      '${TrainingCourse?.categoryName ?? ''}',
      '${TrainingCourse?.number_of_days ?? 0}',
      '${TrainingCourse?.duration ?? 0}',
      '${TrainingCourse?.max_cap ?? ''}',
      // '${TrainingCourse?.description ?? ''}',
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
            child:
                // (value == 'id')
                //     ? Column(
                //         // crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'TC${TrainingCourse?.id}',
                //           ),
                //         ],
                //       )
                (value == 'Actions')
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
                                    message: 'View',
                                    onPress: () {
                                      controller.viewCourse(
                                          courseId: TrainingCourse?.id ?? 0);
                                    },
                                  ),
                                  // controller.courseList
                                  //             .firstWhereOrNull((element) =>
                                  //                 element?.id ==
                                  //                 TrainingCourse?.id)
                                  //             ?.status ==
                                  //         471
                                      // ?
                                       TableActionButton(
                                          color: ColorValues.editColor,
                                          icon: Icons.edit,
                                          message: 'Edit',
                                          onPress: () {
                                            controller.editCourse(
                                                courseId:
                                                    TrainingCourse?.id ?? 0);
                                          },
                                        )
                                      // : Dimens.box0,
                                      ,
                                  // controller.courseList
                                  //             .firstWhereOrNull((element) =>
                                  //                 element?.id ==
                                  //                 TrainingCourse?.id)
                                  //             ?.status ==
                                  //         471
                                      // ? 
                                      TableActionButton(
                                          color: Colors.lightGreen,
                                          icon: Icons.calendar_month_outlined,
                                          message: "Schedule",
                                          onPress: () {
                                            controller.scheduleCourse(
                                              courseId: TrainingCourse?.id ?? 0,
                                              scheduleId: 0,
                                            );
                                          },
                                        )
                                      // : Dimens.box0,
                                      ,
                                  // controller.courseList
                                  //             .firstWhereOrNull((element) =>
                                  //                 element?.id ==
                                  //                 TrainingCourse?.id)
                                  //             ?.status ==
                                  //         472
                                      // ?
                                       TableActionButton(
                                          color: ColorValues.appLightBlueColor,
                                          icon: Icons.remove_red_eye,
                                          message: "View Schedule",
                                          onPress: () {
                                            controller.viewScheduleCourse(
                                              scheduleId:
                                                  TrainingCourse?.id ?? 0,
                                            );
                                          },
                                        )

                                      // : Dimens.box0,
                                      ,
                                  // controller.courseList
                                  //             .firstWhereOrNull((element) =>
                                  //                 element?.id ==
                                  //                 TrainingCourse?.id)
                                  //             ?.status ==
                                  //         472
                                      // ?
                                       TableActionButton(
                                          color: ColorValues.editColor,
                                          icon: Icons.edit,
                                          message: "Edit Schedule",
                                          onPress: () {
                                            controller.scheduleCourse(
                                              courseId: TrainingCourse?.id ?? 0,
                                              scheduleId: 3,
                                            );
                                          },
                                        )
                                      // : Dimens.box0,
                                      ,

                                  TableActionButton(
                                    color: ColorValues.deleteColor,
                                    icon: Icons.delete,
                                    message: 'Delete',
                                    onPress: () {
                                      controller.isDeleteDialog(
                                        courseName: TrainingCourse?.name,
                                        courseId: TrainingCourse?.id,
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
        controller.viewCourse(courseId: TrainingCourse?.id ?? 0);
      },
    );
  }

  @override
  int get rowCount => filteredTrainingCourseList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
