import 'package:flutter/material.dart';

import '../theme/colors_value.dart';
import '../theme/styles.dart';

class LoginCustomTextfield extends StatefulWidget {
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
  State<LoginCustomTextfield> createState() => _LoginCustomTextfieldState();
}

class _LoginCustomTextfieldState extends State<LoginCustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.textController,
      obscureText: widget.obscureText,
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
        errorText: widget.errorController,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        suffixIcon: widget.widget,
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
        hintText: widget.ishint,
        hintStyle: Styles.grey12,
      ),
    );
  }
}
