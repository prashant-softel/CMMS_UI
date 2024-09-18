import 'package:cmms/app/calendar_view/calendar_view_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get/get.dart';

class CalendarViewWeb extends GetView<CalendarViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeaderWidget(),
        elevation: 0.5,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 227, 224, 224),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        Get.offNamed(Routes.calendarViewDashbord);
                      },
                      child: Text(" / CALENDER", style: Styles.greyLight14),
                    ),
                    Text(" / CALENDER VIEW", style: Styles.greyLight14),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: SfCalendar(
                  view: CalendarView.month,
                  allowedViews: [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.workWeek,
                    CalendarView.month,
                    CalendarView.timelineMonth
                  ],
                  dataSource: MeetingDataSource(controller.getDataSource()),
                  todayHighlightColor: Colors.blue,
                  showDatePickerButton: true,
                  showNavigationArrow: true,
                  monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment,
                    showAgenda: true,
                  ),
                  onTap: (CalendarTapDetails details) {
                    print("Calendar tapped at date: ${details.date}");
                    if (details.appointments != null &&
                        details.appointments!.isNotEmpty) {
                      final Meeting meeting = details.appointments!.first;
                      print(
                          "Tapped on meeting: ${meeting.eventName} from ${meeting.from} to ${meeting.to}");
                    }
                  },
                  onViewChanged: (ViewChangedDetails details) {
                    print(
                        "View changed. Current visible dates: ${details.visibleDates}");
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// Class representing an individual meeting
class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
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
