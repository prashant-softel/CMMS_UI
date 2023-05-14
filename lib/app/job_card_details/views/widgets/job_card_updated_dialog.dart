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
  final int? jobId;
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
        'Job Card Updated',
        textAlign: TextAlign.center,
      ),
      content: Builder(builder: (context) {
        return Container(
          padding: Dimens.edgeInsets05_0_5_0,
          height: Get.height / 6,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Divider(
              color: ColorValues.greyLightColour,
              thickness: 1,
            ),
            Spacer(),
            Text(message ?? ''),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                style: Styles.greenElevatedButtonStyle,
                onPressed: () => controller.goToJobCardListScreen(),
                child: const Text('Job List'),
              ),
              // Dimens.boxWidth10,
              // ElevatedButton(
              //   style: Styles.yellowElevatedButtonStyle,
              //   onPressed: () {
              //     controller.goToJobDetailsScreen(jobId ?? 0);
              //   },
              //   child: const Text('View Job'),
              // ),
              // Dimens.boxWidth10,
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
