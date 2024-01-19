import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color_values.dart';
import '../../../theme/styles.dart';

class ComplianceWeb extends StatelessWidget {
  ComplianceWeb({Key? key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments
    final arguments = Get.arguments as Map<String, dynamic>?;

    // Check if arguments exist and contain 'reNew'
    final int? reNew = arguments?['reNew'] ?? 0;
    final int? viewStatutory = arguments?['viewStatutory'] ?? 0;
    List<Map<String, String>> staticDataList = [
      {
        "Time Stamp Re New": "2023-10-07 10:00:00",
        "postedBy": "Received",
        "comment": "Static Comment 1",
        "location": "2024-10-07 10:00:00",
        "Approver Name": "Manager",
      },
      {
        "Time Stamp Re New": "2022-10-07 10:00:00",
        "postedBy": "Applied",
        "comment": "Static Comment 1",
        "location": "2023-10-07 10:00:00",
        "Approver Name": "Manager2",
      },
      {
        "Time Stamp Re New": "2021-10-07 10:00:00",
        "postedBy": "Out of Due date",
        "comment": "Static Comment 1",
        "location": "2022-10-07 10:00:00",
        "Approver Name": "Admin",
      },
    ];

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: Get.width,
        height: Get.height,
        child: Column(
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
                      Get.offNamed(Routes.statutory);
                    },
                    child: Text(" / MIS", style: Styles.greyLight14),
                  ),
                  Text(
                    " / STATUTORY",
                    style: Styles.greyLight14,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    children: [
                      Card(
                        color: Color.fromARGB(255, 245, 248, 250),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                "Statutory Report",
                                style: Styles.blackBold16,
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Container(
                              color: Color.fromARGB(255, 245, 248, 250),
                              width: Get.width,
                              height: Get.height,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Container(
                                  margin: Dimens.edgeInsets20,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Compliance '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.challanNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Received Date '),
                                                  Dimens.boxWidth10,
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      // controller
                                                      //         .openReceivedPicker =
                                                      //     !controller
                                                      //         .openReceivedPicker;
                                                      // controller.update(
                                                      //     ['stock_Mangement']);
                                                    },
                                                    // textController:
                                                    //     controller.receivedDateTc,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Validity (In months) '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.challanNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Days Left '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.challanNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              // if (reNew == 1)
                                              // Row(
                                              //   children: [
                                              //     CustomRichText(
                                              //         title: 'ReNew Date '),
                                              //     Dimens.boxWidth10,
                                              //     CustomTextFieldForStock(
                                              //       width:
                                              //           MediaQuery.of(context)
                                              //                   .size
                                              //                   .width /
                                              //               5,
                                              //       numberTextField: true,
                                              //       onTap: () {
                                              //         // controller
                                              //         //         .openReceivedPicker =
                                              //         //     !controller
                                              //         //         .openReceivedPicker;
                                              //         // controller.update(
                                              //         //     ['stock_Mangement']);
                                              //       },
                                              //       // textController:
                                              //       //     controller.receivedDateTc,
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Status of validity '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.challanNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Expires on '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.challanNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Status of validity '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.challanNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      Dimens.boxHeight20,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(children: [
                                          Text('Comment: '),
                                          Expanded(
                                            child: TextField(
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                              ),
                                              decoration: InputDecoration(
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .appLightGreyColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .appLightBlueColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .appLightBlueColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              keyboardType:
                                                  TextInputType.multiline,
                                              minLines: 3,
                                              maxLines: null,
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Dimens.boxHeight10,
                                      Container(
                                        margin: Dimens.edgeInsets20,
                                        height:
                                            300, // Adjust the height as needed
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorValues
                                                .lightGreyColorWithOpacity35,
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorValues
                                                  .appBlueBackgroundColor,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Fire NOC Status",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color:
                                                  ColorValues.greyLightColour,
                                            ),
                                            Expanded(
                                              child: DataTable2(
                                                border: TableBorder.all(
                                                    color: Color.fromARGB(
                                                        255, 206, 229, 234)),
                                                columns: [
                                                  DataColumn(
                                                    label: Text(
                                                      "Time Stamp Re New",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Comment",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Expires Date",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Approver Name",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                                rows: List<DataRow>.generate(
                                                  staticDataList.length,
                                                  (index) => DataRow(cells: [
                                                    DataCell(Text(staticDataList[
                                                            index][
                                                        "Time Stamp Re New"]!)),
                                                    DataCell(Text(
                                                        staticDataList[index]
                                                            ["postedBy"]!)),
                                                    DataCell(Text(
                                                        staticDataList[index]
                                                            ["comment"]!)),
                                                    DataCell(Text(
                                                        staticDataList[index]
                                                            ["location"]!)),
                                                    DataCell(Text(
                                                        staticDataList[index][
                                                            "Approver Name"]!)),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Dimens.boxHeight15,
                                      if (viewStatutory == 0)
                                        Row(
                                          children: [
                                            Spacer(),
                                            CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appRedColor,
                                              text: 'cancel',
                                              onPressed: () {
                                                // controller.AddInventory();
                                              },
                                            ),
                                            Dimens.boxWidth15,
                                            CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appGreenColor,
                                              text: 'Update',
                                              onPressed: () {
                                                // controller.submitPurchaseOrderData();
                                              },
                                            ),
                                            Spacer()
                                          ],
                                        ),
                                      Dimens.boxHeight15,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
