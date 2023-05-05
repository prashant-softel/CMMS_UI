import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../add_job/add_job_controller.dart';
import '../navigators/app_pages.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class JobSavedDialog extends GetView<AddJobController> {
  const JobSavedDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Job Saved',
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
            Text('Job created with Job Id: ${controller.intJobId}'),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                style: Styles.greenElevatedButtonStyle,
                onPressed: () => Get.offAllNamed(Routes.jobList),
                child: const Text('Job List'),
              ),
              Dimens.boxWidth10,
              ElevatedButton(
                style: Styles.yellowElevatedButtonStyle,
                onPressed: () => Get.offAndToNamed(Routes.jobDetails,
                    arguments: {"jobId": controller.intJobId.value}),
                child: const Text('View Job'),
              ),
              Dimens.boxWidth10,
              ElevatedButton(
                style: Styles.redElevatedButtonStyle,
                onPressed: () => Get.offAndToNamed(Routes.addJob),
                child: const Text('Add New Job'),
              ),
            ]),
          ]),
        );
      }),
      actions: [],
    );
  }
}
