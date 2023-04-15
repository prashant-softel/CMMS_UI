import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../add_job_controller.dart';

class WorkAreaWidget extends StatelessWidget {
  WorkAreaWidget({super.key});

  ///
  var controller = Get.find<AddJobController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => //
          Column(//
              children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
                text: 'Work Area / Equipments: ',
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
          padding: EdgeInsets.symmetric(horizontal: 10.0),
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
          child: MultiSelectDialogField(validator: (selectedItems) {
              if (controller.isWorkAreaSelected.value == false) {
                return "Required field";
              } else {
                return null;
              }
            },
            autovalidateMode: AutovalidateMode.always,
            validator: (selectedItems) {
              if (controller.isWorkAreaSelected.value == false) {
                return "Required field";
              } else {
                return null;
              }
            },
            autovalidateMode: AutovalidateMode.always,
            validator: (selectedItems) {
              if (controller.isWorkAreaSelected.value == false) {
                return "Required field";
              } else {
                return null;
              }
            },
            autovalidateMode: AutovalidateMode.always,
            decoration: BoxDecoration(border: Border.all(
                color: controller.isWorkAreaSelected.value == false
                    ? Colors.red
                    : Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5),),
            buttonIcon: Icon(Icons.arrow_drop_down),
            items: controller.workAreaList
                .map((e) => MultiSelectItem(e, e?.name ?? ''))
                .toList(),
            onConfirm: (selectedOptionsList) =>
                {controller.workAreasSelected(selectedOptionsList)},
            chipDisplay: MultiSelectChipDisplay(),
          ),
        ),
        Dimens.boxHeight20,
      ]),
    );
  }
}
