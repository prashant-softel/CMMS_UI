import 'package:cmms/app/cumulative_report/cumulative_report_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CumulativeReportContentWeb extends StatefulWidget {
  CumulativeReportContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CumulativeReportContentWeb> createState() =>
      _CumulativeReportContentWebState();
}

class _CumulativeReportContentWebState
    extends State<CumulativeReportContentWeb> {
  @override
  Widget build(BuildContext context) {
    // return GetBuilder<CumulativeReportController>(
    //     id: 'stock_Mangement_Date',
    //     builder: (controller) {
    //       return SelectionArea(
    //         child:
    return Column(children: [
      HeaderWidget(),
    ]);
    // );
    // });
  }
}
