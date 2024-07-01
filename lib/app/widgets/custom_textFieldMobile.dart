import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/color_values.dart';
import '../theme/styles.dart';
import '../utils/responsive.dart';

class CustomTextfieldMobile extends GetView {
  String? hintText;
  bool obscureText;
  Widget? widget;
  TextEditingController? textController;
  FocusNode? focusNode;
  ScrollController? scroll;
  String? errorText;
  Function(dynamic value)? onChanged;
  Function()? onTap;
  final List<String>? autofillHints;
  Function(dynamic value)? onFieldSubmitted;
  int? maxLines;
  final bool numberTextField;
  bool enabled;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  double? width;
  ScrollController? scrollController;
  InputDecoration? decoration;
  String? Function(String?)? validator;

  CustomTextfieldMobile({
    Key? key,
    this.hintText,
    this.numberTextField = false,
    this.focusNode,
    this.decoration,
    this.scroll,
    this.autofillHints,
    this.obscureText = false,
    this.textController,
    this.widget,
    this.onChanged,
    this.errorText,
    this.onFieldSubmitted,
    this.maxLines,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.onTap,
    this.readOnly = false,
    this.width,
    this.scrollController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobileOrTablet =
        Responsive.isMobile(context) || Responsive.isTablet(context);

    InputDecoration inputDecoration = InputDecoration(
      isDense: true,
      fillColor: readOnly ? Color.fromARGB(255, 206, 205, 205) : Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      errorStyle: TextStyle(
        height: 0,
      ),
      errorText: errorText,
      suffixIcon: widget,
      hintText: hintText,
      hintStyle: Styles.grey12,
    );

    return SizedBox(
      height: maxLines == 1 ? 30 : null,
      width: width,
      child: Container(
        decoration: isMobileOrTablet
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(5.0, 5.0),
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
              )
            : null,
        child: TextFormField(
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          ),
          readOnly: readOnly,
          enabled: enabled,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          validator: validator,
          maxLines: maxLines ?? null,
          onChanged: onChanged,
          controller: textController,
          focusNode: focusNode,
          scrollController: scrollController,
          obscureText: obscureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          autofillHints: autofillHints,
          decoration: inputDecoration,
        ),
      ),
    );
  }
}
