import 'package:cmms/app/app.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class MrsApproveContentWeb extends GetView<MrsApproveController> {
  MrsApproveContentWeb({Key? key}) : super(key: key);
  final MrsApproveController controller = Get.find();

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
                Text(" / MATERIAL REQUISITION  APPROVAL",
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
                            "Material Requisition Approval ",
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
                          Dimens.boxWidth8,
                          Container(
                            height: 30,
                            child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () async {},
                                text:
                                    "Waing For Approval" // "${controller.pmtaskViewModel.value?.status_name ?? ""}",
                                ),
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
                                'Requested By:',
                                style: Styles.black17,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'Activity:',
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
                                  "Sujit Kumar",
                                  style: Styles.blue17),
                              Dimens.boxHeight10,
                              Text(
                                  // controller.userDetailModel.value
                                  //        ?.first_name ??
                                  "Repairing",
                                  style: Styles.blue17),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Requested Date Time: ',
                                style: Styles.black17,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'Where Used: ',
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
                              Dimens.boxHeight10,
                              Text(
                                  // controller
                                  // .userDetailModel.value?.last_name ??
                                  "JC3435",
                                  style: Styles.blue17),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height, //300,
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
                                "Asset Type",
                                "Image",
                                "Requested Qty.",
                                "Approved Qty.",
                                "issued Qyt."
                              ].map((column) {
                                return TableViewColumn(
                                  label: column,
                                  minWidth: Get.width * 0.15,
                                );
                              }).toList(),
                              rows: [
                                [
                                  "String custucorre JQ325890",
                                  "Spare",
                                  "No Image",
                                  "2",
                                  "4",
                                  "4"
                                ],
                                [
                                  "String custucorre JQ325890",
                                  "Spare",
                                  "No Image",
                                  "2",
                                  "4",
                                  "4"
                                ],
                                [
                                  "String custucorre JQ325890",
                                  "Spare",
                                  "No Image",
                                  "2",
                                  "4",
                                  "4"
                                ],
                              ].map((record) {
                                return TableViewRow(
                                  height: 90,
                                  cells: record.map((value) {
                                    return TableViewCell(
                                      child: value == record[1] ||
                                              value == record[2]
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
