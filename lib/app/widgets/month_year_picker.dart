import 'package:cmms/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class MonthPickerWidget extends StatefulWidget {
//   MonthPickerWidget({
//     this.selectionChanges,
//     this.controller,
//     this.maxDate,
//     this.minDate,
//     this.hideLast2Days = false,
//     this.cancelText,
//     this.initialSelectedRange,
//     this.selectionMode = DateRangePickerSelectionMode.single,
//     this.monthCellStyle,
//     this.onSubmit,
//     this.showActionButtons = true,
//   });

//   final Function(DateRangePickerSelectionChangedArgs)? selectionChanges;
//   final DateRangePickerController? controller;
//   final DateTime? maxDate;
//   final DateTime? minDate;
//   final bool? hideLast2Days;
//   final String? cancelText;
//   final PickerDateRange? initialSelectedRange;
//   final DateRangePickerSelectionMode selectionMode;
//   final dynamic monthCellStyle;
//   final bool showActionButtons;
//   final dynamic Function(Object?)? onSubmit;

//   @override
//   _MonthPickerWidgetState createState() => _MonthPickerWidgetState();
// }

// class _MonthPickerWidgetState extends State<MonthPickerWidget> {
//   DateTime? _minDate;
//   DateTime? _maxDate;

//   @override
//   void initState() {
//     super.initState();
//     _minDate = widget.minDate ?? DateTime(DateTime.now().year, 1, 1);
//     _maxDate = widget.maxDate ?? DateTime(DateTime.now().year, 12, 31);
//   }

//   void _updateDateRange(DateTime selectedDate) {
//     setState(() {
//       final year = selectedDate.year;
//       final month = selectedDate.month;
//       _minDate = DateTime(year, month, 1);
//       _maxDate = DateTime(year, month + 1, 0);
//     });
//   }

//   @override
//   Widget build(BuildContext context) => Container(
//         height: Dimens.twoHundredFifty,
//         width: Dimens.twoHundredFifty,
//         decoration: Styles.cardLikeDecoration,
//         alignment: Alignment.centerLeft,
//         child: SfDateRangePicker(
//           controller: widget.controller,
//           view: DateRangePickerView.month,
//           showNavigationArrow: true,
//           headerStyle: DateRangePickerHeaderStyle(
//             textAlign: TextAlign.center,
//             textStyle: Styles.blackBold16,
//           ),
//           minDate: _minDate,
//           maxDate: _maxDate,
//           selectionColor: ColorValues.primaryColor,
//           todayHighlightColor: ColorValues.primaryColor,
//           backgroundColor: ColorValues.whiteColor,
//           selectionMode: widget.selectionMode,
//           startRangeSelectionColor: ColorValues.primaryColor,
//           endRangeSelectionColor: ColorValues.primaryColor,
//           rangeSelectionColor: ColorValues.primaryColor,
//           rangeTextStyle: Styles.black14,
//           onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
//             if (args.value is PickerDateRange) {
//               final PickerDateRange range = args.value;
//               if (range.startDate != null && range.endDate != null) {
//                 final DateTime startDate = range.startDate!;
//                 final DateTime endDate = range.endDate!;
//                 if (startDate.month == endDate.month &&
//                     startDate.year == endDate.year) {
//                   _updateDateRange(startDate);
//                 } else {
//                   widget.controller!.selectedRange =
//                       PickerDateRange(startDate, startDate);
//                 }
//               }
//             } else if (args.value is DateTime) {
//               final DateTime selectedDate = args.value;
//               _updateDateRange(selectedDate);
//             }
//             if (widget.selectionChanges != null) {
//               widget.selectionChanges!(args);
//             }
//           },
//           initialSelectedRange: widget.initialSelectedRange,
//           showActionButtons: widget.showActionButtons,
//           onSubmit: (value) {
//             if (widget.onSubmit != null) {
//               if (value is PickerDateRange) {
//                 final PickerDateRange range = value;
//                 if (range.startDate != null) {
//                   _updateDateRange(range.startDate!);
//                   widget.onSubmit!(range);
//                 }
//               } else if (value is DateTime) {
//                 _updateDateRange(value);
//                 widget.onSubmit!(value);
//               }
//             }
//           },
//           onCancel: () {
//             Get.back();
//           },
//         ),
//       );
// }


class MonthPickerWidget extends StatefulWidget {
  MonthPickerWidget({
    this.selectionChanges,
    this.controller,
    this.maxDate,
    this.minDate,
    this.hideLast2Days = false,
    this.cancelText,
    this.initialSelectedRange,
    this.selectionMode = DateRangePickerSelectionMode.range,
    this.monthCellStyle,
    this.onSubmit,
    this.showActionButtons = true,
  });

  final Function(DateRangePickerSelectionChangedArgs)? selectionChanges;
  final DateRangePickerController? controller;
  final DateTime? maxDate;
  final DateTime? minDate;
  final bool? hideLast2Days;
  final String? cancelText;
  final PickerDateRange? initialSelectedRange;
  final DateRangePickerSelectionMode selectionMode;
  final dynamic monthCellStyle;
  final bool showActionButtons;
  final dynamic Function(Object?)? onSubmit;

  @override
  _MonthPickerWidgetState createState() => _MonthPickerWidgetState();
}

class _MonthPickerWidgetState extends State<MonthPickerWidget> {
  DateTime? _minDate;
  DateTime? _maxDate;

  @override
  void initState() {
    super.initState();
    _minDate = widget.minDate ?? DateTime(DateTime.now().year, 1, 1);
    _maxDate = widget.maxDate ?? DateTime(DateTime.now().year, 12, 31);
  }

  void _updateDateRange(PickerDateRange range) {
    setState(() {
      _minDate = range.startDate;
      _maxDate = range.endDate;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
    height: Dimens.twoHundredFifty,
    width: Dimens.twoHundredFifty,
    decoration: Styles.cardLikeDecoration,
    alignment: Alignment.centerLeft,
    child: SfDateRangePicker(
      controller: widget.controller,
      view: DateRangePickerView.month,
      showNavigationArrow: true,
      headerStyle: DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: Styles.blackBold16,
      ),
      minDate: _minDate,
      maxDate: _maxDate,
      selectionColor: ColorValues.primaryColor,
      todayHighlightColor: ColorValues.primaryColor,
      backgroundColor: ColorValues.whiteColor,
      selectionMode: widget.selectionMode,
      startRangeSelectionColor: ColorValues.primaryColor,
      endRangeSelectionColor: ColorValues.primaryColor,
      rangeSelectionColor: ColorValues.primaryColor,
      rangeTextStyle: Styles.black14,
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
        if (args.value is PickerDateRange) {
          final PickerDateRange range = args.value!;
          _updateDateRange(range);
        }
        if (widget.selectionChanges != null) {
          widget.selectionChanges!(args);
        }
      },
      initialSelectedRange: widget.initialSelectedRange,
      showActionButtons: widget.showActionButtons,
      onSubmit: (value) {
        if (widget.onSubmit != null) {
          if (value is PickerDateRange) {
            final PickerDateRange range = value;
            _updateDateRange(range);
            widget.onSubmit!(range);
          }
        }
      },
      onCancel: () {
        Get.back();
      },
    ),
  );
}
