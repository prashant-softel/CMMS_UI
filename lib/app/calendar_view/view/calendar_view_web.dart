import 'package:cmms/app/calendar_view/calendar_view_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class CalendarViewWeb extends StatefulWidget {
  CalendarViewWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarViewWeb> createState() => _DocUploadWebState();
}

class _DocUploadWebState extends State<CalendarViewWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarViewController>(
      id: 'stock_Mangement_Date',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    HeaderWidget(),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 227, 224, 224),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 236, 234, 234)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
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
                              Get.offAllNamed(Routes.calendarViewDashbord);
                            },
                            child:
                                Text(" / CALENDER ", style: Styles.greyLight14),
                          ),
                          Text(" / CALENDER VIEW", style: Styles.greyLight14)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Card(
                          color: Color.fromARGB(255, 245, 248, 250),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // calenderViewData
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // if (controller.openFromDateToStartDatePicker)
                //   Positioned(
                //     right: 40,
                //     top: 180,
                //     child: DatePickerWidget(
                //       selectionMode: DateRangePickerSelectionMode.range,
                //       monthCellStyle: DateRangePickerMonthCellStyle(
                //         todayCellDecoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: ColorValues.appDarkBlueColor),
                //       ),
                //       initialSelectedRange: PickerDateRange(
                //         controller.fromDate.value,
                //         controller.toDate.value,
                //       ),
                //       onSubmit: (value) {
                //         if (value is PickerDateRange) {
                //           var startDate = value.startDate!;
                //           var endDate = value.endDate ?? startDate;
                //           controller.fromDate.value = startDate;
                //           controller.toDate.value = endDate;
                //           controller.getViewDocUploadListByDate();
                //           controller.openFromDateToStartDatePicker = false;
                //           controller.update(['stock_Mangement_Date']);
                //         }
                //       },
                //       onCancel: () {
                //         controller.openFromDateToStartDatePicker = false;
                //         controller.update(['stock_Mangement_Date']);
                //       },
                //     ),
                //   ),
              ],
            ),
          ),
        );
      },
    );
  }
}
