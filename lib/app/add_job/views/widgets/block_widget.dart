import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../add_job_controller.dart';

class BlockWidget extends StatefulWidget {
  BlockWidget({super.key});

  @override
  State<BlockWidget> createState() => _BlockWidgetState();
}

class _BlockWidgetState extends State<BlockWidget> {
  var controller = Get.find<AddJobController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomRichTextMobile(title: 'Select Block: '),
        Dimens.boxHeight2,
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
          onValueChanged: controller.onDropdownValueChanged,
          focusNode: controller.focusNode,
        ),
        Dimens.boxHeight15,
      ]),
    );
  }
}
