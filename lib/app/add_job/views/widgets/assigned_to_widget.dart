import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/dimens.dart';
import '../../add_job_controller.dart';

class AssignedToWidget extends StatefulWidget {
  AssignedToWidget({super.key});
  @override
  State<AssignedToWidget> createState() => _AssignedToWidgetState();
}

class _AssignedToWidgetState extends State<AssignedToWidget> {
  ///
  var controller = Get.find<AddJobController>();
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => Column(
        crossAxisAlignment : CrossAxisAlignment.start,
          children: [
        CustomRichTextMobile(title: 'Assigned To: '),
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
          controller: controller,
          dropdownList: controller.assignedToList,
          isValueSelected: controller.isAssignedToSelected.value,
          selectedValue: controller.selectedAssignedTo.value,
          onValueChanged: controller.onDropdownValueChanged,
        ),
        Dimens.boxHeight15,
      ]),
    );
  }
}
