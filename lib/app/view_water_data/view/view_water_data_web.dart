import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_water_data/view_water_data_controller.dart';
import 'package:cmms/app/widgets/add_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/date_picker.dart';

class ViewWaterDataWeb extends StatefulWidget {
  ViewWaterDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewWaterDataWeb> createState() => _WaterDataWebState();
}

class _WaterDataWebState extends State<ViewWaterDataWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewWaterDataController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Container(
              color: Color.fromARGB(255, 234, 236, 238),
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  HeaderWidget(),
                  AppBarGoodsOrder(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 245, 248, 250),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "View Water Data For April Month",
                                        style: Styles.blackBold16,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(left: 20, right: 20),
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.end,
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title: 'Month: '),
                                //                   Dimens.boxWidth10,
                                //                   DropdownWebStock(
                                //                     width: MediaQuery.of(context)
                                //                             .size
                                //                             .width /
                                //                         5,
                                //                     dropdownList:
                                //                         controller.month,
                                //                     // selectedValue: ,
                                //                     onValueChanged:
                                //                         (month, selectedValue) {},
                                //                   ),
                                //                 ],
                                //               ),
                                //               Dimens.boxHeight10,
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Surface Water in KL units'),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //           Spacer(),
                                //           Column(
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Ground Water in KL units : '),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //           Dimens.boxWidth30,
                                //         ],
                                //       ),
          
                                //     ],
                                //   ),
                                // ),
          
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
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
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Drinking Water Usage:",
                                              style: Styles.blue14),
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Date", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("1 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("5 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("14 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("15 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("23 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("25 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("29 April",
                                                  style: Styles.black14)
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Description",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("Opening Balance",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 1",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 2",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 3",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Closing Balance",
                                                  style: Styles.Red700),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Transtion Type",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("procurment",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Consumption",
                                                  style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Total", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("2000", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("3000", style: Styles.black14),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Action",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight5,
                                      Row(
                                        children: [
                                          Spacer(),
                                          Text("Total: ", style: Styles.blue14),
                                          Spacer(),
                                          Text("500", style: Styles.black14),
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Text("500", style: Styles.black14),
                                          Dimens.boxWidth140,
                                          Text("1000", style: Styles.black14),
                                          SizedBox(
                                            width: 132,
                                          )
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                    ],
                                  ),
                                ),
          
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
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
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Module cleaning Usage:",
                                              style: Styles.blue14),
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Date", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("1 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("5 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("14 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("15 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("23 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("25 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("29 April",
                                                  style: Styles.black14)
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Description",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("Opening Balance",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 1",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 2",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 3",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Closing Balance",
                                                  style: Styles.Red700),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Transtion Type",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("procurment",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Consumption",
                                                  style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Total", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("2000", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("3000", style: Styles.black14),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Action",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight5,
                                      Row(
                                        children: [
                                          Spacer(),
                                          Text("Total: ", style: Styles.blue14),
                                          Spacer(),
                                          Text("500", style: Styles.black14),
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Text("500", style: Styles.black14),
                                          Dimens.boxWidth140,
                                          Text("1000", style: Styles.black14),
                                          SizedBox(
                                            width: 132,
                                          )
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
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
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Surface Water For April Month:",
                                              style: Styles.blue14),
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Date", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("1 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("5 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("14 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("15 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("23 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("25 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("29 April",
                                                  style: Styles.black14)
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Description",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("Opening Balance",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 1",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 2",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 3",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Closing Balance",
                                                  style: Styles.Red700),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Transtion Type",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("procurment",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Consumption",
                                                  style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Total", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("2000", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("3000", style: Styles.black14),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Action",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight5,
                                      Row(
                                        children: [
                                          Spacer(),
                                          Text("Total: ", style: Styles.blue14),
                                          Spacer(),
                                          Text("500", style: Styles.black14),
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Text("500", style: Styles.black14),
                                          Dimens.boxWidth140,
                                          Text("1000", style: Styles.black14),
                                          SizedBox(
                                            width: 132,
                                          )
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
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
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Ground Water For April Month:",
                                              style: Styles.blue14),
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Date", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("1 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("5 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("14 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("15 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("23 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("25 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("29 April",
                                                  style: Styles.black14)
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Description",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("Opening Balance",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 1",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 2",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 3",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Closing Balance",
                                                  style: Styles.Red700),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Transtion Type",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("procurment",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Consumption",
                                                  style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Total", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("2000", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("3000", style: Styles.black14),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Action",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight5,
                                      Row(
                                        children: [
                                          Spacer(),
                                          Text("Total: ", style: Styles.blue14),
                                          Spacer(),
                                          Text("500", style: Styles.black14),
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Text("500", style: Styles.black14),
                                          Dimens.boxWidth140,
                                          Text("1000", style: Styles.black14),
                                          SizedBox(
                                            width: 132,
                                          )
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
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
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Domestic and other purpose Usage:",
                                              style: Styles.blue14),
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Date", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("1 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("5 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("14 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("15 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("23 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("25 April",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("29 April",
                                                  style: Styles.black14)
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Description",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("Opening Balance",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 1",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 2",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("drinking Consumption ",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text(
                                                  "description drinking water procured from vendor 3",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Closing Balance",
                                                  style: Styles.Red700),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Transtion Type",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("procured",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("Consumption",
                                                  style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("procurment",
                                                  style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("100", style: Styles.green700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Consumption",
                                                  style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text(""),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("-100", style: Styles.Red700),
                                              Dimens.boxHeight5,
                                              Text("")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Total", style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("2000", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200 ", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("200", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              Text("3000", style: Styles.black14),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Action",
                                                  style: Styles.blue17),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              GestureDetector(
                                                onTap: () {
                                                  Get.dialog(AddDialog());
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ColorValues.editColor,
                                                ),
                                              ),
                                              Dimens.boxHeight5,
                                              Text("", style: Styles.black14),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight5,
                                      Row(
                                        children: [
                                          Spacer(),
                                          Text("Total: ", style: Styles.blue14),
                                          Spacer(),
                                          Text("500", style: Styles.black14),
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Text("500", style: Styles.black14),
                                          Dimens.boxWidth140,
                                          Text("1000", style: Styles.black14),
                                          SizedBox(
                                            width: 132,
                                          )
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                    ],
                                  ),
                                ),
          
                                // Container(
                                //   padding: EdgeInsets.only(
                                //       left: 20, right: 20, bottom: 20),
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       color: Color.fromARGB(255, 227, 224, 224),
                                //       width: 1,
                                //     ),
                                //     borderRadius: BorderRadius.circular(10),
                                //     boxShadow: [
                                //       BoxShadow(
                                //         color: Color.fromARGB(255, 236, 234, 234)
                                //             .withOpacity(0.5),
                                //         spreadRadius: 2,
                                //         blurRadius: 5,
                                //         offset: Offset(0, 2),
                                //       ),
                                //     ],
                                //   ),
                                //   margin: EdgeInsets.only(
                                //       left: 20, right: 20, bottom: 10, top: 20),
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Dimens.boxHeight10,
                                //       Text("Consumption  water used for:",
                                //           style: Styles.blue14),
                                //       Dimens.boxHeight10,
                                //       Divider(
                                //         color: ColorValues.greyLightColour,
                                //       ),
                                //       Dimens.boxHeight10,
                                //       Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.end,
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Drinking in KL units'),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //               Dimens.boxHeight5,
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Module cleaning in KL unit'),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //           Spacer(),
                                //           Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.end,
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Domestic and other purpose in KL units'),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Container(
                                //   padding: EdgeInsets.only(
                                //       left: 20, right: 20, bottom: 20),
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       color: Color.fromARGB(255, 227, 224, 224),
                                //       width: 1,
                                //     ),
                                //     borderRadius: BorderRadius.circular(10),
                                //     boxShadow: [
                                //       BoxShadow(
                                //         color: Color.fromARGB(255, 236, 234, 234)
                                //             .withOpacity(0.5),
                                //         spreadRadius: 2,
                                //         blurRadius: 5,
                                //         offset: Offset(0, 2),
                                //       ),
                                //     ],
                                //   ),
                                //   margin: EdgeInsets.only(
                                //       left: 20, right: 20, bottom: 10, top: 20),
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Dimens.boxHeight10,
                                //       Text("Total Water:", style: Styles.blue14),
                                //       Dimens.boxHeight10,
                                //       Divider(
                                //         color: ColorValues.greyLightColour,
                                //       ),
                                //       Dimens.boxHeight10,
                                //       Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.end,
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Withdrawal in KL units'),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //           Spacer(),
                                //           Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.end,
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Consumed in KL units'),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Container(
                                //   padding: EdgeInsets.only(
                                //       left: 20, right: 20, bottom: 20),
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       color: Color.fromARGB(255, 227, 224, 224),
                                //       width: 1,
                                //     ),
                                //     borderRadius: BorderRadius.circular(10),
                                //     boxShadow: [
                                //       BoxShadow(
                                //         color: Color.fromARGB(255, 236, 234, 234)
                                //             .withOpacity(0.5),
                                //         spreadRadius: 2,
                                //         blurRadius: 5,
                                //         offset: Offset(0, 2),
                                //       ),
                                //     ],
                                //   ),
                                //   margin: EdgeInsets.only(
                                //       left: 20, right: 20, bottom: 10, top: 20),
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Dimens.boxHeight10,
                                //       Text("Total Groundwater Withdrawal:",
                                //           style: Styles.blue14),
                                //       Dimens.boxHeight10,
                                //       Divider(
                                //         color: ColorValues.greyLightColour,
                                //       ),
                                //       Dimens.boxHeight10,
                                //       Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.end,
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Yearly limit as per NOC in KL units'),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //           Spacer(),
                                //           Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.end,
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   CustomRichText(
                                //                       title:
                                //                           'Limit left in KL units'),
                                //                   Dimens.boxWidth10,
                                //                   GoodsOrderTextField(
                                //                     keyboardType:
                                //                         TextInputType.number,
          
                                //                     // textController:
                                //                     //     controller.girNoCtrlr,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          if (controller.openPurchaseDatePicker)
                            Positioned(
                              right: 65,
                              top: 130,
                              child: DatePickerWidget(
                                minDate: DateTime(DateTime.now().year),
                                maxDate: DateTime(DateTime.now().year, 13,
                                    0), // last date of this year
                                controller: DateRangePickerController(),
                                selectionChanges: (p0) {
                                  print('po valu ${p0.value.toString()}');
                                  controller.purchaseDateTc.text =
                                      DateFormat('yyyy-MM-dd').format(p0.value);
                                  controller.openPurchaseDatePicker =
                                      !controller.openPurchaseDatePicker;
                                  controller.update(['stock_Mangement']);
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // floatingActionButton: Row(
            //   children: [
            //     Spacer(),
            //     Container(
            //       height: 40,
            //       child: CustomElevatedButton(
            //         backgroundColor: ColorValues.cancelColor,
            //         text: 'Cancel',
            //         onPressed: () {
            //           Get.back();
            //         },
            //       ),
            //     ),
            //     Dimens.boxWidth15,
            //     Container(
            //       height: 40,
            //       child: CustomElevatedButton(
            //         backgroundColor: ColorValues.submitColor,
            //         text: 'Update',
            //         onPressed: () {
            //           // controller.createGoodsOrder();
            //         },
            //       ),
            //     ),
            //     Spacer(),
            //   ],
            // ),
          ),
        );
        // );
      },
    );
  }
}

class AppBarGoodsOrder extends StatelessWidget {
  const AppBarGoodsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Get.offNamed(Routes.misDashboard);
            },
            child: Text(" / MIS", style: Styles.greyLight14),
          ),
          Text(" /VIEW WATER DATA", style: Styles.greyLight14),
        ],
      ),
    );
  }
}
