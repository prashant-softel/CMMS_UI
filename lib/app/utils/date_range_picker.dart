import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/color_values.dart';

class DateRangePicker extends StatefulWidget {
  DateRangePicker({
    Key? key,
    this.callback,
  }) : super(key: key);
  final Function? callback;

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  late DateTime startOfWeek;
  late DateTime endOfWeek;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    startOfWeek = startDate(selectedDate);
    endOfWeek = endDate(selectedDate);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: GestureDetector(
              onTap: _selectDate,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(DateFormat('MMM')
                            .format(DateTime(0, startOfWeek.month)) +
                        ' ' +
                        '${startOfWeek.day}'),
                  ),
                  const Text('-'),
                  Text(DateFormat('MMM').format(DateTime(0, endOfWeek.month)) +
                      ' ' +
                      '${endOfWeek.day}' +
                      ', ' +
                      ' ' +
                      '${endOfWeek.year} '),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorValues.blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  startDate(DateTime date) {
    return getDate(date.subtract(Duration(days: date.weekday - 1)));
  }

  endDate(DateTime date) {
    return getDate(
        date.add(Duration(days: DateTime.daysPerWeek - date.weekday)));
  }

  DateTime firstDate(selectedDate) {
    var weekStartDate = startDate(selectedDate);
    DateTime _firstSelectableDate = getDate(
      DateTime(weekStartDate.year, weekStartDate.month, weekStartDate.day - 7),
    );
    return _firstSelectableDate;
  }

  Future _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate(DateTime.now()),
      lastDate: DateTime(2201),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 24.0),
              bodyMedium: TextStyle(fontSize: 24.0),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorValues.blueColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
