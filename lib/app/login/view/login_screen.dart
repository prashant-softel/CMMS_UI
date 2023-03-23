import 'package:cmms/app/app.dart';
import 'package:cmms/app/login/login_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_textfield.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Responsive.isDesktop(context))
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/files/banner.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Card(
                        color: Color.fromARGB(255, 240, 242, 243),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.only(
                            left: 200, right: 200, top: 120, bottom: 120),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width * .7) -
                                        400,
                                height:
                                    MediaQuery.of(context).size.height - 240,
                                child: Image.asset(
                                  'assets/files/soler.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 50, top: 20),
                                  child: Image.asset(
                                    'assets/files/logo.png',
                                  ),
                                ),
                                Text(
                                  'Sign in',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: ColorsValue.greyColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    width: (MediaQuery.of(context).size.width *
                                            .3) -
                                        50,
                                    child: LoginCustomTextfield(
                                      textController: controller.emailCtrlr,
                                      ishint: "Email Id",
                                      onChanged: (value) =>
                                          controller.updateemail(value),
                                      widget: Icon(
                                        Icons.email_outlined,
                                        color: ColorsValue.greyLightColor,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width * .3) -
                                          50,
                                  child: LoginCustomTextfield(
                                    textController: controller.passwordCtrlr,
                                    obscureText:
                                        controller.passwordVisible.value,
                                    ishint: "Password",
                                    onChanged: (value) =>
                                        controller.updatepassword(value),
                                    widget: IconButton(
                                      icon: Icon(
                                        controller.passwordVisible.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: ColorsValue.greyLightColor,
                                      ),
                                      onPressed: () =>
                                          controller.passwordVisible.toggle(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: ColorsValue.greyColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                    width: (MediaQuery.of(context).size.width *
                                            .3) -
                                        50,
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorsValue.navyBlueColor,
                                      text: "Login",
                                      onPressed: () {
                                        controller.login();
                                      },
                                    )),
                              ],
                            )
                          ],
                        )),
                  ),
                if (Responsive.isMobile(context) ||
                    Responsive.isTablet(context))
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 200, bottom: 70),
                        child: Image.asset(
                          'assets/files/logo.png',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            LoginCustomTextfield(
                              textController: controller.emailCtrlr,
                              ishint: "Email Id",
                              onChanged: (value) =>
                                  controller.updateemail(value),
                              widget: Icon(
                                Icons.email_outlined,
                                color: ColorsValue.greyLightColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            LoginCustomTextfield(
                              textController: controller.passwordCtrlr,
                              obscureText: controller.passwordVisible.value,
                              ishint: "Password",
                              onChanged: (value) =>
                                  controller.updatepassword(value),
                              widget: IconButton(
                                icon: Icon(
                                  controller.passwordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: ColorsValue.greyLightColor,
                                ),
                                onPressed: () =>
                                    controller.passwordVisible.toggle(),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorsValue.navyBlueColor,
                                  text: "Login",
                                  onPressed: () {
                                    controller.login();
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
