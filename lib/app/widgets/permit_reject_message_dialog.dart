import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class PermitMessageRejectDialog extends GetView {
  String? createPermitData;
  String? data;
  String? ptwStatus;
  int? jobId;
  int? vegexe;
  int? type;
  int? vegid;

  PermitMessageRejectDialog(
      {super.key,
      this.createPermitData,
      this.data,
      this.ptwStatus,
      this.jobId,
      this.type,
      this.vegid,
      this.vegexe});
  final ViewPermitController controller = Get.find();

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
          ptwStatus == '133' ? 'Permit Extend Reject' : 'Permit Reject',
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
                  Text('${data}',
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.center),
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
          Dimens.boxWidth10,
          Center(
            child: ElevatedButton(
              style: Styles.darkBlueElevatedButtonStyle,
              onPressed: () {
                type == 2
                    ? Get.offAllNamed(Routes.pmTaskView)
                    : type == 1
                        ? Get.offAllNamed(Routes.jobDetails)
                        : type == 3
                            ? Get.offAllNamed(Routes.viewAuditTask)
                            : type == 4
                                ? Get.offAllNamed(
                                    Routes.addModuleCleaningExecutionContentWeb)
                                : type == 5
                                    ? Get.offAllNamed(Routes.vegExecutionScreen,
                                        arguments: {
                                            "vegexe": vegexe,
                                            "vegid": vegid
                                          })
                                    : Get.offAllNamed(Routes.newPermitList);
              },
              child: const Text('Ok'),
            ),
          ),
        ],
      );
    }));
  }
}
