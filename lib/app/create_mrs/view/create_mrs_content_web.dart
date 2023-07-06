import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_mrs/create_mrs_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_richtext.dart';

class CreateMrsContentWeb extends GetView<CreateMrsController> {
  CreateMrsContentWeb({Key? key}) : super(key: key);
  final CreateMrsController controller = Get.find();

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
                      margin: Dimens.edgeInsets20,
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
                                  // textController: controller.loginIdCtrlr,
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
                                enabled: false,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 350,
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
                                      //  controller.addRowItem();
                                    },
                                    child: Icon(Icons.exposure_plus_1)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight15,
                    Container(
                      margin: EdgeInsets.only(bottom: 40, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.greenColor,
                              text: 'Submit',
                              onPressed: () {
                                // controller.addUser();
                                //  controller.saveAccessLevel();
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
                      ),
                    )
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
