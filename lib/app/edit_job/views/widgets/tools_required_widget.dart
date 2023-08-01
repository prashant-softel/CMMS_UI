import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
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
      MultiSelectDialogField(
        searchable: true,
        // validator: (selectedItems) {
        //   if (controller.isToolRequiredToWorkTypeSelected.value == false) {
        //     return "Required field";
        //   } else {
        //     return null;
        //   }
        // },
        autovalidateMode: AutovalidateMode.always,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                // con troller.isToolRequiredToWorkTypeSelected.value == false
                //     ? Colors.red
                //     :
                Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        buttonIcon: Icon(Icons.arrow_drop_down),
        items: controller.toolsRequiredToWorkTypeList!
            .map(
              (equipmentCategory) => MultiSelectItem(
                equipmentCategory?.id,
                equipmentCategory?.linkedToolName ?? '',
              ),
            )
            .toList(),
        onConfirm: (selectedOptionsList) =>
            {controller.toolsRequiredSelected(selectedOptionsList)},
        chipDisplay: MultiSelectChipDisplay(),
      ),

      // DropdownWidget(
      //   dropdownList: controller.toolsRequiredToWorkTypeList,
      //   onValueChanged: controller.onDropdownValueChanged,
      //   selectedValue: controller.selectedToolRequiredToWorkType.value,
      // ),
      Dimens.boxHeight20,
    ]);
  }
}
