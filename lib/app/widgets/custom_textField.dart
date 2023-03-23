import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors_value.dart';
import '../theme/styles.dart';

class LoginCustomTextfield extends GetView {
  String? ishint;
  bool obscureText;
  Widget? widget;
  TextEditingController? textController;
  String? errorController;
  Function(dynamic value)? onChanged;
  LoginCustomTextfield({
    Key? key,
    this.ishint,
    this.obscureText = false,
    this.textController,
    this.widget,
    this.errorController,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textController,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: ColorsValue.whiteColor,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: ColorsValue.greyBorderColor,
            )),
        border: InputBorder.none,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: ColorsValue.greyBorderColor,
            )),
        errorStyle: TextStyle(
          height: 0,
        ),
        errorText: errorController,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        suffixIcon: widget,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: ColorsValue.greyBorderColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: ColorsValue.greyBorderColor,
            )),
        hintText: ishint,
        hintStyle: Styles.grey12,
      ),
    );
  }
}
