import 'package:cmms/app/calibration_View/calibration_View_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class CalibrationDialog extends GetView {
  String? data;
  int? calbrationId;
  int? type;

  CalibrationDialog({super.key, this.data, this.calbrationId, this.type});
  final CalibrationViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          // type == 1 ?
          'successfully....', //: '',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 50,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Center(
                    child: Text('${data}',
                        style: TextStyle(color: Colors.green),
                        textAlign: TextAlign.center),
                  ),
                  // SizedBox(height: 20,),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //         width: 15,
                  //       ),
                  //       ElevatedButton(
                  //         style: Styles.greenElevatedButtonStyle,
                  //         onPressed: () => Get.offAllNamed(Routes.newPermit),
                  //         child: const Text('Permit List'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       ElevatedButton(
                  //         style: Styles.blueElevatedButtonStyle,
                  //         onPressed: () => Get.offAndToNamed(Routes.newPermitList),
                  //         child: const Text('View This Permit'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       // ElevatedButton(
                  //       //   style: Styles.redElevatedButtonStyle,
                  //       //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                  //       //   child: const Text('Add New Job'),
                  //       // ),
                  //     ]),
                ]),
          );
        }),
        actions: [
          // Dimens.boxWidth10,
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                ElevatedButton(
                  style: Styles.greenElevatedButtonStyle,
                  onPressed: () {
                    // _controller.getIncidentReportList(
                    //     _controller.facilityId,
                    //     _controller.formattedTodate,
                    //     _controller.formattedFromdate,
                    //     false);
                    //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                    Get.offAllNamed(
                        '${Routes.calibrationViewScreen}/$calbrationId');

                    Get.back();
                  },
                  child: const Text('View Calibration'),
                ),
                // Dimens.boxWidth10,
                SizedBox(width: 10),
                ElevatedButton(
                  style: Styles.yellowElevatedButtonStyle,
                  onPressed: () {
                    // _controller.getIncidentReportList(
                    //     _controller.facilityId,
                    //     _controller.formattedTodate,
                    //     _controller.formattedFromdate,
                    //     false);
                    //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                    Get.offAllNamed(
                      Routes.calibrationList,
                    );
                    Get.back();
                  },
                  child: const Text('Calibration List'),
                ),
                Spacer()
              ],
            ),
          ),
        ],
      );
    }));
  }
}
