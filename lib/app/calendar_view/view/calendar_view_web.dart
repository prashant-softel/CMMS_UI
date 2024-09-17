import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart'; // Syncfusion Calendar

class CalendarViewWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CalendarViewWeb build method called.");
    return Scaffold(
      appBar: AppBar(
        title: HeaderWidget(),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
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
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                  CalendarView.timelineDay,
                  CalendarView.timelineWeek,
                  CalendarView.timelineWorkWeek,
                  CalendarView.timelineMonth
                ],
                dataSource: MeetingDataSource(_getDataSource()),
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
      ),
    );
  }

  List<Meeting> _getDataSource() {
    print("Creating data source for calendar.");
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();

    meetings.addAll([
      Meeting('Consulting', today.add(Duration(days: -7)),
          today.add(Duration(days: -7, hours: 2)), Colors.purple, false),
      Meeting('Plan', today.add(Duration(days: -7)),
          today.add(Duration(days: -7, hours: 1)), Colors.pink, false),
      Meeting('Consulting', today.add(Duration(days: -6)),
          today.add(Duration(days: -6, hours: 2)), Colors.orange, false),
      Meeting('Support', today.add(Duration(days: -5)),
          today.add(Duration(days: -5, hours: 2)), Colors.red, false),
      Meeting('Development', today.add(Duration(days: -4)),
          today.add(Duration(days: -4, hours: 2)), Colors.green, false),
      Meeting('General', today.add(Duration(days: -3)),
          today.add(Duration(days: -3, hours: 2)), Colors.blue, false),
      Meeting('Scrum', today.add(Duration(days: 2)),
          today.add(Duration(days: 2, hours: 1)), Colors.cyan, false),
      Meeting('Project Plan', today.add(Duration(days: 4)),
          today.add(Duration(days: 4, hours: 2)), Colors.redAccent, false),
      Meeting('General', today.add(Duration(days: 5)),
          today.add(Duration(days: 5, hours: 1)), Colors.greenAccent, false),
      Meeting('Development', today.add(Duration(days: 8)),
          today.add(Duration(days: 8, hours: 2)), Colors.orangeAccent, false),
      Meeting('Plan', today.add(Duration(days: 10)),
          today.add(Duration(days: 10, hours: 1)), Colors.lightBlue, false),
      Meeting('Support', today.add(Duration(days: 12)),
          today.add(Duration(days: 12, hours: 2)), Colors.purpleAccent, false),
      Meeting('Consulting', today.add(Duration(days: 15)),
          today.add(Duration(days: 15, hours: 1)), Colors.green, false),
      Meeting('Scrum', today.add(Duration(days: 18)),
          today.add(Duration(days: 18, hours: 2)), Colors.blueAccent, false),
      Meeting('Project Plan', today.add(Duration(days: 20)),
          today.add(Duration(days: 20, hours: 2)), Colors.deepOrange, false),
      Meeting('Development', today.add(Duration(days: 25)),
          today.add(Duration(days: 25, hours: 1)), Colors.pinkAccent, false),
    ]);

    return meetings;
  }
}

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

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay) {
    print("Meeting created: $eventName from $from to $to, All day: $isAllDay");
  }

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
