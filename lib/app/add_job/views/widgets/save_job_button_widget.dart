import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../add_job_controller.dart';

class SaveJobButtonWidget extends StatefulWidget {
  SaveJobButtonWidget({super.key});
  @override
  State<SaveJobButtonWidget> createState() => _SaveJobButtonWidgetState();
}

class _SaveJobButtonWidgetState extends State<SaveJobButtonWidget> {
  final ButtonStyle saveButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: ColorValues.navyBlueColor,
  );

  var controller = Get.find<AddJobController>();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: 'Submit',
      onPressed: controller.saveJob,
      backgroundColor: ColorValues.appDarkBlueColor,
    );
  }
}
