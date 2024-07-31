import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_mrs/create_mrs_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../home/widgets/mobile_header_widget.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/dropdown_web.dart';

class AddMrsContentMobile extends GetView<CreateMrsController> {
  AddMrsContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return
        //   Scaffold(
        // body: //
        //   Obx(
        // () =>
        Padding(
            padding: Dimens.edgeInsets10,
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dimens.boxHeight5,
                    HeaderWidgetMobile(),
                    Column(
                      children: [
                        Card(
                            color: Color.fromARGB(255, 232, 239, 242),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomRichTextMobile(
                                            title: "Activity: ",
                                            includeAsterisk: false),
                                        Dimens.boxHeight2,
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
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                            ),
                                            child: IgnorePointer(
                                              ignoring: true,
                                              child: LoginCustomTextfield(
                                                // inputFormatters: [
                                                //   FilteringTextInputFormatter.deny(
                                                //       RegExp(r'\s')),
                                                // ],
                                                textController:
                                                    controller.activityCtrlr,
                                              ),
                                            )),
                                        CustomRichTextMobile(
                                            title: 'Task ID: ',
                                            includeAsterisk: false),
                                        Dimens.boxHeight2,
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
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                            ),
                                            child: IgnorePointer(
                                              ignoring: true,
                                              child: LoginCustomTextfield(
                                                // enabled: false,
                                                textController:
                                                    controller.whereUsedCtrlr,
                                              ),
                                            )),
                                        Dimens.boxHeight10,
                                        Row(
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
                                              child: Container(
                                                height: 25,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorValues.addNewColor,
                                                  border: Border.all(
                                                    color: ColorValues
                                                        .lightGreyColorWithOpacity35,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    " + Add ",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              controller.rowItem.value.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              color: Color.fromARGB(
                                                  255, 232, 239, 242),
                                              elevation: 10,
                                              shadowColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: controller
                                                      .rowItem.value[index]
                                                      .map<Widget>((mapData) {
                                                    return Column(
                                                      children: [
                                                        (mapData['key'] ==
                                                                "Drop_down")
                                                            ? Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "Material Name:"),
                                                                  Dimens
                                                                      .boxHeight2,
                                                                  DropdownWebWidget(
                                                                    dropdownList:
                                                                        controller
                                                                            .assetItemList,
                                                                    selectedValue:
                                                                        mapData[
                                                                            "value"],
                                                                    onValueChanged:
                                                                        (list,
                                                                            selectedValue) {
                                                                      // print({
                                                                      //   selectedValue:
                                                                      //       selectedValue
                                                                      // });
                                                                      mapData["value"] =
                                                                          selectedValue;
                                                                      controller.dropdownMapperData[selectedValue] = list.firstWhere(
                                                                          (element) =>
                                                                              element.name ==
                                                                              selectedValue,
                                                                          orElse:
                                                                              null);
                                                                    },
                                                                  ),
                                                                ],
                                                              )
                                                            : (mapData['key'] ==
                                                                    "Requested_Qty")
                                                                ? Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "Requested Qty:"),
                                                                      Dimens
                                                                          .boxHeight2,
                                                                      Container(
                                                                          // padding: EdgeInsets.all(value),
                                                                          decoration:
                                                                              BoxDecoration(
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
                                                                            ],
                                                                            color:
                                                                                ColorValues.whiteColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          child:
                                                                              LoginCustomTextfield(
                                                                            inputFormatters: <TextInputFormatter>[
                                                                              FilteringTextInputFormatter.digitsOnly
                                                                            ],
                                                                            maxLine:
                                                                                1,
                                                                            textController:
                                                                                new TextEditingController(text: mapData["value"] ?? ''),
                                                                            onChanged:
                                                                                (txt) {
                                                                              mapData["value"] = txt;
                                                                            },
                                                                          ))
                                                                    ],
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "Action ")
                                                                    ? Padding(
                                                                        padding:
                                                                            EdgeInsets.only(top: 10),
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TableActionButton(
                                                                              color: ColorValues.appRedColor,
                                                                              icon: Icons.delete,
                                                                              label: '',
                                                                              message: '',
                                                                              onPress: () {
                                                                                controller.rowItem.remove(controller.rowItem.value[index]);
                                                                              },
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : (mapData['key'] ==
                                                                            "Available_Qty")
                                                                        ? Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text("Available Qty: "),
                                                                              Dimens.boxWidth2,
                                                                              Obx(
                                                                                () {
                                                                                  final employeeName = controller.rowItem[index][0]['value'];
                                                                                  final designation = controller.dropdownMapperData[employeeName]?.available_qty ?? "";
                                                                                  return Text(designation.toString());
                                                                                },
                                                                              ),
                                                                            ],
                                                                          )

                                                                        // ? Text(
                                                                        //     "${controller.dropdownMapperData.value[controller.rowItem.value[0]]?.available_qty ?? ""}")
                                                                        : (mapData['key'] ==
                                                                                "Material_Type")
                                                                            ?
                                                                            // ? Text(
                                                                            //     "${controller.dropdownMapperData.value[controller.rowItem.value[0]]?.asset_type ?? ""}")
                                                                            Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text("Material Type: "),
                                                                                  Dimens.boxWidth2,
                                                                                  Obx(
                                                                                    () {
                                                                                      final employeeName = controller.rowItem[index][0]['value'];
                                                                                      final designation = controller.dropdownMapperData[employeeName]?.asset_type ?? "";
                                                                                      return Text(designation.toString());
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            : Text(mapData['key'] ??
                                                                                ''),
                                                      ],
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Container(
                                          margin: Dimens.edgeInsets15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomRichText(title: "Comment:"),
                                              Dimens.boxHeight5,
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
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: LoginCustomTextfield(
                                                    maxLine: 5,
                                                    textController:
                                                        controller.remarkCtrlr,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: Dimens.edgeInsets20_0_0_0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Set As Template: ',
                                                style: Styles.blackBold14,
                                              ),
                                              Dimens.boxHeight5,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
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
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: LoginCustomTextfield(
                                                    // inputFormatters: [
                                                    //   FilteringTextInputFormatter.deny(
                                                    //       RegExp(r'\s')),
                                                    // ],
                                                    textController: controller
                                                        .setTemlateCtrlr,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Dimens.boxHeight15,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 35,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.greenColor,
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
                                                backgroundColor:
                                                    ColorValues.redColor,
                                                text: "Cancel",
                                                onPressed: () {},
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                ))),
                      ],
                    )
                  ],
                  //
                ),
              ),
            ));
  }

  ///////////
}
