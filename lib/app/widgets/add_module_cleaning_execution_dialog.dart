import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        insetPadding: Dimens.edgeInsets10_0_10_0,
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
                  width: 10,
                ),
                CustomRichText(title: 'Type: '),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 7,
                  child: DropdownWebStock(
                    dropdownList: controller.typePermitList,
                    isValueSelected: controller.isTypePermitSelected.value,
                    selectedValue: controller.selectedTypePermit.value,
                    onValueChanged: controller.onValueChanged,
                  ),
                )
              ],
            ),
            Dimens.boxWidth10,
            Row(
              children: [
                CustomRichText(title: 'Water Used: '),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 227, 224, 224),
                        width: 1,
                      ),
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
                    width: MediaQuery.of(context).size.width / 7,
                    child: LoginCustomTextfield(
                        // textController: controller.girNoCtrlr,
                        )),
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
            )
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
            height: height / 1.1,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment : CrossAxisAlignment.stretch,
                  children: [
                    // Dimens.boxWidth20,
                    Text('Assets'),
                    // Dimens.boxWidth100,
                    Text('Modules'),
                    // Dimens.boxWidth100,
                    Text('Cleaned'),
                    // Dimens.boxWidth100,
                    Text('Abandoned'),
                    // Dimens.boxWidth100,
                    Text('Day'),
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
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20.0),
                                ExpansionTile(
                                  title: Text(
                                    "Inventor_1",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: <Widget>[
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB1'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('500'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day1 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB1'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('500'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day1 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB1'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('500'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day1 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ExpansionTile(
                                  title: Text(
                                    "Inventor_2",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: <Widget>[
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB2'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('2000'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day3 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB2'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('2000'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day3 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB3'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('2000'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day3 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight10,
                                ExpansionTile(
                                  title: Text(
                                    "Inventor_3",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: <Widget>[
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB1'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('2700'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day4 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB2'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('2700'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day4 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('SMB1'),
                                          // Dimens.boxWidth120,
                                          Spacer(),
                                          Text('500'),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          //  Dimens.boxWidth150,
                                          Spacer(),
                                          Checkbox(
                                            value: false,
                                            onChanged: (value) {
                                              // When the checkbox is changed, update the state using the controller
                                              // controller.isChecked.value = value!;
                                              // print(
                                              //     'Checkbox Value:${controller.isChecked.value}');
                                            },
                                          ),
                                          // Dimens.boxWidth150,
                                          Spacer(),
                                          Text('Day1 (05/05/2023)')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight10,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
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
          );
        }),
      );
    }));
  }
}
