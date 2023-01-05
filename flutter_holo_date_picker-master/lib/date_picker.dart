import 'package:cmms/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'date_picker_constants.dart';
import 'date_picker_theme.dart';
import 'i18n/date_picker_i18n.dart';
import 'widget/date_picker_widget.dart';

enum DateTimePickerMode {
  /// Display DatePicker
  date,

  /// Display DateTimePicker
  datetime,
}

class DatePicker {
  /// Gets the right [DateTimePickerLocale] by a language string
  ///
  /// languageCode: [languageCode] Locale's String language code
  static DateTimePickerLocale localeFromString(String languageCode) {
    switch (languageCode) {
      case 'zh':
        return DateTimePickerLocale.zh_cn;

      case 'pt':
        return DateTimePickerLocale.pt_br;

      case 'es':
        return DateTimePickerLocale.es;

      case 'ro':
        return DateTimePickerLocale.ro;

      case 'bn':
        return DateTimePickerLocale.bn;

      case 'ar':
        return DateTimePickerLocale.ar;

      case 'jp':
        return DateTimePickerLocale.jp;

      case 'ru':
        return DateTimePickerLocale.ru;

      case 'de':
        return DateTimePickerLocale.de;

      case 'ko':
        return DateTimePickerLocale.ko;

      case 'it':
        return DateTimePickerLocale.it;

      case 'hu':
        return DateTimePickerLocale.hu;

      case 'he':
        return DateTimePickerLocale.he;

      case 'id':
        return DateTimePickerLocale.id;

      case 'tr':
        return DateTimePickerLocale.tr;

      case 'nb':
        return DateTimePickerLocale.no_nb;

      case 'nn':
        return DateTimePickerLocale.no_nn;

      default:
        return DateTimePickerLocale.en_us;
    }
  }

  /// Display date picker in bottom sheet.
  ///
  /// context: [BuildContext]
  /// firstDate: [DateTime] minimum date time
  /// lastDate: [DateTime] maximum date time
  /// initialDateTime: [DateTime] initial date time for selected
  /// dateFormat: [String] date format pattern
  /// locale: [DateTimePickerLocale] internationalization
  /// backgroundColor: [Color] background color of the dialog
  /// itemTextStyle: [TextStyle] item TextStyle of the picker
  /// titleText: [String] text of the dialog's title
  /// confirmText: [String] text of the dialog's confirm button
  /// cancelText: [String] text of the dialog's  cancel button
  static Future<DateTime?> showSimpleDatePicker(
    BuildContext context, {
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? initialDate,
    String? dateFormat,
    DateTimePickerLocale locale = DATETIME_PICKER_LOCALE_DEFAULT,
    DateTimePickerMode pickerMode = DateTimePickerMode.date,
    Color? backgroundColor,
    Color? textColor,
    TextStyle? itemTextStyle,
    String? titleText,
    String? confirmText,
    String? cancelText,
    bool looping = false,
    bool reverse = false,
  }) {
    var _selectedDate = initialDate;
    final listButtonActions = <Widget>[
      CustomButton(
        margin: Dimens.edgeInsets8,
        // width: Get.width,
        title: 'confirm'.tr,
        onPress: () {
          Navigator.pop(context, _selectedDate);
        },
      ),
      // TextButton(
      //   style: TextButton.styleFrom(primary: textColor),
      //   child: Text(confirmText ?? 'OK'),
      //   onPressed: () {
      //     Navigator.pop(context, _selectedDate);
      //   },
      // ),
    ];

    // handle the range of datetime
    // ignore: prefer_conditional_assignment
    if (firstDate == null) {
      firstDate = DateTime.parse(DATE_PICKER_MIN_DATETIME);
    }
    // ignore: prefer_conditional_assignment
    if (lastDate == null) {
      lastDate = DateTime.parse(DATE_PICKER_MAX_DATETIME);
    }

    // handle initial DateTime
    // ignore: prefer_conditional_assignment
    if (initialDate == null) {
      initialDate = DateTime.now();
    }

    // ignore: prefer_conditional_assignment
    if (backgroundColor == null)
      // ignore: curly_braces_in_flow_control_structures
      backgroundColor = DateTimePickerTheme.Default.backgroundColor;
//    if (itemTextStyle == null)
//      itemTextStyle = DateTimePickerTheme.Default.itemTextStyle;

    // ignore: prefer_conditional_assignment
    if (textColor == null)
      // ignore: curly_braces_in_flow_control_structures
      textColor = DateTimePickerTheme.Default.itemTextStyle.color;

    var datePickerDialog = AlertDialog(
      title: Row(
        children: [
          Text(
            titleText ?? 'Select Date',
            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          )
        ],
      ),
      // contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: SizedBox(
        width: 300,
        child: DatePickerWidget(
          firstDate: firstDate,
          lastDate: lastDate,
          initialDate: initialDate,
          dateFormat: dateFormat,
          locale: locale,
          pickerTheme: DateTimePickerTheme(
            backgroundColor: backgroundColor,
            itemTextStyle: itemTextStyle ?? TextStyle(color: textColor),
          ),
          onChange: (DateTime date, list) {
            if (kDebugMode) {
              print(date);
            }
            _selectedDate = date;
          },
          looping: looping,
        ),
      ),
      actions:
          reverse ? listButtonActions.reversed.toList() : listButtonActions,
    );
    return showDialog(
        useRootNavigator: false,
        context: context,
        builder: (context) => datePickerDialog);
  }
}

