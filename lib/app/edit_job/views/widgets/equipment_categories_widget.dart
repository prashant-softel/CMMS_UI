import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../edit_job_controller.dart';

class EquipmentCategoriesWidget extends StatelessWidget {
  EquipmentCategoriesWidget({super.key});

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
              text: 'Equipment Categories: ',
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
      Container(
        decoration: BoxDecoration(
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
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: //
            Obx(
          () => MultiSelectDialogField(
            searchable: true,
            initialValue: //
                controller.selectedEquipmentCategoryList
                    .map((equipmentCategory) => equipmentCategory
                        ?.id) // Extract the IDs from the list of InventoryCategoryModel objects
                    .toList(),
            validator: (selectedItems) {
              if (controller.isEquipmentCategorySelected.value == false) {
                return "Required field";
              } else {
                return null;
              }
            },
            autovalidateMode: AutovalidateMode.always,
            decoration: BoxDecoration(
              border: Border.all(
                color: controller.isEquipmentCategorySelected.value == false
                    ? Colors.red
                    : Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            buttonIcon: Icon(Icons.arrow_drop_down),
            items: controller.equipmentCategoryList
                .map(
                  (equipmentCategory) => MultiSelectItem(
                    equipmentCategory?.id,
                    equipmentCategory?.name ?? '',
                  ),
                )
                .toList(),
            onConfirm: (selectedOptionsList) =>
                {controller.equipmentCategoriesSelected(selectedOptionsList)},
            chipDisplay: MultiSelectChipDisplay(),
          ),
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }
}
