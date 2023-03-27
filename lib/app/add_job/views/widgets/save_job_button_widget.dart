import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../add_job_controller.dart';

class SaveJobButtonWidget extends StatelessWidget {
  SaveJobButtonWidget({super.key});

  ///
  final ButtonStyle saveButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: ColorValues.navyBlueColor,
  );

  ///
  var controller = Get.find<AddJobController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        CustomElevatedButton(
      text: 'Save',
      onPressed: controller.saveJob,
      backgroundColor: ColorValues.appDarkBlueColor,
    );
    // ElevatedButton(
    //   style: saveButtonStyle,
    //   onPressed: () => controller.saveJob(),
    //   child: const Text('Save'),
    // );
  }
}
