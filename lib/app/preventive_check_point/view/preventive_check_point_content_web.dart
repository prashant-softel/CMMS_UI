import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textfield.dart';
import '../preventive_check_point_controller.dart';

class PreventiveCheckPointContentWeb
    extends GetView<PreventiveCheckPointController> {
  PreventiveCheckPointContentWeb({Key? key}) : super(key: key);
  // final PreventiveCheckPointController controller = Get.find();

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
                    color: ColorValues.greyLightColor,
                  ),
                  Text(
                    "Dashboard",
                    style: Styles.greyLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / Preventive Maintenance",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / Check Point Creator",
                      style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width * .3),
                    margin: EdgeInsets.only(left: 30, top: 30),
                    height: MediaQuery.of(context).size.height / 1.8,
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
                                  Visibility(
                                    visible: controller.isSuccess.value,
                                    child: Center(
                                      child: Wrap(
                                        children: [
                                          Text(
                                            "CheckPoint added Successfully in the List.",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 24, 243, 123)),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(title: 'Check List No. '),
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                    .2) -
                                                30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: CustomDropDownButton(
                                            value: controller
                                                .selectedchecklist.value,
                                            onChange: (String? selectedValue) {
                                              controller.isSelectedchecklist
                                                  .value = true;
                                              controller.selectedchecklist
                                                  .value = selectedValue ?? '';

                                              controller.getCheckPointlist(
                                                  selectedchecklistId:
                                                      selectedValue.toString());
                                            },
                                            item: controller.checkList
                                                .map<DropdownMenuItem<String>>(
                                                    (list) {
                                              return DropdownMenuItem<String>(
                                                value:
                                                    list?.id.toString() ?? '',
                                                child: Text(list
                                                        ?.checklist_number
                                                        .toString() ??
                                                    ''),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )
                                    ],
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
                                            textController:
                                                controller.checkPointCtrlr,
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
                                            textController:
                                                controller.requirementCtrlr,
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
                                          activeColor: ColorValues.greenColor,
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
                                width: (MediaQuery.of(context).size.width * .1),
                                child: CustomElevatedButton(
                                    backgroundColor:
                                        Color.fromARGB(255, 223, 101, 80),
                                    onPressed: () {},
                                    text: 'Cancel'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width:
                                      (MediaQuery.of(context).size.width * .2) -
                                          120,
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 102, 249, 132),
                                      onPressed: () {
                                        controller
                                            .createCheckpoint()
                                            .then((value) {
                                          if (value == true)
                                            controller
                                                .issuccessCreatecheckpont();
                                        });
                                      },
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
                                    label: 'Import Check Point',
                                    onPressed: () {},
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width * .1) -
                                          70,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor: Colors.blue,
                                      onPressed: () {},
                                      text: 'Copy'),
                                ),
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width * .1) -
                                          60,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor: Colors.blue,
                                      onPressed: () {},
                                      text: 'Excel'),
                                ),
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width * .1) -
                                          70,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor: Colors.blue,
                                      onPressed: () {},
                                      text: 'PDF'),
                                ),
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width * .2) -
                                          135,
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
                            controller.preventiveCheckpoint!.length < 1
                                ? Expanded(
                                    child: ScrollableTableView(
                                      columns: [
                                        "Check Point Id",
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
                                        ...List.generate(
                                          controller.preventiveCheckpoint
                                                  ?.length ??
                                              0,
                                          (index) {
                                            return [
                                              "",
                                              '',
                                              '',
                                              '',
                                              '',
                                              '',
                                            ];
                                          },
                                        ),
                                      ].map((record) {
                                        return TableViewRow(
                                          height: 60,
                                          cells: record.map((value) {
                                            return TableViewCell(
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : Expanded(
                                    child: ScrollableTableView(
                                    paginationController:
                                        controller.paginationController,
                                    columns: [
                                      "Check Point Id",
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
                                      ...List.generate(
                                        controller
                                                .preventiveCheckpoint?.length ??
                                            0,
                                        (index) {
                                          var preventiveCheckPointModelListDetails =
                                              controller
                                                  .preventiveCheckpoint?[index];
                                          return [
                                            '${preventiveCheckPointModelListDetails?.id}',
                                            '${preventiveCheckPointModelListDetails?.checklist_name}',
                                            '${preventiveCheckPointModelListDetails?.check_point}',
                                            '${preventiveCheckPointModelListDetails?.requirement}',
                                            '${preventiveCheckPointModelListDetails?.is_document_required}',
                                            'Action',
                                          ];
                                        },
                                      ),
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
                                                      onPress: () {
                                                        print(record[0]);
                                                        controller
                                                            .isDeleteDialog(
                                                                check_point:
                                                                    record[2],
                                                                check_point_id:
                                                                    record[0]);
                                                      },
                                                    ),
                                                  ])
                                                : (value == "0" || value == '1')
                                                    ? Wrap(
                                                        children: [
                                                          Text("No"),
                                                          Switch.adaptive(
                                                              activeColor:
                                                                  ColorValues
                                                                      .greenColor,
                                                              value:
                                                                  value == "1"
                                                                      ? true
                                                                      : false,
                                                              onChanged:
                                                                  (value) {
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      controller.paginationController,
                                  builder: (context, value, child) {
                                    return Row(children: [
                                      Text(
                                          "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                      Row(children: [
                                        IconButton(
                                          onPressed: controller
                                                      .paginationController
                                                      .currentPage <=
                                                  1
                                              ? null
                                              : () {
                                                  controller
                                                      .paginationController
                                                      .previous();
                                                },
                                          iconSize: 20,
                                          splashRadius: 20,
                                          icon: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: controller
                                                        .paginationController
                                                        .currentPage <=
                                                    1
                                                ? Colors.black26
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: controller
                                                      .paginationController
                                                      .currentPage >=
                                                  controller
                                                      .paginationController
                                                      .pageCount
                                              ? null
                                              : () {
                                                  controller
                                                      .paginationController
                                                      .next();
                                                },
                                          iconSize: 20,
                                          splashRadius: 20,
                                          icon: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: controller
                                                        .paginationController
                                                        .currentPage >=
                                                    controller
                                                        .paginationController
                                                        .pageCount
                                                ? Colors.black26
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                      ]),
                                    ]);
                                  }),
                            ),
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
