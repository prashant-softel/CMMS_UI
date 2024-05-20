import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/schedule_course_list/schedule_course_list_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
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

final List<Map<dynamic, dynamic>> scheduleData = [
  {
    "Schedule ID": "S1",
    "Course ID": "C1",
    "Schedule Date": "2023/01/12",
    "Training Company": "Company Name",
    "Trainer": "Trainer",
    "Mode": "Offline",
    "Venue": "Company",
    "Status": "Pending",
  },
  {
    "Schedule ID": "S2",
    "Course ID": "C2",
    "Schedule Date": "2023/01/11",
    "Training Company": "Company",
    "Trainer": "Trainer",
    "Mode": "Online",
    "Venue": "Company",
    "Status": "Completed",
  },
  {
    "Schedule ID": "S3",
    "Course ID": "C3",
    "Schedule Date": "2023/01/12",
    "Training Company": "Company",
    "Trainer": "Trainer",
    "Mode": "Online",
    "Venue": "Company",
    "Status": "Pending",
  },
  {
    "Schedule ID": "S4",
    "Course ID": "C4",
    "Schedule Date": "2023/01/12",
    "Training Company": "Company",
    "Trainer": "Trainer",
    "Mode": "Online",
    "Venue": "Company",
    "Status": "Pending",
  },
  {
    "Schedule ID": "S5",
    "Course ID": "C5",
    "Schedule Date": "2023/01/12",
    "Training Company": "Company",
    "Trainer": "Trainer",
    "Mode": "Offline",
    "Venue": "Company",
    "Status": "Completed",
  },
];

