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
          selectionColor: ColorsValue.primaryColor,
          todayHighlightColor: ColorsValue.primaryColor,
          backgroundColor: ColorsValue.whiteColor,
          selectionMode: DateRangePickerSelectionMode.single,
          startRangeSelectionColor: ColorsValue.primaryColor,
          endRangeSelectionColor: ColorsValue.primaryColor,
          rangeSelectionColor: ColorsValue.primaryColor,
          rangeTextStyle: Styles.textDark14,
          onSelectionChanged: selectionChanges,
          maxDate: maxDate,
          minDate: minDate,
        ),
      );
}
