import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SfCalendar Event Tap Example')),
        body: CalendarScreen(),
      ),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String selectedEventId = '';
  String selectedWoDescription = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
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
            MeetingDataSource(getDataSource()), // Provide your data source here
        todayHighlightColor: Colors.blue,
        showDatePickerButton: true,
        showNavigationArrow: true,
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
        ),
        onTap: (CalendarTapDetails details) {
          if (details.targetElement == CalendarElement.appointment &&
              details.appointments != null) {
            final Meeting tappedEvent = details.appointments!.first as Meeting;

            setState(() {
              selectedEventId = tappedEvent
                  .eventName; // Store the event name (or ID) when tapped
              selectedWoDescription =
                  tappedEvent.description; // Store the description of the event
            });

            // Show a toast message with the event name
            Fluttertoast.showToast(
                msg: 'Event: ${tappedEvent.eventName}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);

            // Print the details of the selected event
            print(
                "Tapped on event: ${tappedEvent.eventName}, Description: ${tappedEvent.description}, From: ${tappedEvent.from}, To: ${tappedEvent.to}");
          } else {
            Fluttertoast.showToast(
                msg: 'No event selected',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
      ),
    );
  }

  // Sample data source
  List<Meeting> getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    meetings.add(Meeting(
      eventName: 'Conference',
      description: 'Annual conference',
      from: startTime,
      to: endTime,
      background: Colors.green,
      isAllDay: false,
    ));

    meetings.add(Meeting(
      eventName: 'Team Meeting',
      description: 'Monthly team sync-up',
      from: startTime.add(const Duration(days: 1)),
      to: endTime.add(const Duration(days: 1)),
      background: Colors.blue,
      isAllDay: false,
    ));

    return meetings;
  }
}

// Define the meeting model
class Meeting {
  Meeting({
    required this.eventName,
    required this.description,
    required this.from,
    required this.to,
    required this.background,
    required this.isAllDay,
  });

  String eventName;
  String description;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

// Define the data source for the calendar
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