class _ScheduleCourseWebState extends State<ScheduleCourseWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleCourseListController>(
      id: "stock_Mangement_Date",
      builder: (controller) {
        return SelectionArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
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
                          ]),
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
                            " / SCHEDULE COURSE LIST",
                            style: Styles.greyLight14,
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: Get.width * 7,
                          margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                          height: Get.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, top: 10, right: 10),
                                    child: Column(
                                      children: [
                                        Card(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 20,
                                                    top: 20,
                                                  ),
                                                  child: Text(
                                                    "Schedule Course List",
                                                    style: Styles.blackBold16,
                                                  ),
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Date Range'),
                                                    Dimens.boxWidth10,
                                                    CustomTextFieldForStock(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      numberTextField: true,
                                                      onTap: () {
                                                        controller
                                                                .openFromDateToStartDatePicker =
                                                            !controller
                                                                .openFromDateToStartDatePicker;
                                                        controller.update([
                                                          'stock_Mangement_Date'
                                                        ]);
                                                      },
                                                      hintText:
                                                          '${controller.formattedFromdate.toString()} - ${controller.formattedTodate.toString()}',
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                              Divider(
                                                color:
                                                    ColorValues.greyLightColor,
                                              ),
                                              Container(
                                                color: Color.fromARGB(
                                                    255, 245, 248, 250),
                                                width: Get.width,
                                                height: Get.height,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: DataTable2(
                                                    // fixedLeftColumns: 1,
                                                    headingRowHeight: 70,
                                                    columnSpacing: 12,
                                                    horizontalMargin: 12,
                                                    headingRowColor:
                                                        MaterialStateColor
                                                            .resolveWith(
                                                      (states) {
                                                        return ColorValues
                                                            .lightGreyColor;
                                                      },
                                                    ),
                                                    // fixedColumnsColor: ColorValues
                                                    //     .appYellowColor,
                                                    // minWidth: 2350,
                                                    columns: [
                                                      DataColumn2(
                                                        // fixedWidth: 70,
                                                        label: Text(
                                                          "Schedule ID",
                                                          style: Styles
                                                              .blackBold14,
                                                        ),
                                                        // size: ColumnSize.L,
                                                      ),
                                                      DataColumn2(
                                                        // fixedWidth: 110,
                                                        label: Text(
                                                          "Course ID",
                                                          style: Styles
                                                              .blackBold14,
                                                        ),
                                                        // size: ColumnSize.L,
                                                      ),
                                                      DataColumn2(
                                                        // fixedWidth: 110,
                                                        label: Text(
                                                          "Schedule Date",
                                                          style: Styles
                                                              .blackBold14,
                                                        ),
                                                        // size: ColumnSize.L,
                                                      ),
                                                      DataColumn2(
                                                        // fixedWidth: 160,
                                                        label: Text(
                                                          "Training Company",
                                                          style: Styles
                                                              .blackBold14,
                                                        ),
                                                        size: ColumnSize.L,
                                                      ),
                                                      DataColumn2(
                                                        // fixedWidth: 110,
                                                        label: Text(
                                                          "Trainer",
                                                          style: Styles
                                                              .blackBold14,
                                                        ),
                                                        // size: ColumnSize.L,
                                                      ),
                                                      DataColumn2(
                                                        // fixedWidth: 90,
                                                        label: Text(
                                                          "Mode",
                                                          style: Styles
                                                              .blackBold14,
                                                        ),
                                                        // size: ColumnSize.L,
                                                      ),
                                                      DataColumn2(
                                                        // fixedWidth: 90,
                                                        label: Text(
                                                          "Venue",
                                                          style: Styles
                                                              .blackBold14,
                                                        ),
                                                        // size: ColumnSize.L,
                                                      ),
                                                      DataColumn2(
                                                        // fixedWidth: 90,
                                                        label: Text(
                                                          "Status",
                                                          style: Styles
                                                              .blackBold14,
                                                        ),
                                                        // size: ColumnSize.L,
                                                      ),
                                                      DataColumn2(
                                                          label: Text("Action",
                                                              style: Styles
                                                                  .blackBold14))
                                                    ],
                                                    rows: scheduleData.map(
                                                      (data) {
                                                        return DataRow(
                                                          cells: [
                                                            DataCell(Text(data[
                                                                "Schedule ID"
                                                                    .toString()])),
                                                            DataCell(Text(data[
                                                                "Course ID"])),
                                                            DataCell(Text(data[
                                                                "Schedule Date"])),
                                                            DataCell(Text(data[
                                                                "Training Company"])),
                                                            DataCell(Text(data[
                                                                "Trainer"])),
                                                            DataCell(Text(
                                                                data["Mode"])),
                                                            DataCell(Text(
                                                                data["Venue"])),
                                                            DataCell(Text(data[
                                                                "Status"])),
                                                            DataCell(
                                                              Row(
                                                                children: [
                                                                  TableActionButton(
                                                                    color: ColorValues
                                                                        .executeColor,
                                                                    icon: Icons
                                                                        .arrow_forward,
                                                                    message:
                                                                        "Execute",
                                                                    onPress:
                                                                        () {
                                                                      Get.toNamed(
                                                                        Routes
                                                                            .executeCourse,
                                                                      );
                                                                    },
                                                                  ),
                                                                  TableActionButton(
                                                                    color: ColorValues
                                                                        .viewColor,
                                                                    icon: Icons
                                                                        .visibility_outlined,
                                                                    message:
                                                                        "View",
                                                                    onPress:
                                                                        () {
                                                                      Get.toNamed(
                                                                        Routes
                                                                            .executeCourse,
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ).toList(),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
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
                    ), // last date of this year
                    // controller: DateRangePickerController(),
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
                      var dropDate = DateTime.parse(data.endDate.toString());
                      dropDate != null
                          ? controller.toDate.value = dropDate
                          : controller.toDate.value = pickUpDate;

                      // controller.getNewPermitListByDate();
                      controller.openFromDateToStartDatePicker =
                          !controller.openFromDateToStartDatePicker;
                      controller.update(['stock_Mangement_Date']);

                      // Get.toNamed(
                      //   Routes.stockManagementGoodsOrdersScreen,
                      // );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

DataColumn2 buildDataColumn(
  // String columnName,
  String header,

  /// ColumnSize columnSize,
  RxString filterText,
  double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  return //
      DataColumn2(
    // size: columnSize,
    fixedWidth: fixedWidth,

    label: //
        Column(
      mainAxisAlignment: MainAxisAlignment.center, //
      children: [
        SizedBox(
          height: Get.height * 0.05,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            onChanged: (value) {
              filterText.value = value;
            },
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Filter',
              contentPadding:
                  EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
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
