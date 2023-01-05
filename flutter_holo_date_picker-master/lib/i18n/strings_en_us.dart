part of 'date_picker_i18n.dart';

/// English (EN) United States
class _StringsEnUs extends _StringsI18n {
  const _StringsEnUs();

  @override
  String getCancelText() => 'Cancel';

  @override
  String getDoneText() => 'Done';

  @override
  List<String> getMonths() => [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ];

  @override
  List<String> getWeeksFull() => [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ];

  @override
  List<String> getWeeksShort() => [
        'Mon',
        'Tue',
        'Wed',
        'Thur',
        'Fri',
        'Sat',
        'Sun',
      ];
}
