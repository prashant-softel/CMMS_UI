import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../add_job_controller.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';

class JobCreatedDialog extends GetView<AddJobController> {
  const JobCreatedDialog({
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
      insetPadding: Dimens.edgeInsets00_04_04_04,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Job Saved',
        textAlign: TextAlign.center,
      ),
      content: Builder(builder: (context) {
        return Container(
          padding: Dimens.edgeInsets05_0_5_0,
          height: 80,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, //
              children: [
                Divider(
                  color: ColorValues.greyLightColour,
                  thickness: 1,
                ),
                Dimens.boxHeight10,
                Center(
                  child: Text(
                    message ?? '',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Dimens.boxHeight10,
              ]),
        );
      }),
      actions: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //
            children: [
              ElevatedButton(
                style: Styles.navyBlueElevatedButtonStyle,
                onPressed: () => controller.goToJobListScreen(),
                child: const Text('Job List'),
              ),
              Dimens.boxWidth10,
              ElevatedButton(
                style: Styles.yellowElevatedButtonStyle,
                onPressed: () {
                  controller.goToJobDetailsScreen(jobId ?? 0);
                },
                child: const Text('View Job'),
              ),
              Dimens.boxWidth10,
              ElevatedButton(
                style: Styles.greenElevatedButtonStyle,
                onPressed: () => controller.goToAddJobScreen(),
                child: const Text('Add New Job'),
              ),
            ]),
      ],
    );
  }

  ///
}
