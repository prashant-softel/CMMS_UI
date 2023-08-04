import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../job_card_details_controller.dart';

class JobCardUpdatedDialog extends GetView<JobCardDetailsController> {
  const JobCardUpdatedDialog({
    this.jobId,
    this.message,
    super.key,
  });

  ///
  final List<dynamic>? jobId;
  final String? message;

  ///
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Text(
        (message ?? ''),
        textAlign: TextAlign.center,
      ),
      content: Builder(builder: (context) {
        return Container(
          padding: Dimens.edgeInsets05_0_5_0,
          height: Get.height / 6,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, //
              children: [
                Divider(
                  color: ColorValues.greyLightColour,
                  thickness: 1,
                ),
                Dimens.boxHeight20,
                Center(
                    child: Text("Job Card Added Succesfully With ID $jobId ")),
                Dimens.boxHeight25,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //
                    children: [
                      ElevatedButton(
                        style: Styles.greenElevatedButtonStyle,
                        onPressed: () => controller.goToJobCardListScreen(),
                        child: const Text('Job List'),
                      ),
                      Dimens.boxWidth10,
                      ElevatedButton(
                        style: Styles.yellowElevatedButtonStyle,
                        child: Text("Job Card"),
                        onPressed: () => controller.goToJobCardScreen(),
                      ),
                      // ElevatedButton(
                      //   style: Styles.yellowElevatedButtonStyle,
                      //   onPressed: () {
                      //     controller.goToJobDetailsScreen();
                      //   },
                      // child: const Text('View Job Card'),
                      // ),
                      Dimens.boxWidth10,
                      ElevatedButton(
                        style: Styles.yellowElevatedButtonStyle,
                        onPressed: () {
                          controller.goToAddJobScreen();
                        },
                        child: const Text('View Job'),
                      ),
                      // ElevatedButton(
                      //   style: Styles.redElevatedButtonStyle,
                      //   onPressed: () => controller.goToAddJobScreen(),
                      //   child: const Text('Add New Job'),
                      // ),
                    ]),
              ]),
        );
      }),
      actions: [],
    );
  }

  ///
}
