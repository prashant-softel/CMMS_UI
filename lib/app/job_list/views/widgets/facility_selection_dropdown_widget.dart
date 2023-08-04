import 'package:cmms/app/widgets/dropdown_web.dart';
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
        DropdownWebWidget(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
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
