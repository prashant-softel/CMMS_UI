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
      body: //
          // ScrollConfiguration(
          //  behavior: const ScrollBehavior().copyWith(overscroll: false),
          //  child: //
          Obx(
        () => //
            SingleChildScrollView(
          child: //
              Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (Responsive.isDesktop(context))
                // Expanded(
                //  child: //
                Container(
                  height: Get.height,
                  width: Get.width,
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
                      left: 200,
                      right: 200,
                      top: 120,
                      bottom: 120,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: (Get.width * .7) - 400,
                              height: Get.height - 240,
                              child: Image.asset(
                                'assets/files/soler.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start, //
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 20),
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
                                    color: ColorValues.greyColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    width: (Get.width * .3) - 50,
                                    child: LoginCustomTextfield(
                                      textController: controller.emailCtrlr,
                                      ishint: "Email Id",
                                      onChanged: (value) =>
                                          controller.updateemail(value),
                                      widget: Icon(
                                        Icons.email_outlined,
                                        color: ColorValues.greyLightColor,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                          Container(
                                  width: (Get.width * .3) - 50,
                                  child: LoginCustomTextfield(
                                    onfieldSubmitted: (Value) {
                                      controller.login();
                                    },
                                    textController: controller.passwordCtrlr,
                                    obscureText:
                                        controller.passwordVisible.value,
                                    ishint: "Password",
                                    onChanged: (value) =>
                                        controller.updatepassword(value),
                                    widget: MouseRegion(
                                      onEnter: (_) =>
                                          controller.passwordVisible(false),
                                      onExit: (_) =>
                                          controller.passwordVisible(true),
                                      child: Icon(
                                        controller.passwordVisible.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: ColorValues.greyLightColor,
                                      ),
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
                                        color: ColorValues.greyColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                Flexible(
                                  child: Container(
                                    width: (Get.width * .3) - 50,
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.navyBlueColor,
                                      text: "Login",
                                      onPressed: () {
                                        controller.login();
                                      },
                                    ),
                                  ),
                                ),
                                //Spacer(),
                              ])
                        ]),
                  ),
                  // ),
                ),

              ///
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
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
                            onChanged: (value) => controller.updateemail(value),
                            widget: Icon(
                              Icons.email_outlined,
                              color: ColorValues.greyLightColor,
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
                                color: ColorValues.greyLightColor,
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
                            width: Get.width,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: Dimens.fourteen),
                                backgroundColor: ColorValues.navyBlueColor,
                              ),
                              onPressed: () {
                                controller.login();
                              },
                              child: const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
