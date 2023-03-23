import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/dropdown.dart';
import '../preventive_list_controller.dart';

class PreventiveChecklistListContentWeb
    extends GetView<PreventiveListController> {
  PreventiveChecklistListContentWeb({Key? key}) : super(key: key);

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
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / Preventive Maintenance",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / Create Checklist Number",
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
                    height: MediaQuery.of(context).size.height / 1.6,
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
                                    "Create Checklist Number",
                                    style: Styles.blackBold16,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(
                                          title: 'CheckList Number: '),
                                      Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2) -
                                              30,
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
                                                color: ColorsValue.whiteColor,
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ],
                                            color: ColorsValue.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: LoginCustomTextfield()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(
                                          title: 'Equipment Category: '),
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                    .2) -
                                                35,
                                        child: DropdownWidget(
                                          controller: controller,
                                          dropdownList:
                                              controller.equipmentCategoryList,
                                          isValueSelected: controller
                                              .isSelectedequipment.value,
                                          selectedValue: controller
                                              .selectedequipment.value,
                                          onValueChanged:
                                              controller.onValueChanged,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(title: 'Frequency: '),
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                    .2) -
                                                30,
                                        child: DropdownWidget(
                                          controller: controller,
                                          dropdownList:
                                              controller.frequencyList,
                                          isValueSelected: controller
                                              .isSelectedfrequency.value,
                                          selectedValue: controller
                                              .selectedfrequency.value,
                                          onValueChanged:
                                              controller.onValueChanged,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(title: 'Manpower: '),
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
                                                color: ColorsValue.whiteColor,
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ],
                                            color: ColorsValue.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2) -
                                              30,
                                          child: LoginCustomTextfield()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(
                                          title: 'Duration(in Min.): '),
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
                                                color: ColorsValue.whiteColor,
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ],
                                            color: ColorsValue.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2) -
                                              30,
                                          child: LoginCustomTextfield()),
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
                                      onPressed: () {
                                        controller.createChecklistNumber();
                                      },
                                      text: 'Create Number')),
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
                              child: Text(
                                "Checklist Number List",
                                style: Styles.blackBold16,
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
                                paginationController:
                                    controller.paginationController,
                                columns: [
                                  "Checklist Number ",
                                  "Active Status ",
                                  "Category ",
                                  "Frequency ",
                                  "PM Manpower",
                                  "PM Duration(in Min.)"
                                ].map((column) {
                                  return TableViewColumn(
                                    minWidth: Get.width * 0.12,
                                    label: column,
                                  );
                                }).toList(),
                                rows: //
                                    [
                                  ...List.generate(
                                    controller.preventiveCheckList?.length ?? 0,
                                    (index) {
                                      var preventiveCheckListModelListDetails =
                                          controller
                                              .preventiveCheckList?[index];
                                      return [
                                        '${preventiveCheckListModelListDetails?.checklist_number}',
                                        "No", //'${preventiveCheckListModelListDetails?.status ?? ''}',
                                        '${preventiveCheckListModelListDetails?.category_name}',
                                        '${preventiveCheckListModelListDetails?.frequency_name}',
                                        '${preventiveCheckListModelListDetails?.manPower}',
                                        '${preventiveCheckListModelListDetails?.duration}',
                                      ];
                                    },
                                  ),
                                ].map((_preventiveCheckList) {
                                  return TableViewRow(
                                      height: 60,
                                      cells: _preventiveCheckList.map((value) {
                                        return TableViewCell(
                                            child: (value == 'No')
                                                ? SwitchListTile(
                                                    visualDensity: VisualDensity
                                                        .comfortable,
                                                    value: value == 'No'
                                                        ? true
                                                        : false,
                                                    onChanged: (value) {},
                                                    activeColor: Color.fromARGB(
                                                        255, 86, 211, 111),
                                                  )
                                                : Text(
                                                    value,
                                                  ));
                                      }).toList());
                                }).toList(),
                              ),
                            ),
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
