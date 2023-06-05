import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';

import '../../edit_job_controller.dart';

class UpdateJobButtonWidget extends StatelessWidget {
  UpdateJobButtonWidget({super.key});

  ///
  var controller = Get.find<EditJobController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        CustomElevatedButton(
      text: 'Update',
      // onPressed: () => controller.updateJob(),
      onPressed: () => controller.assignReAssignJob(),
      backgroundColor: ColorValues.appDarkBlueColor,
    );
  }
}
