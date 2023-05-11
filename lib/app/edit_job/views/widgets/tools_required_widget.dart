import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../edit_job_controller.dart';
import '../../../widgets/dropdown.dart';

class ToolsRequiredWidget extends StatelessWidget {
  ToolsRequiredWidget({super.key});

  ///
  var controller = Get.find<EditJobController>();

  ///
  @override
  Widget build(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            text: 'Tools Required To Work Type: ',
            style: Styles.blackBold16,
            children: [],
          ),
        ),
      ),
      Dimens.boxHeight5,
      DropdownWidget(
        dropdownList: controller.toolsRequiredToWorkTypeList,
        onValueChanged: controller.onDropdownValueChanged,
        selectedValue: controller.selectedToolRequiredToWorkType.value,
      ),
      Dimens.boxHeight20,
    ]);
  }
}
