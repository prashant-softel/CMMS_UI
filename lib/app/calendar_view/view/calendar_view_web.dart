import 'package:cmms/app/calendar_view/calendar_view_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/widgets/dash_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'dart:html' as html;

class CalendarViewWeb extends StatefulWidget {
  CalendarViewWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarViewWeb> createState() => _CalendarViewWebState();
}

class _CalendarViewWebState extends State<CalendarViewWeb>
    with SingleTickerProviderStateMixin {
  var repository = Get.find<Repository>();
  String? selectedEventId;
  String? selectedWoDescription;
  int? selectedPlanID;

  @override
  void initState() {
    super.initState();
    _disableRightClickContextMenu(); // Disable the default right-click menu
  }

  void _disableRightClickContextMenu() {
    html.document.onContextMenu.listen((event) => event.preventDefault());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarViewController>(
      id: 'dashboard',
      builder: (controller) {
        return Stack(
          children: [
            Scaffold(
              body: Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
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
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50,
                                  bottom: 5), // Reduced top and bottom padding
                              child: Row(
                                children: [
                                  Text('Select Plant',
                                      style: Styles.black13W400),
                                  // Dimens.boxWidth10,
                                  SizedBox(width: 10),
                                  Obx(
                                    () => SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DashCustomMultiSelectDialogField(
                                          title: 'Select Facility',
                                          initialValue: controller
                                              .homecontroller.facilityList
                                              .where((facility) =>
                                                  facility != null)
                                              .map((facility) => facility!.id)
                                              .toList(),
                                          items: controller
                                              .homecontroller.facilityList
                                              .where((facility) =>
                                                  facility != null)
                                              .map(
                                                (facility) => MultiSelectItem(
                                                  facility!.id,
                                                  facility.name ?? '',
                                                ),
                                              )
                                              .toList(),
                                          onConfirm: (selectedOptionsList) {
                                            controller.selectedMultiFacility(
                                                selectedOptionsList
                                                    .cast<int>());
                                            print(
                                                'Equipment list ${controller.homecontroller.selectedFacilityIdList}');
                                          },
                                          // titleTextStyle: TextStyle(
                                          //     fontSize:
                                          //         12), // Reduced font size
                                          // chipTextStyle: TextStyle(
                                          //     fontSize:
                                          //         12), // Reduced font size
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                children: [
                                  Text('Select Module',
                                      style: Styles.black13W400),
                                  // Dimens.boxWidth10,
                                  SizedBox(width: 10),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DashCustomMultiSelectDialogField(
                                      title: 'Select Module',
                                      // buttonText: 'Select Module',
                                      initialValue: (controller
                                              .selectedModuleIdList.isNotEmpty)
                                          ? controller.selectedModuleIdList
                                          : [],
                                      // initialValue: controller.moduleList,
                                      items: controller.moduleList
                                              ?.map(
                                                (module) => MultiSelectItem(
                                                  module!.id,
                                                  module.moduleName ??
                                                      'Unknown',
                                                ),
                                              )
                                              ?.toList() ??
                                          [],
                                      onConfirm: (selectedOptionsList) {
                                        controller.selectedMultiModule(
                                            selectedOptionsList.cast<int>());
                                        print(
                                            'Selected Modules: $selectedOptionsList');
                                        print(
                                            'Updated Selected Modules in Controller: ${controller.selectedModuleList}');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Text('Date Range',
                                          style: Styles.black13W400),
                                      // Dimens.boxWidth10,
                                      SizedBox(width: 10),
                                      CustomTextFieldForStock(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          numberTextField: true,
                                          onTap: () {
                                            controller
                                                    .openFromDateToStartDatePicker =
                                                !controller
                                                    .openFromDateToStartDatePicker;
                                            controller.update(['dashboard']);
                                          },
                                          hintText:
                                              '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                          hintStyle: Styles.black13W400),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Dimens.boxWidth10,

                            if (Responsive.isDesktop(context))
                              Icon(Icons.notifications_active,
                                  color: ColorValues.greyLightColor),
                            InkWell(
                              onTap: () {
                                Get.dialog(
                                  Stack(children: [
                                    Positioned(
                                      right: 1,
                                      top: 70,
                                      child: Container(
                                        width: 200,
                                        child: AlertDialog(
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          contentPadding: EdgeInsets.all(20),
                                          backgroundColor:
                                              ColorValues.appDarkBlueColor,
                                          content: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  // controller.clearStoreData();
                                                  Get.toNamed(Routes.profile,
                                                      arguments: {
                                                        'userId':
                                                            varUserAccessModel
                                                                .value.user_id,
                                                      });
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.person,
                                                        color:
                                                            Color(0xffD2D0D0)),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      "Profile",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffD2D0D0),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(color: Color(0xffD2D0D0)),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(Routes.setting);
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.settings,
                                                        color:
                                                            Color(0xffD2D0D0)),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      "Settings",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffD2D0D0),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(color: Color(0xffD2D0D0)),
                                              InkWell(
                                                onTap: () {
                                                  _isDeleteDialog(repository);
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.logout,
                                                        color:
                                                            Color(0xffD2D0D0)),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      "Log Out",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffD2D0D0),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                );
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                color: ColorValues.blueMediumColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            Color.fromARGB(255, 206, 200, 200),
                                        child: Icon(Icons.person,
                                            color: ColorValues.blueMediumColor),
                                      ), // icon
                                      if (Responsive.isDesktop(context))
                                        SizedBox(
                                            width:
                                                5), // space between icon and text
                                      if (Responsive.isDesktop(context))
                                        Text(
                                          "${varUserAccessModel.value.user_name}",
                                          style: TextStyle(
                                            color: Colors.black, // text color
                                            fontSize: 12, // text size
                                            fontWeight:
                                                FontWeight.w500, // text weight
                                          ),
                                        ),
                                      Icon(Icons.keyboard_arrow_down_outlined,
                                          color: ColorValues.blackColor),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Dimens.boxWidth10,
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
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
                            Text(" / CALENDER VIEW", style: Styles.greyLight14),
                            Spacer(),
                            MouseRegion(
                              onEnter: (_) => controller.isHovered.value = true,
                              onExit: (_) => controller.isHovered.value = false,
                              child: Stack(
                                children: [
                                  Icon(Icons.info_outline),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: GestureDetector(
                          onSecondaryTapDown: (details) {
                            // Use the exact position of the right-click to show the context menu
                            _showContextMenu(
                                details.globalPosition, controller);
                          },
                          child: SfCalendar(
                            view: CalendarView.month,
                            allowedViews: [
                              CalendarView.day,
                              CalendarView.week,
                              CalendarView.workWeek,
                              CalendarView.month,
                              CalendarView.timelineMonth,
                            ],
                            dataSource:
                                MeetingDataSource(controller.getDataSource()),
                            todayHighlightColor: Colors.blue,
                            showDatePickerButton: true,
                            showNavigationArrow: true,
                            monthViewSettings: MonthViewSettings(
                              appointmentDisplayMode:
                                  MonthAppointmentDisplayMode.appointment,
                              showAgenda: true,
                            ),
                            onTap: (CalendarTapDetails details) {
                              if (details.appointments != null &&
                                  details.appointments!.isNotEmpty) {
                                final Meeting meeting =
                                    details.appointments!.first;
                                selectedEventId = meeting
                                    .eventName; // Assuming eventName is the ID
                                selectedWoDescription = meeting
                                    .woDescription; // Get the description
                                selectedPlanID = meeting.planId;
                                // Show toast with wo_number and wo_description
                                // Fluttertoast.showToast(
                                //   msg:
                                //       'WO Number: ${meeting.woNumber}, Description: ${meeting.woDescription}',
                                //   toastLength: Toast.LENGTH_SHORT,
                                //   gravity: ToastGravity.BOTTOM,
                                //   timeInSecForIosWeb: 3,
                                //   backgroundColor: Colors.black,
                                //   textColor: Colors.white,
                                //   fontSize: 16.0,
                                // );

                                _openDuplicateTab(
                                    selectedEventId: meeting.woNumber,
                                    controller: controller,
                                    selectedPlanID: selectedPlanID);
                                // Log the event details for debugging purposes
                                print(
                                    "Tapped on meeting: ${meeting.eventName}, Description: ${meeting.woDescription}, WO Number: ${meeting.woNumber}, From: ${meeting.from}, To: ${meeting.to}");
                              }
                            },
                            onViewChanged: (ViewChangedDetails details) {
                              print(
                                  "View changed. Current visible dates: ${details.visibleDates}");
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
            if (controller.openFromDateToStartDatePicker)
              Positioned(
                right: 270,
                top: 55,
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
                    PickerDateRange? data = value as PickerDateRange;
                    var pickUpDate = DateTime.parse(data.startDate.toString());
                    controller.fromDate.value = pickUpDate;
                    var dropDate = DateTime.parse(data.endDate.toString());
                    dropDate != null
                        ? controller.toDate.value = dropDate
                        : controller.toDate.value = pickUpDate;
                    controller.getDashBordListByDate();
                    controller.openFromDateToStartDatePicker = false;
                    controller.update(['dashboard']);
                  },
                  onCancel: () {
                    controller.openFromDateToStartDatePicker = false;
                    controller.update(['dashboard']);
                  },
                ),
              ),
            Obx(() => controller.isHovered.value
                ? Positioned(
                    top: 80,
                    right: 50,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: ColorValues.appGreenColor,
                              ),
                              SizedBox(height: 5),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: ColorValues.appDarkBlueColor,
                              ),
                              SizedBox(height: 5),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor:
                                    Color.fromARGB(255, 133, 97, 163),
                              ),
                              SizedBox(height: 5),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor:
                                    Color.fromARGB(255, 78, 126, 129),
                              )
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Breakdown Maintenance"),
                              SizedBox(height: 3),
                              Text("Preventive Maintenance"),
                              SizedBox(height: 3),
                              Text("Module Cleaning"),
                              SizedBox(height: 3),
                              Text("Incident Report")
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink()),
          ],
        );
      },
    );
  }

  void _showContextMenu(Offset position, CalendarViewController controller) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          position.dx, position.dy, position.dx, position.dy),
      items: [
        PopupMenuItem(
          value: 'open',
          child: Text('Open in New Tab'),
        ),
      ],
    ).then((value) {
      if (value == 'open') {
        // _openDuplicateTab();
      }
    });
  }

  void _openDuplicateTab(
      {String? selectedEventId,
      required CalendarViewController controller,
      int? selectedPlanID}) {
    // Pass the event details in the query parameters to open in new tab

    String Id =
        selectedEventId ?? ""; //controller.allItems[index]?.wo_number ?? "";
    // String planId = controller.allItems[index]?.plan_id.toString() ?? "";
    String prefix = Id.replaceAll(RegExp(r'\d+$'), '');

    String jobId = Id.substring(Id.indexOf("BM") + 2);
    String taskId = Id.substring(Id.indexOf("PMT") + 3);
    String mcId = Id.substring(Id.indexOf("MC") + 2);

    final url = prefix == 'BM'
        ? '/#${Routes.jobDetails}/$jobId'
        : (prefix == 'PMT')
            ? '/#${Routes.pmTaskView}/$taskId'
            :
            // :
            prefix == 'MC'
                ? '/#${Routes.addModuleCleaningExecutionContentWeb}/$mcId/$selectedPlanID'
                : '/#${Routes.login}';
    html.window.open(url, '_blank');
  }
}

// Class representing an individual meeting
// Class representing an individual meeting
class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.woNumber, this.woDescription, this.planId);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String woNumber; // Add the work order number
  String woDescription;
  int planId; // Add the work order description
}

// DataSource class for SfCalendar
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    print("MeetingDataSource initialized with ${source.length} appointments.");
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    print("Getting start time for appointment index: $index");
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    print("Getting end time for appointment index: $index");
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    print("Getting subject for appointment index: $index");
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    print("Getting color for appointment index: $index");
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    print("Checking if appointment index $index is all day.");
    return appointments![index].isAllDay;
  }
}

_isDeleteDialog(Repository repository) {
  Get.dialog(
    AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.logout_outlined, size: 35, color: ColorValues.redColor),
        SizedBox(
          height: 10,
        ),
        Text(
          'Are you sure you want to logout?',
          style: Styles.blackBold14w500,
        ),
      ]),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('NO'),
            ),
            TextButton(
              onPressed: () {
                repository.deleteAllSecuredValues();
                Get.offAllNamed(Routes.login);
              },
              child: Text('YES'),
            ),
          ],
        )
      ],
    ),
  );
}
