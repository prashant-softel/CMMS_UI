import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_mrs_return/create_mrs_return_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_swich_toggle.dart';
import '../../widgets/dropdown_web.dart';

class CreateMrsReturnContentWeb extends GetView<CreateMrsReturnController> {
  CreateMrsReturnContentWeb({Key? key}) : super(key: key);
  final CreateMrsReturnController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
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
                InkWell(
                  onTap: () {
                    Get.offNamed(Routes.home);
                  },
                  child: Text(
                    "DASHBOARD",
                    style: Styles.greyLight14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offNamed(Routes.stockManagementDashboardScreen);
                  },
                  child: Text(" / STOCK MANAGEMENT ",
                      style: Styles.greyMediumLight12),
                ),
                Text(" / NEW RETURN MATERIAL SLIP ",
                    style: Styles.greyMediumLight12)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: ColorValues.whiteColor,
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "New Return Material Requisition Slip",
                        style: Styles.blackBold16,
                      ),
                    ),
                    Divider(
                      color: ColorValues.greyLightColour,
                    ),
                    Container(
                      margin: Dimens.edgeInsets20_0_20_0,
                      child: Row(
                        children: [
                          CustomRichText(title: 'Activity: '),
                          Dimens.boxWidth10,
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 227, 224, 224),
                                  width: 1,
                                ),
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
                              ),
                              width: (MediaQuery.of(context).size.width * .2),
                              child: LoginCustomTextfield(
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.deny(
                                //       RegExp(r'\s')),
                                // ],
                                textController: controller.activityCtrlr,
                              )),
                          Spacer(),
                          Text('Task ID: '),
                          Dimens.boxWidth10,
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 227, 224, 224),
                                  width: 1,
                                ),
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
                              ),
                              child: LoginCustomTextfield(
                                // enabled: false,
                                width: (MediaQuery.of(context).size.width * .2),
                                textController: controller.whereUsedCtrlr,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      //height: 400,
                      margin: Dimens.edgeInsets20_20_20_0,
                      decoration: BoxDecoration(
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Equipment",
                                  style: Styles.blue700,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      controller.addRowItem();
                                    },
                                    child: Icon(Icons.add)),
                              ],
                            ),
                          ),
                          // Column(
                          //     children: []
                          //       ..addAll(controller.rowItem.value.map((e) {
                          //         return Text(jsonEncode(e));
                          //       }))),
                          // Text(jsonEncode(controller.dropdownMapperData)),
                          Container(
                            height: 300,
                            child: ScrollableTableView(
                              columns: [
                                "Material Name",
                                "Available Qty",
                                "Return Qty",
                                "Is Faulty?",
                                "Remark",
                              ].map((column) {
                                return TableViewColumn(
                                  label: column,
                                  minWidth: Get.width * 0.18,
                                  //  height: Get.height / 2,
                                );
                              }).toList(),
                              rows: controller.rowItem.value.map((record) {
                                return TableViewRow(
                                  height: 60,
                                  cells: record.map((mapData) {
                                    return TableViewCell(
                                      child: (mapData['key'] == "Drop_down")
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: DropdownWebWidget(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                dropdownList:
                                                    controller.assetItemList,
                                                selectedValue: mapData["value"],
                                                onValueChanged:
                                                    (list, selectedValue) {
                                                  // print({
                                                  //   selectedValue:
                                                  //       selectedValue
                                                  // });
                                                  mapData["value"] =
                                                      selectedValue;
                                                  controller.dropdownMapperData[
                                                          selectedValue] =
                                                      list.firstWhere(
                                                          (element) =>
                                                              element.name ==
                                                              selectedValue,
                                                          orElse: null);
                                                },
                                              ),
                                            )
                                          : (mapData['key'] == "Return_Qty")
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      width: (Get.width * .9),
                                                      // padding: EdgeInsets.all(value),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              5.0,
                                                              5.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child:
                                                          LoginCustomTextfield(
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        maxLine: 1,
                                                        textController:
                                                            new TextEditingController(
                                                                text: mapData[
                                                                        "value"] ??
                                                                    ''),
                                                        onChanged: (txt) {
                                                          mapData["value"] =
                                                              txt;
                                                        },
                                                      )),
                                                )
                                              : (mapData['key'] == "Issue_Qty")
                                                  ? Text(
                                                      "${controller.dropdownMapperData[record[0]['value']]?.quantity ?? ""}")
                                                  : (mapData['key'] ==
                                                          "is_faulty")
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 8.0),
                                                          child:
                                                              CustomSwitchTroggle(
                                                                  value: controller
                                                                      .isSetTemplate
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    controller
                                                                        .setTemplatetoggle();
                                                                  }))
                                                      : (mapData['key'] ==
                                                              "Remark")
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                  width:
                                                                      (Get.width *
                                                                          .5),
                                                                  // padding: EdgeInsets.all(value),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    // inputFormatters: <
                                                                    //     TextInputFormatter>[
                                                                    //   FilteringTextInputFormatter
                                                                    //       .digitsOnly
                                                                    // ],
                                                                    maxLine: 1,
                                                                    textController:
                                                                        new TextEditingController(
                                                                            text:
                                                                                mapData["value"] ?? ''),
                                                                    onChanged:
                                                                        (txt) {
                                                                      mapData["value"] =
                                                                          txt;
                                                                    },
                                                                  )),
                                                            )
                                                          : Text(
                                                              mapData['key'] ??
                                                                  ''),
                                    );
                                  }).toList(),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Dimens.edgeInsets15,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRichText(title: "Comment:"),
                          Dimens.boxWidth10,
                          Container(
                              width: (Get.width * .6),
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
                              child: LoginCustomTextfield(
                                maxLine: 5,
                                textController: controller.remarkCtrlr,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: Dimens.edgeInsets20_0_0_0,
                      child: Row(
                        children: [
                          Text(
                            'Set As Template: ',
                            style: Styles.blackBold14,
                          ),
                          Dimens.boxWidth10,
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 227, 224, 224),
                                  width: 1,
                                ),
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
                              ),
                              width: (MediaQuery.of(context).size.width * .2),
                              child: LoginCustomTextfield(
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.deny(
                                //       RegExp(r'\s')),
                                // ],
                                textController: controller.setTemlateCtrlr,
                              )),
                        ],
                      ),
                    ),
                    Dimens.boxHeight15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.greenColor,
                            text: 'Submit',
                            onPressed: () {
                              // controller.addUser();
                              controller.createReturnMrs();
                            },
                          ),
                        ),
                        Dimens.boxWidth20,
                        Container(
                          height: 35,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.redColor,
                            text: "Cancel",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