class _DatePickerRoute<T> extends PopupRoute<T> {
  _DatePickerRoute({
    this.minDateTime,
    this.maxDateTime,
    this.initialDateTime,
    this.dateFormat,
    this.locale,
    this.pickerMode,
    this.pickerTheme,
    this.onCancel,
    this.onChange,
    this.onConfirm,
    this.theme,
    this.barrierLabel,
    RouteSettings? settings,
  }) : super(settings: settings);

  final DateTime? minDateTime, maxDateTime, initialDateTime;
  final String? dateFormat;
  final DateTimePickerLocale? locale;
  final DateTimePickerMode? pickerMode;
  final DateTimePickerTheme? pickerTheme;
  final VoidCallback? onCancel;
  final DateValueCallback? onChange;
  final DateValueCallback? onConfirm;

  final ThemeData? theme;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    var height = pickerTheme!.pickerHeight;
    if (pickerTheme!.title != null || pickerTheme!.showTitle) {
      height += pickerTheme!.titleHeight;
    }

    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _DatePickerComponent(route: this, pickerHeight: height),
    );

    if (theme != null) {
      bottomSheet = Theme(data: theme!, child: bottomSheet);
    }
    return bottomSheet;
  }
}

class _DatePickerComponent extends StatelessWidget {
  _DatePickerComponent({required this.route, required double pickerHeight})
      : _pickerHeight = pickerHeight;

  final _DatePickerRoute route;
  final double _pickerHeight;

  @override
  Widget build(BuildContext context) {
    Widget pickerWidget = DatePickerWidget(
      firstDate: route.minDateTime,
      lastDate: route.maxDateTime,
      initialDate: route.initialDateTime,
      dateFormat: route.dateFormat,
      locale: route.locale,
      pickerTheme: route.pickerTheme,
      onCancel: route.onCancel,
      onChange: route.onChange,
      onConfirm: route.onConfirm,
    );
    return GestureDetector(
      child: AnimatedBuilder(
        animation: route.animation!,
        builder: (BuildContext context, Widget? child) => ClipRect(
          child: CustomSingleChildLayout(
            delegate: _BottomPickerLayout(route.animation!.value,
                contentHeight: _pickerHeight),
            child: pickerWidget,
          ),
        ),
      ),
    );
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(this.progress, {this.contentHeight});

  final double progress;
  final double? contentHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      BoxConstraints(
        minWidth: constraints.maxWidth,
        maxWidth: constraints.maxWidth,
        minHeight: 0.0,
        maxHeight: contentHeight!,
      );

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    var height = size.height - childSize.height * progress;
    return Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) =>
      progress != oldDelegate.progress;
}
