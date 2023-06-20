import 'package:cmms/app/app.dart';
import 'package:cmms/app/mrs_return/mrs_return_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class MrsReturnContentWeb extends GetView<MrsReturnController> {
  MrsReturnContentWeb({Key? key}) : super(key: key);
  final MrsReturnController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        // () =>
        Container(
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
                Text(" / MATERIAL RETURN SLIP ",
                    style: Styles.greyMediumLight12)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                // margin: Dimens.edgeInsets20,
                color: Color.fromARGB(255, 245, 248, 250),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Return Equipments ",
                            style: Styles.blackBold16,
                          ),
                          Spacer(),
                          Text(
                            "MRS ID:",
                            style: Styles.black17,
                          ),
                          Text(
                            "MRS001",
                            style: Styles.blue17,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorValues.greyLightColour,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 70, top: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //     margin: Dimens.edgeInsets30_0_0_0,
                          //     child:
                          Dimens.boxWidth30,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Approval Date Time:',
                                style: Styles.black17,
                              ),
                            ],
                          ),
                          Dimens.boxWidth20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  //  controller
                                  // .userDetailModel.value?.user_name ??
                                  "23-04-2023  12:30:30",
                                  style: Styles.blue17),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Issue Date Time: ',
                                style: Styles.black17,
                              ),
                            ],
                          ),
                          Dimens.boxWidth20,

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  // controller
                                  // .userDetailModel.value?.user_name ??
                                  "23-04-2023  12:30:30",
                                  style: Styles.blue17),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height,
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  "Equipments",
                                  style: Styles.blue700,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorValues.greyLightColour,
                          ),
                          Expanded(
                            child: ScrollableTableView(
                              columns: [
                                "Equipment Name",
                                "Serial Number",
                                "Available Qty.",
                                "Return Qty",
                                "Asset Type",
                                "Remark"
                              ].map((column) {
                                return TableViewColumn(
                                  label: column,
                                  minWidth: Get.width * 0.15,
                                );
                              }).toList(),
                              rows: [
                                [
                                  "String custucorre JQ325890",
                                  "Ser001",
                                  "6",
                                  "1",
                                  "Fresh",
                                  ""
                                ],
                                [
                                  "String custucorre JQ325890",
                                  "Ser001",
                                  "6",
                                  "1",
                                  "Fresh",
                                  ""
                                ],
                                [
                                  "String custucorre JQ325890",
                                  "Ser001",
                                  "6",
                                  "1",
                                  "Fresh",
                                  ""
                                ],
                              ].map((record) {
                                return TableViewRow(
                                  height: 90,
                                  cells: record.map((value) {
                                    return TableViewCell(
                                      child: value == record[1] ||
                                              value == record[1]
                                          ? Text(value)
                                          : Container(
                                              height: 45,
                                              width: Get.width / 8,
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
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(value),
                                              ) // LoginCustomTextfield(t)
                                              ),
                                    );
                                  }).toList(),
                                );
                              }).toList(),
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
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 35,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.appRedColor,
                                    text: "Concel",
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 35,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.greenColor,
                                    text: 'Submit',
                                    onPressed: () {
                                      // controller.savePmSchedule();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
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
      //  ),
    );
  }
}
