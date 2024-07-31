import 'package:cmms/app/app.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';

class MrsApprovalSuccessDialog extends GetView {
  String? data;
  List<dynamic>? mrsId;
  int? type;

  MrsApprovalSuccessDialog({super.key, this.data, this.mrsId, this.type});
  final MrsApproveController controller = Get.find();

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
          '$data',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: Responsive.isDesktop(context) ? 135 : 160,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MRS Approved Successfully!! ID: ',
                        style: Styles.black16,
                      ),
                      Text(
                        "MRS$mrsId",
                        style: Styles.green700,
                      ),
                    ],
                  ),

                  // Text(
                  //   'Please wait for Approval, you can start',
                  //   style: Styles.black16,
                  // ),
                  // Text(
                  //   'the job only after PTW is approved',
                  //   style: Styles.black16,
                  // ), // RichText(

                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Spacer(),
                    ElevatedButton(
                      style: Styles.greenElevatedButtonStyle,
                      onPressed: () {
                        Get.offAllNamed(Routes.mrsListScreen);
                      },
                      child: const Text('MRS List'),
                    ),
                    // Dimens.boxWidth10,
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: Styles.yellowElevatedButtonStyle,
                      onPressed: () {
                        controller.clearStoreData();
                        Get.toNamed(Routes.mrsIssueScreen,
                            arguments: {'mrsId': mrsId![0]});
                      },
                      child: const Text('Issue MRS'),
                    ),
                    type == 1 || type == 2 ? SizedBox(width: 10) : Dimens.box0,
                    type == 1
                        ? ElevatedButton(
                            style: Styles.darkBlueElevatedButtonStyle,
                            onPressed: () {
                              Get.offAndToNamed(Routes.jobDetails);
                            },
                            child: const Text('View Job'),
                          )
                        : type == 2
                            ? ElevatedButton(
                                style: Styles.darkBlueElevatedButtonStyle,
                                onPressed: () {
                                  Get.offAndToNamed(Routes.pmTaskView);
                                  // controller.viewNewPermitList(permitId: PtwId![0]);
                                },
                                child: const Text('View Task'),
                              )
                            : Dimens.box0,
                    // Dimens.boxWidth10,
                    Spacer(),
                    // ElevatedButton(
                    //   style: Styles.redElevatedButtonStyle,
                    //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                    //   child: const Text('Add New Job'),
                    // ),
                  ]),
                ]),
          );
        }),
        actions: [],
      );
    }));
  }
}
