import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/set_pm_schedule_model.dart';
import '../state_list_controller.dart';

class StateListContentWeb extends GetView<StateListController> {
  StateListContentWeb({Key? key}) : super(key: key);
  final StateListController controller = Get.find();
// void onInit() async{
//   controller.getStateList(1);
// }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(),
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
                  Get.offNamed(Routes.masterDashboard);
                },
                child:
                    Text(" / Masters".toUpperCase(), style: Styles.greyLight14),
              ),
              Text(" / State list".toUpperCase(), style: Styles.greyLight14)
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorValues.appBlueBackgroundColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: ColorValues.appBlueBackgroundColor,
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
            child: Obx(
              () => Container(
                // margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                //color: ColorValues.greyLightColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 227, 224, 224),
                          width: 1,
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "States",
                              style: Styles.blackBold18,
                            ),
                            Spacer(),
                            Text(
                              "Country:",
                              style: Styles.black16W500,
                            ),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            Container(
                              width: (MediaQuery.of(context).size.width * .3),
                              child: DropdownWebWidget(
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
                                controller: controller,
                                dropdownList: controller.countryList,
                                isValueSelected:
                                    controller.isSelectedcountry.value,
                                selectedValue: controller.selectedcountry.value,
                                onValueChanged: controller.onValueChanged,
                              ),
                            ),
                            Spacer(),
                            ActionButton(
                              icon: Icons.upload,
                              label: 'Import Schedule',
                              onPressed: () {},
                              color: ColorValues.appLightBlueColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Dimens.boxHeight20,
                    Row(
                      children: [
                        // Container(
                        //   height: 40,
                        //   margin: EdgeInsets.only(left: 10),
                        //   child: CustomElevatedButton(
                        //       backgroundColor: ColorValues.appLightBlueColor,
                        //       onPressed: () {},
                        //       text: 'Copy'),
                        // ),
                        // Container(
                        //   height: 40,
                        //   margin: EdgeInsets.only(left: 10),
                        //   child: CustomElevatedButton(
                        //       backgroundColor: ColorValues.appLightBlueColor,
                        //       onPressed: () {},
                        //       text: 'Excel'),
                        // ),
                        // Container(
                        //   height: 40,
                        //   margin: EdgeInsets.only(left: 10),
                        //   child: CustomElevatedButton(
                        //       backgroundColor: ColorValues.appLightBlueColor,
                        //       onPressed: () {},
                        //       text: 'PDF'),
                        // ),
                        // Container(
                        //   height: 40,
                        //   margin: EdgeInsets.only(left: 10),
                        //   child: CustomElevatedButton(
                        //       backgroundColor: ColorValues.appLightBlueColor,
                        //       onPressed: () {},
                        //       text: 'Column Visibility'),
                        // ),
                        Spacer(),
                        Container(
                          width: 200,
                          height: 40,
                          margin: Dimens.edgeInsets0_0_16_0,
                          child: Tooltip(
                            showDuration: const Duration(seconds: 2),
                            waitDuration: const Duration(seconds: 1),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: ColorValues.appLightBlueColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            textStyle: TextStyle(color: Colors.white),
                            preferBelow: true,
                            verticalOffset: 20,
                            message:
                                "Note: Date Should be ${'"YYYY-MM-DD"'} Format in Excel File\nPM Execution will be scheduled for mapped frequencies only",
                            child: TextField(
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16.0,
                                    height: 1.0,
                                    color: Colors.black),
                              ),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                contentPadding: Dimens.edgeInsets10_0_0_0,
                                hintText: 'search'.tr,
                                hintStyle: Styles.grey12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: Dimens.edgeInsets15,
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
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 500,
                                child: ScrollableTableView(
                                  paginationController:
                                      controller.paginationController,
                                  columns: [
                                    "Id",
                                    "States",
                                  ].map((column) {
                                    return TableViewColumn(
                                      label: column,
                                      minWidth: Get.width * 0.15,
                                    );
                                  }).toList(),
                                  rows: [
                                    ...List.generate(
                                      controller.stateList?.length ?? 0,
                                      (index) {
                                        var stateListDetails =
                                            controller.stateList?[index];
                                        return [
                                          '${stateListDetails?.id}',
                                          '${stateListDetails?.name ?? ''}',
                                        ];
                                      },
                                    ),
                                  ].map((record) {
                                    return TableViewRow(
                                      height: 80,
                                      cells: record.map((value) {
                                        if (value == record[0] ||
                                            value == record[1])
                                          return TableViewCell(
                                            child: Text(value.toString()),
                                          );
                                        return TableViewCell(
                                          child: Container(
                                              width: Get.width / 7,
                                              child: LoginCustomTextfield(
                                                // ontap: () {
                                                //   _selectDate(context, value);
                                                // },
                                                textController: (value
                                                        as FrequencyDates)
                                                    .schedule_date_value_controller,
                                                enabled:
                                                    (value as FrequencyDates)
                                                                .schedule_date !=
                                                            null
                                                        ? true
                                                        : false,
                                              )),
                                        );
                                      }).toList(),
                                    );
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
                              // Container(
                              //   margin: Dimens.edgeInsets15,
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       CustomRichText(title: "Comment:"),
                              //       Dimens.boxWidth10,
                              //       Container(
                              //           width: (Get.width * .6),
                              //           decoration: BoxDecoration(
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 color: Colors.black26,
                              //                 offset: const Offset(
                              //                   5.0,
                              //                   5.0,
                              //                 ),
                              //                 blurRadius: 5.0,
                              //                 spreadRadius: 1.0,
                              //               ),
                              //               BoxShadow(
                              //                 color: ColorValues.whiteColor,
                              //                 offset: const Offset(0.0, 0.0),
                              //                 blurRadius: 0.0,
                              //                 spreadRadius: 0.0,
                              //               ),
                              //             ],
                              //             color: ColorValues.whiteColor,
                              //             borderRadius:
                              //                 BorderRadius.circular(5),
                              //           ),
                              //           child: LoginCustomTextfield(
                              //             maxLine: 5,
                              //           )),
                              //     ],
                              //   ),
                              // ),
                              // // Container(
                              // //   margin: EdgeInsets.only(bottom: 30),
                              // //   child: Row(
                              // //     mainAxisAlignment: MainAxisAlignment.center,
                              // //     children: [
                              // //       Container(
                              // //         height: 35,
                              // //         child: CustomElevatedButton(
                              // //           backgroundColor: ColorValues.greenColor,
                              // //           text: 'Submit',
                              // //           onPressed: () {
                              // //             controller.savePmSchedule();
                              // //           },
                              // //         ),
                              // //       ),
                              // //       SizedBox(
                              // //         width: 20,
                              // //       ),
                              // //       Container(
                              // //         height: 35,
                              // //         child: CustomElevatedButton(
                              // //           backgroundColor:
                              // //               ColorValues.appDarkBlueColor,
                              // //           text: "View History",
                              // //           onPressed: () {},
                              // //         ),
                              // //       ),
                              // //     ],
                              // //   ),
                              // // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, FrequencyDates value) async {
    DateTime today = DateTime.now();
    var date = await showDatePicker(
      context: context,
      cancelText: "Clear",
      confirmText: "Ok",
      initialDate: DateTime(today.year, today.month, today.day),
      firstDate: DateTime(1900),
      lastDate: DateTime(today.year + 18, today.month, today.day),
    );
    value.schedule_date_value_controller?.text =
        date.toString().substring(0, 10);
  }
}
