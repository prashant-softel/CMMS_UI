import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textfield.dart';
import '../preventive_check_point_controller.dart';

class PreventiveCheckPointContentWeb
    extends GetView<PreventiveCheckPointController> {
  PreventiveCheckPointContentWeb({Key? key}) : super(key: key);
  final PreventiveCheckPointController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 227, 224, 224),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: ColorsValue.greyLightColor,
                  ),
                  Text(
                    "Dashboard",
                    style: Styles.greyLight14,
                  ),
                  Text(" / Preventive Maintenance",
                      style: Styles.greyMediumLight12),
                  Text(" / Check Point Creator",
                      style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width * .3),
                    margin: EdgeInsets.only(left: 30, top: 30),
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: Card(
                      color: Color.fromARGB(255, 251, 252, 253),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Check Point Creator",
                                    style: Styles.blackBold16,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(title: 'Check List No. '),
                                      Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2) -
                                              30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 227, 224, 224),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 236, 234, 234)
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: LoginCustomTextfield()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(title: 'Check Point'),
                                      Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 227, 224, 224),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 236, 234, 234)
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2) -
                                              30,
                                          child: LoginCustomTextfield(
                                            ishint: 'Enter Check Point',
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(title: 'Requirement'),
                                      Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 227, 224, 224),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 236, 234, 234)
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2) -
                                              30,
                                          child: LoginCustomTextfield(
                                            ishint: 'Enter Requirement',
                                          )),
                                    ],
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(title: 'Image Upload?'),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Text("No"),
                                      Switch(
                                          activeColor: ColorsValue.greenColor,
                                          value: controller.isToggleOn.value,
                                          onChanged: (value) {
                                            controller.toggle();
                                          }),
                                      Text("Yes"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 45,
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 223, 101, 80),
                                      onPressed: () {},
                                      text: 'Cancel')),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 45,
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 102, 249, 132),
                                      onPressed: () {},
                                      text: 'Create Check Point')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 7,
                      margin: EdgeInsets.only(left: 10, top: 30),
                      height: Get.height,
                      child: Card(
                        color: Color.fromARGB(255, 251, 252, 253),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Check Point List",
                                    style: Styles.blackBold16,
                                  ),
                                  ActionButton(
                                    icon: Icons.upload,
                                    lable: 'Import Check Point',
                                    onPress: () {},
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ColorsValue.greyLightColour,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor: Colors.blue,
                                      onPressed: () {},
                                      text: 'Copy'),
                                ),
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor: Colors.blue,
                                      onPressed: () {},
                                      text: 'Excel'),
                                ),
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor: Colors.blue,
                                      onPressed: () {},
                                      text: 'PDF'),
                                ),
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor: Colors.blue,
                                      onPressed: () {},
                                      text: 'Column Visibility'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                child: ScrollableTableView(
                              columns: [
                                "Check List No.",
                                "Check Point",
                                "Requirement",
                                "Upload Image?",
                                "Action",
                              ].map((column) {
                                return TableViewColumn(
                                  label: column,
                                  minWidth: Get.width * 0.16,
                                );
                              }).toList(),
                              rows: [
                                [
                                  "PR100dgWER0PRT097BHSDBHBHF",
                                  "Visivility check the outer",
                                  "ther is not be any damage andit must be free",
                                  "yes",
                                  "Action"
                                ],
                                [
                                  "PR100dgWER0PRT097BHSDBHBHF",
                                  "Visivility check the outer",
                                  "ther is not be any damage andit must be free",
                                  "yes",
                                  "Action"
                                ],
                                [
                                  "PR100dgWER0PRT097BHSDBHBHF",
                                  "Visivility check the outer",
                                  "ther is not be any damage andit must be free",
                                  "yes",
                                  "Action"
                                ],
                                [
                                  "PR100dgWER0PRT097BHSDBHBHF",
                                  "Visivility check the outer",
                                  "ther is not be any damage andit must be free",
                                  "yes",
                                  "Action"
                                ],
                                [
                                  "PR100dgWER0PRT097BHSDBHBHF",
                                  "Visivility check the outer",
                                  "ther is not be any damage andit must be free",
                                  "yes",
                                  "Action"
                                ],
                              ].map((record) {
                                return TableViewRow(
                                  height: 60,
                                  cells: record.map((value) {
                                    return TableViewCell(
                                      child: (value == "Action")
                                          ? Wrap(children: [
                                              TableActionButton(
                                                color: Colors.blue,
                                                icon: Icons.edit,
                                                label: 'Edit',
                                                onPress: () {},
                                              ),
                                              TableActionButton(
                                                color: Colors.red,
                                                icon: Icons.delete,
                                                label: 'Delete',
                                                onPress: () {},
                                              ),
                                            ])
                                          : (value == "yes")
                                              ? Wrap(
                                                  children: [
                                                    Text("No"),
                                                    Switch.adaptive(
                                                        activeColor: ColorsValue
                                                            .redColor,
                                                        value: false,
                                                        onChanged: (value) {
                                                          // controller.toggle();
                                                        }),
                                                    Text("Yes"),
                                                  ],
                                                )
                                              : Text(value),
                                    );
                                  }).toList(),
                                );
                              }).toList(),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
