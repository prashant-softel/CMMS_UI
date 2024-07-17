import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../edit_job_controller.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';

class JobUpdatedDialog extends GetView<EditJobController> {
  const JobUpdatedDialog({
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
      insetPadding: EdgeInsets.all(8),
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Job Updated',
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
                SizedBox(
                  height: 10,
                ),
                Center(child: Text(message ?? '')),
                SizedBox(
                  height: 10,
                )
              ]),
        );
      }),
      actions: [
        Row(children: [
          Spacer(),
          ElevatedButton(
            style: Styles.darkBlueElevatedButtonStyle,
            onPressed: () => controller.goToJobListScreen(),
            child: const Text('Job List'),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: Styles.yellowElevatedButtonStyle,
            onPressed: () {
              controller.goToJobDetailsScreen(jobId ?? 0);
            },
            child: const Text('View Job'),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: Styles.greenElevatedButtonStyle,
            onPressed: () => //
                controller.goToAddJobScreen(),
            child: const Text('Add New Job'),
          ),
          Spacer()
        ]),
      ],
    );
  }

  ///
}
