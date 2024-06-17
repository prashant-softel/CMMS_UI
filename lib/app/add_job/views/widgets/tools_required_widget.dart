import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/dimens.dart';
import '../../add_job_controller.dart';
import '../../../theme/color_values.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ToolsRequiredWidget extends StatefulWidget {
  ToolsRequiredWidget({super.key});

  @override
  State<ToolsRequiredWidget> createState() => _ToolsRequiredWidgetState();
}

class _ToolsRequiredWidgetState extends State<ToolsRequiredWidget> {
  ///
  var controller = Get.find<AddJobController>();

  ///
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomRichTextMobile(
          title: 'Tools Required For Error: ',
          includeAsterisk: false,
        ),
        Dimens.boxHeight2,
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
          child: MultiSelectDialogField(
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
            items: controller.toolsRequiredToWorkTypeList
                .map((e) => MultiSelectItem(e, e?.linkedToolName ?? ''))
                .toList(),

            onConfirm: (selectedOptionsList) => {
              controller.toolsRequiredSelected(selectedOptionsList),
              controller.isToolRequiredToWorkTypeSelected.value =
                  selectedOptionsList.isNotEmpty,
            },
            chipDisplay: MultiSelectChipDisplay(),
          ),
        ),
        Dimens.boxHeight15,
      ]),
    );
  }
}
