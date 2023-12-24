import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_mrs/create_mrs_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../widgets/custom_richtext.dart';
import '../../widgets/dropdown_web.dart';

class CreateMrsContentWeb extends GetView<CreateMrsController> {
  CreateMrsContentWeb({Key? key}) : super(key: key);
  final CreateMrsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
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
                Text(
                  "DASHBOARD",
                  style: Styles.greyLight14,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(" / STOCK MANAGEMENT ",
                      style: Styles.greyMediumLight12),
                ),
                Text(" / NEW MATERIAL SLIP ", style: Styles.greyMediumLight12)
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
                        "New Material Requisition Slip",
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
                          Text('ID: '),
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
                                // enabled: false,
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
                                  "Material",
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
                                "Material Type",
                                "Image",
                                "Available Qty",
                                "Requested Qty",
                              ].map((column) {
                                return TableViewColumn(
                                  label: column,
                                  minWidth: Get.width * 0.18,
                                  //  height: Get.height / 2,
                                );
                              }).toList(),
                              rows: controller.rowItem.value.map((record) {
                                return TableViewRow(
                                  height: 85,
                                  cells: record.map((mapData) {
                                    return TableViewCell(
                                      child: (mapData['key'] == "Drop_down")
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  DropdownWebWidget(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    dropdownList: controller
                                                        .assetItemList,
                                                    selectedValue:
                                                        mapData["value"],
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
                                                                  element
                                                                      .name ==
                                                                  selectedValue,
                                                              orElse: null);
                                                    },
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      Text(
                                                          "Approval required:"),
                                                      Dimens.boxWidth10,
                                                      Text(
                                                          "${controller.dropdownMapperData[mapData['value']]?.approval_required ?? ""}")
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : (mapData['key'] == "Requested_Qty")
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      width: (Get.width * .4),
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
                                                        inputFormatters: <
                                                            TextInputFormatter>[
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
                                              : (mapData['key'] ==
                                                      "Available_Qty")
                                                  ? Text(
                                                      "${controller.dropdownMapperData[record[0]['value']]?.available_qty ?? ""}")
                                                  : (mapData['key'] ==
                                                          "Material_Type")
                                                      ? Text(
                                                          "${controller.dropdownMapperData[record[0]['value']]?.asset_type ?? ""}")
                                                      : Text(
                                                          mapData['key'] ?? ''),
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
                              controller.createMrs();
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
      );
    });
  }
}
