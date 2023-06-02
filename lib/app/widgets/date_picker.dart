import 'package:cmms/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerWidget extends StatelessWidget {
  DatePickerWidget(
      {this.selectionChanges,
      this.controller,
      this.maxDate,
      this.minDate,
      this.hideLast2Days = false});
  final Function(DateRangePickerSelectionChangedArgs)? selectionChanges;
  final DateRangePickerController? controller;
  final DateTime? maxDate;
  final DateTime? minDate;
  final bool? hideLast2Days;

  @override
  Widget build(BuildContext context) => Container(
        height: Dimens.twoHundredFifty,
        width: Dimens.twoHundredFifty,
        decoration: Styles.cardLikeDecoration,
        alignment: Alignment.centerLeft,
        child: SfDateRangePicker(
          controller: controller,
          view: DateRangePickerView.month,
          showNavigationArrow: true,
          headerStyle: DateRangePickerHeaderStyle(
              textAlign: TextAlign.center, textStyle: Styles.blackBold16),
          selectionColor: ColorValues.primaryColor,
          todayHighlightColor: ColorValues.primaryColor,
          backgroundColor: ColorValues.whiteColor,
          selectionMode: DateRangePickerSelectionMode.single,
          startRangeSelectionColor: ColorValues.primaryColor,
          endRangeSelectionColor: ColorValues.primaryColor,
          rangeSelectionColor: ColorValues.primaryColor,
          rangeTextStyle: Styles.black14,
          onSelectionChanged: selectionChanges,
          maxDate: maxDate,
          minDate: minDate,
        ),
      );
}
