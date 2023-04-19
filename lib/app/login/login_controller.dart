import 'package:cmms/app/login/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

import '../../domain/models/login_model.dart';

class LoginController extends GetxController {
  LoginController(this.loginPresenter);
  LoginPresenter loginPresenter;
  Rx<bool> passwordVisible = true.obs;

  var emailCtrlr = TextEditingController(text: "sujit@softeltech.in");
  var passwordCtrlr = TextEditingController(text: "Sujit123");

  final email = BehaviorSubject<String>();
  final password = BehaviorSubject<String>();

  @override
  void onInit() {
    super.onInit();

    email.add('');
    password.add('');
  }

  @override
  void onClose() {
    super.onClose();
    emailCtrlr.dispose();
    passwordCtrlr.dispose();
    email.close();
    password.close();
  }

  void updateemail(String value) => email.add(value);
  void updatepassword(String value) => password.add(value);
  void login() async {
    // {
    //   String pattern =
    //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    //   RegExp regExp = new RegExp(pattern);
    //   if (email.value.isEmpty || !regExp.hasMatch(email.value)) {
    //     Fluttertoast.showToast(
    //         msg: "Please enter valid Email ID", fontSize: 16.0);
    //   } else if (password.value.isEmpty) {
    //     Fluttertoast.showToast(msg: "Please enter password", fontSize: 16.0);
    //   } else if (email.value.isEmpty || password.value.isEmpty) {
    //     Fluttertoast.showToast(
    //         msg: "Email Id and Password are required", fontSize: 16.0);
    //   } else {
    String _userName = emailCtrlr.text.trim();
    String _password = passwordCtrlr.text.trim();
    LoginModel loginModel =
        LoginModel(userName: _userName, password: _password);
    var loginJsonString = loginModel.toJson();
    await loginPresenter.generateToken(
      auth: loginJsonString,
      isLoading: true,
    );
    // }
    // }
  }
}
