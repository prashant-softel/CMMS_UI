import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class DateRangePickerWidget extends StatefulWidget {
  final VoidCallback? function;

  const DateRangePickerWidget({super.key, this.function});
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  List<DateTime?> _selectedDateRange = [
    DateTime.now().subtract(Duration(days: 6)),
    DateTime.now(),
  ];

  void _showDateRangePicker() async {
    List<DateTime?>? picked = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.range,
        selectedDayHighlightColor: ColorValues.primaryColor,
        selectedRangeHighlightColor: ColorValues.primaryColor,
        weekdayLabelTextStyle: TextStyle(color: Colors.black),
        controlsTextStyle: TextStyle(color: Colors.black),
        dayTextStyle: TextStyle(color: Colors.black),
        selectedDayTextStyle: TextStyle(
          color: Colors.white,
        ),
        yearTextStyle: TextStyle(color: Colors.black),
      ),
      dialogSize: const Size(300, 400),
      value: _selectedDateRange,
      dialogBackgroundColor: Colors.white,
    );

    if (picked != null && picked.length == 2) {
      setState(() {
        _selectedDateRange = picked;
        widget.function!();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _showDateRangePicker,
            child: Text('Select Date Range'),
          ),
          SizedBox(height: 16),
          Text(
            _selectedDateRange[0] != null && _selectedDateRange[1] != null
                ? 'Selected range:\n${_selectedDateRange[0]!.toLocal()} - ${_selectedDateRange[1]!.toLocal()}'
                : 'No date range selected',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Date Range Picker')),
      body: Center(child: DateRangePickerWidget(
        function: () {
          printing();
        },
      )),
    ),
  ));
}

void printing() {
  print("helloworld");
}
