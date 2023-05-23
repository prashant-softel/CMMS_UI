import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../widgets/dropdown.dart';
import '../../job_list_controller.dart';

class FacilitySelectionDropdownWidget extends GetView<JobListController> {
  const FacilitySelectionDropdownWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => //
          Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
                text: 'Select Block: ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: ColorValues.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ),
        Dimens.boxHeight5,
        DropdownWidget(
          dropdownList: controller.blockList,
          isValueSelected: controller.isBlockSelected.value,
          selectedValue: controller.selectedBlock.value,
          onValueChanged: controller.onBlockChanged,
        ),
        Dimens.boxHeight20,
      ]),
    );
  }
}
