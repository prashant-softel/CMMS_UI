import 'package:cmms/app/create_grievance/create_grievance_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveGrievanceButtonWidget extends StatefulWidget {
  SaveGrievanceButtonWidget({super.key});
  @override
  State<SaveGrievanceButtonWidget> createState() => _SaveJobButtonWidgetState();
}

class _SaveJobButtonWidgetState extends State<SaveGrievanceButtonWidget> {
  final ButtonStyle saveButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: ColorValues.navyBlueColor,
  );

  var controller = Get.find<CreateGrievanceController>();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: 'Submit',
      onPressed: controller.saveGrievance,
      backgroundColor: ColorValues.appDarkBlueColor,
    );
  }
}
