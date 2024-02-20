import 'package:cmms/app/change_password/change_password_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_textField.dart';

class ChangePasswordContentWeb extends GetView<ChangePasswordController> {
  ChangePasswordContentWeb({super.key});

  ///
  var controller = Get.find<ChangePasswordController>();
  @override
  Widget build(BuildContext context) {
    return
        //Obx(
        // () =>
        SelectionArea(
          child: SingleChildScrollView(
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
                      Get.offNamed(Routes.setting);
                    },
                    child: Text(" / SETTING", style: Styles.greyMediumLight12),
                  ),
                  Text(
                    " / CHANGE PASSWORD",
                    style: Styles.greyMediumLight12,
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              child: Card(
                color: ColorValues
                    .appBlueBackgroundColor, //Color.fromARGB(255, 240, 242, 243),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.only(
                  left: 400,
                  right: 400,
                  top: 100,
                  bottom: 320,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dimens.boxHeight10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Change Password",
                        style: Styles.blackBold16,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 45,
                              child: LoginCustomTextfield(
                                //  width: MediaQuery.of(context).size.width / 5,
                                ishint: "Current Password",
                              ),
                            ),
                            Dimens.boxHeight10,
                            SizedBox(
                              height: 45,
                              child: LoginCustomTextfield(
                                //  width: MediaQuery.of(context).size.width / 5,
                                ishint: "New Password",
                              ),
                            ),
                            Dimens.boxHeight10,
                            SizedBox(
                              height: 45,
                              child: LoginCustomTextfield(
                                //  width: MediaQuery.of(context).size.width / 5,
                                ishint: "Confirm New Password",
                              ),
                            ),
                            Dimens.boxHeight20,
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              //alignment: Alignment.center,
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: Dimens.fourteen),
                                  backgroundColor: ColorValues.submitColor,
                                ),
                                onPressed: () {
                                  // controller.login();
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
              ),
            ),
          ],
          // ),
                ),
              ),
        );
  }
}
