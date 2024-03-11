import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_values.dart';
import '../theme/styles.dart';

class LoginCustomTextfield extends GetView {
  String? ishint;
  bool obscureText;
  Widget? widget;
  TextEditingController? textController;
  FocusNode? focusNode;
  ScrollController? scroll;
  String? errorController;
  Function(dynamic value)? onChanged;
  Function()? ontap;
  final List<String>? autofillHints;
  Function(dynamic value)? onfieldSubmitted;
  int? maxLine;
  final bool numberTextField;
  bool enabled;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  double? width;

  LoginCustomTextfield({
    Key? key,
    this.ishint,
    this.numberTextField = false,
    this.focusNode,
    this.scroll,
    this.autofillHints,
    this.obscureText = false,
    this.textController,
    this.widget,
    this.errorController,
    this.onChanged,
    this.onfieldSubmitted,
    this.maxLine = 1,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.ontap,
    this.readOnly = false,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxLine == 1 ? 30 : null,
      width: width,
      child: TextFormField(
        style: GoogleFonts.lato(
          textStyle:
              TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
        ),
        //TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
        readOnly: readOnly,
        // keyboardType:keyboardType,
        enabled: enabled,
        onFieldSubmitted: onfieldSubmitted,
        onTap: ontap,
        maxLines: maxLine,
        onChanged: onChanged,
        controller: textController,
        focusNode: focusNode,
        scrollController: scroll,
        obscureText: obscureText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autofillHints: autofillHints,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 12),
          fillColor: readOnly == true
              ? Color.fromARGB(255, 206, 205, 205)
              : Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: ColorValues.greyBorderColor,
              )),
          border: InputBorder.none,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: ColorValues.greyBorderColor,
              )),
          errorStyle: TextStyle(
            height: 0,
          ),
          errorText: errorController,
          // contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          suffixIcon: widget,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: ColorValues.greyBorderColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: ColorValues.greyBorderColor,
              )),
          hintText: ishint,
          hintStyle: Styles.grey12,
        ),
      ),
    );
  }
}
