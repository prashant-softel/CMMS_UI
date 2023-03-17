import 'package:cmms/app/widgets/custom_dropdown.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../theme/colors_value.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';
import '../create_preventive_checklist_controller.dart';

class CreatePriventiveListScreen
    extends GetView<PreventiveCheckListController> {
  CreatePriventiveListScreen({Key? key}) : super(key: key);
  final PreventiveCheckListController controller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create CheckList Number'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Card(
            color: Colors.lightBlue.shade50,
            elevation: 20,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: Dimens.edgeInsets10,
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'CheckList Number: ',
                                style: Styles.blackBold16,
                                children: [
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: ColorsValue.orangeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          LoginCustomTextfield(),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Equipment Category: ',
                                style: Styles.blackBold16,
                                children: [
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: ColorsValue.orangeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 236, 234, 234)
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: MultiSelectDialogField(
                              initialValue: //
                                  (controller.selectedEquipmentCategoryIdList
                                          .isNotEmpty)
                                      ? controller
                                          .selectedEquipmentCategoryIdList
                                      : [],
                              decoration: BoxDecoration(border: Border()),
                              buttonIcon: Icon(Icons.arrow_drop_down),
                              items: controller.equipmentCategoryList
                                  .map(
                                    (equipmentCategory) => MultiSelectItem(
                                      equipmentCategory?.id,
                                      equipmentCategory?.name ?? '',
                                    ),
                                  )
                                  .toList(),
                              onConfirm: (selectedOptionsList) => {
                                controller.equipmentCategoriesSelected(
                                    selectedOptionsList)
                              },
                              chipDisplay: MultiSelectChipDisplay(),
                            ),
                          ),
                          // CustomDropDownButton(
                          //   value: controller.selectedequipment.value,
                          //   onChange: (String? selectedValue) {
                          //     controller.isSelectedequipment.value = true;
                          //     controller.selectedequipment.value =
                          //         selectedValue ?? '';
                          //   },
                          //   item: controller.equipmentCategoryList
                          //       .map<DropdownMenuItem<String>>((facility) {
                          //     return DropdownMenuItem<String>(
                          //       value: facility?.name ?? '',
                          //       child: Text(facility?.name ?? ''),
                          //     );
                          //   }).toList(),
                          // ),

                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Frequency: ',
                                style: Styles.blackBold16,
                                children: [
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: ColorsValue.orangeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          LoginCustomTextfield(),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Manpower: ',
                                style: Styles.blackBold16,
                                children: [
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: ColorsValue.orangeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          LoginCustomTextfield(),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Duration(in Minutes):',
                                style: Styles.blackBold16,
                                children: [
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: ColorsValue.orangeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          LoginCustomTextfield(),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle:
                                      TextStyle(fontSize: Dimens.fourteen),
                                  backgroundColor: ColorsValue.navyBlueColor,
                                ),
                                onPressed: () {
                                  // controller.login();
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ),
                        ]),
                  ),
                )
                //
                )
            //
            ),
      ),
    );
  }
}
