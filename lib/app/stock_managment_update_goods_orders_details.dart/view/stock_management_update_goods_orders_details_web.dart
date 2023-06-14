import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_managment_update_goods_orders_details.dart/stock_management_update_goods_orders_details_controller.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../navigators/app_pages.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';

class UpdateGoodsOrdersDetailsWeb
    extends GetView<StockManagementUpdateGoodsOrdersDetailsController> {
  UpdateGoodsOrdersDetailsWeb({Key? key}) : super(key: key);
  // final StockManagementUpdateGoodsOrdersDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" /  UPDATE GOODS ORDER DETAILS",
                        style: Styles.greyMediumLight12)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                //   margin: Dimens.edgeInsets20,
                color: Color.fromARGB(255, 245, 248, 250),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Update Goods Order Details",
                            style: Styles.blackBold16,
                          ),
                          Spacer(),
                          Text(
                            " Order ID : GOS001 ",
                            style: Styles.blackBold16,
                          ),
                          // ActionButton(
                          //   icon: Icons.menu,
                          //   label: "User List",
                          //   onPressed: () {
                          //     Get.offNamed(Routes.userList);
                          //   },
                          //   color: ColorValues.greenlightColor,
                          // ),
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorValues.greyLightColour,
                    ),
                    Container(
                      margin: Dimens.edgeInsets20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CustomRichText(title: 'Vendor: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Challan No.: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'P.O: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(
                                      title: 'Frieght:To Pay /Paid : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(
                                      title: 'No. of Packages  received :'),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(
                                      title:
                                          'Condition of Packages Received : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'GIR. No. : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(children: [
                                CustomRichText(title: 'Amount : '),
                                Dimens.boxWidth10,
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 236, 234, 234)
                                                  .withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: LoginCustomTextfield()),
                              ]),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CustomRichText(title: 'Purchase Date :'),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Challan Date : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'PO Date  : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Received Date  : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'L.R No.  : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Vehicle  No. : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Job Ref. : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Currency : '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield()),
                                ],
                              ),
                            ],
                          ),
                          Dimens.boxWidth30,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 300,
                      margin: Dimens.edgeInsets20,
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
                      child: ScrollableTableView(
                        columns: [
                          "Check Point",
                          "Requirement",
                          "Upload Image",
                          "Observation",
                          "Create Job",
                        ].map((column) {
                          return TableViewColumn(
                            label: column,
                            minWidth: Get.width * 0.18,
                          );
                        }).toList(),
                        rows: [
                          [
                            "Check each string connect",
                            "Should be clean",
                            "Upload_image",
                            "Observation",
                            "Create_job"
                          ],
                          [
                            "Check each string connect",
                            "Should be clean",
                            "Upload_image",
                            "Observation",
                            "Create_job"
                          ],
                          [
                            "Check each string connect",
                            "Should be clean",
                            "Upload_image",
                            "Observation",
                            "Create_job"
                          ],
                          [
                            "Check each string connect",
                            "Should be clean",
                            "Upload_image",
                            "Observation",
                            "Create_job"
                          ]
                        ].map((record) {
                          return TableViewRow(
                            height: 90,
                            cells: record.map((value) {
                              return TableViewCell(
                                child: (value == "Create_job")
                                    ? CustomSwitchTroggle(
                                        onChanged: (value) {},
                                      )
                                    : (value == "Observation")
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                width: (Get.width * .4),
                                                // padding: EdgeInsets.all(value),
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
                                                  ],
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: LoginCustomTextfield(
                                                  maxLine: 5,
                                                )),
                                          )
                                        : (value == "Upload_image")
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: ColorValues
                                                          .appDarkBlueColor,
                                                      border: Border.all(
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Icon(Icons.upload,
                                                        size: 30,
                                                        color: ColorValues
                                                            .whiteColor),
                                                  ),
                                                  Dimens.boxWidth15,
                                                  Container(
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      color: ColorValues
                                                          .appDarkBlueColor,
                                                      border: Border.all(
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "0 Files",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Styles.white12
                                                          .copyWith(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall!
                                                            .color,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Text(value),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ),
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
