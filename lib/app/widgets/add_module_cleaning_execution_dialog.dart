import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class AddModuleCleaningExecutionDialog extends GetView {
  AddModuleCleaningExecutionDialog();

  final AddModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets0_0_10_0,
        // contentPadding: EdgeInsets.zero,
        title: Row(
          children: [
            Text(
              "Set Equipments",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                CustomRichText(title: 'Type: '),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: MultiSelectDialogField(
                    dialogWidth: 300,
                    dialogHeight: 400,
                    // title: 'Select Equipments',
                    // buttonText: 'Equipment Category',
                    initialValue:
                        (controller.selectedEquipmentCategoryIdList.isNotEmpty)
                            ? controller.selectedEquipmentCategoryIdList
                            : [],
                    items: controller.equipmentCategoryList
                        .map(
                          (equipmentCategory) => MultiSelectItem(
                            equipmentCategory?.id,
                            equipmentCategory?.name ?? '',
                          ),
                        )
                        .toList(),
                    onConfirm: (selectedOptionsList) => {
                      controller
                          .equipmentCategoriesSelected(selectedOptionsList),
                      print(
                          'Equipment list ids ${controller.selectedEquipmentCategoryIdList}')
                    },
                  ),
                )
              ],
            ),
            Dimens.boxWidth10,
            Row(
              children: [
                CustomRichText(title: 'Water Used: '),
                Dimens.boxWidth20,
                Text('1000 ltr'),
                Dimens.boxWidth50,
                // Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(
                //         color: Color.fromARGB(255, 227, 224, 224),
                //         width: 1,
                //       ),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Color.fromARGB(255, 236, 234, 234)
                //               .withOpacity(0.5),
                //           spreadRadius: 2,
                //           blurRadius: 5,
                //           offset: Offset(0, 2),
                //         ),
                //       ],
                //     ),
                //     width: MediaQuery.of(context).size.width / 7,
                //     child: LoginCustomTextfield(
                //         // textController: controller.girNoCtrlr,
                //         )),
                Dimens.boxWidth10,
                Container(
                  width: 150,
                  height: 25,
                  margin: Dimens.edgeInsets0_0_16_0,
                  child: TextField(
                    // onChanged: (value) =>
                    //     controller.search(value),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      contentPadding: Dimens.edgeInsets10_0_0_0,
                      hintText: 'search'.tr,
                      hintStyle: Styles.grey12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorValues.lightGreyColorWithOpacity35,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorValues.appBlueBackgroundColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.only(right: 120, top: 10),
            height: height / 1.5,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment : CrossAxisAlignment.stretch,
                  children: [
                    // Dimens.boxWidth20,
                    Text('Assets'),
                    Dimens.boxWidth30,
                    Text('Modules'),
                    // Dimens.boxWidth100,
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text('Cleaned'),
                    ),
                    // Dimens.boxWidth100,
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text('Abandoned'),
                    ),
                    // Dimens.boxWidth100,
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text('Day'),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Dimens.boxWidth10,
                        Container(
                          height: MediaQuery.of(context).size.height / 1.7,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20.0),
                                Column(
                                  children: []
                                    ..addAll(controller.equipmentList
                                        .map((element) => Column(
                                              children: [
                                                ExpansionTile(
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        // width: 200,
                                                        child: Text(
                                                          "${element?.invName}",
                                                          style: TextStyle(
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Spacer(),

                                                      SizedBox(
                                                        // width: 200,
                                                        child: Text(
                                                          "${element?.moduleQuantity}",
                                                          style: TextStyle(
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      // Dimens.boxWidth30,
                                                      Spacer(),
                                                      Obx(
                                                        () => Checkbox(
                                                          value: controller
                                                              .isChecked.value,
                                                          onChanged:
                                                              (bool? value) {
                                                            controller
                                                                .toggleCheckbox();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  children: <Widget>[
                                                    ListTile(
                                                      title: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [

                                                        ]
                                                          ..addAll(
                                                              element!.smbs!
                                                                  .map(
                                                                      (e) =>
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Text('${e?.smbName}'),
                                                                              // Dimens.boxWidth50,
                                                                              Spacer(),
                                                                              Text('${e?.moduleQuantity}'),
                                                                              // Dimens.boxWidth120,
                                                                              Spacer(),
                                                                              Obx(
                                                                                () => Checkbox(
                                                                                  value: controller.isChecked.value,
                                                                                  onChanged: (bool? value) {
                                                                                    controller.toggleCheckbox();
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              // Dimens.boxWidth150,
                                                                              Spacer(),
                                                                              Obx(
                                                                                () => Checkbox(
                                                                                  value: controller.isChecked.value,
                                                                                  onChanged: (bool? value) {
                                                                                    controller.toggleCheckbox();
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Dimens.boxWidth100,
                                                                              // Spacer(),
                                                                              Text('Day1')
                                                                            ],
                                                                          ))),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ],
                                            ))),
                                ),


                                Dimens.boxHeight150,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Spacer(),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    ElevatedButton(
                                      style: Styles.greenElevatedButtonStyle,
                                      onPressed: () {
                                        // print('Incident Report Id${incidentReportId![0]}');
                                        Get.back();
                                      },
                                      child: const Text('Save'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: Styles.darkRedElevatedButtonStyle,
                                      onPressed: () {
                                        // Get.offAllNamed(Routes.moduleCleaningPlanning);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          );
        }),
      );
    }));
  }
}
