import 'package:cmms/app/app.dart';
import 'package:cmms/app/edit_mrs/edit_mrs_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../widgets/custom_richtext.dart';
import '../../widgets/dropdown_web.dart';

class EditMrsContentWeb extends GetView<EditMrsController> {
  EditMrsContentWeb({Key? key}) : super(key: key);
  final EditMrsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SelectionArea(
        child: Column(
          children: [
            HeaderWidget(),
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
                      final _flutterSecureStorage =
                          const FlutterSecureStorage();

                      _flutterSecureStorage.delete(key: "mrsId");
                      Get.back();
                    },
                    child:
                        Text(" / MRS LIST", style: Styles.greyLight14),
                  ),
                  Text(" / NEW MATERIAL SLIP", style: Styles.greyLight14)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Edit Material Requisition Slip",
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
                          Text('Where Used: '),
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
                                enabled: true,
                                textController: controller.whereUsedCtrlr,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: Dimens.edgeInsets20,
                      //  height: 300,
                      height: ((controller.rowItem.value.length) * 90) + 170,
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
                      child: Column(children: [
                        // Column(
                        //     children: []
                        //       ..addAll(controller.rowItem.value.map((e) {
                        //         return Text(jsonEncode(e));
                        //       }))),
                        //  Text(jsonEncode(controller.dropdownMapperData)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Material",
                                style: Styles.blue700,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.addRowItem();
                                },
                                child: Container(
                                  height: 25,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: ColorValues.addNewColor,
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      " + Add ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: DataTable2(
                            minWidth: 2000,
                            dataRowHeight: 105,
                            columnSpacing: 10,
                            border: TableBorder.all(
                                color: Color.fromARGB(255, 206, 229, 234)),
                            columns: [
                              DataColumn2(
                                  fixedWidth: 500,
                                  label: Text(
                                    "Equipment Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    "Material Type",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn2(
                                  fixedWidth: 210,
                                  label: Text(
                                    "Image",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    "Available Qty",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    "Requested Qty",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    "Action",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                            rows: controller.rowItem.value.map((record) {
                              return DataRow(
                                // height: 130,
                                cells: record.map((mapData) {
                                  return DataCell(
                                    (mapData['key'] == "Drop_down")
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                DropdownWebWidget(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  dropdownList:
                                                      controller.assetItemList,
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
                                                                element.name ==
                                                                selectedValue,
                                                            orElse: null);
                                                  },
                                                ),
                                                // SizedBox(
                                                //   height: 10,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     Text("Approval :"),
                                                //     Text(
                                                //         // "${controller.dropdownMapperData[mapData['value']]?.asset_code ?? ''}")
                                                //         "${controller.dropdownMapperData[mapData['value']]?.approval_required ?? ""}"),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          )
                                        : (mapData['key'] == "Action ")
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TableActionButton(
                                                      color: ColorValues
                                                          .appRedColor,
                                                      icon: Icons.delete,
                                                      label: '',
                                                      message: '',
                                                      onPress: () {
                                                        controller.rowItem
                                                            .remove(record);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              )
                                            : (mapData['key'] ==
                                                    "Requested_Qty")
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width: (Get.width *
                                                                .4),
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
                                                                      .circular(
                                                                          5),
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
                                                      ],
                                                    ),
                                                  )
                                                : (mapData['key'] ==
                                                        "Available_Qty")
                                                    ? Text(
                                                        "${controller.dropdownMapperData[record[0]['value']]?.available_qty ?? ""}")
                                                    : (mapData['key'] ==
                                                            "Material_Type")
                                                        ? Text(
                                                            "${controller.dropdownMapperData[record[0]['value']]?.asset_type ?? ""}")
                                                        : Text(mapData['key'] ??
                                                            ''),
                                  );
                                }).toList(),
                              );
                            }).toList(),
                          ),
                        ),
                      ]),
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
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.updateColor,
                    text: 'Update',
                    onPressed: () {
                      // controller.addUser();
                      controller.editMrs();
                      Get.back();
                    },
                  ),
                ),
                Dimens.boxWidth20,
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.cancelColor,
                    text: "Cancel",
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
