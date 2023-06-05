import 'package:flutter/material.dart';
import 'package:cmms/app/app.dart';

class CustomTextFieldForInventory extends StatelessWidget {
  const CustomTextFieldForInventory({
    Key? key,
    this.label,
    this.maxLine = 1,
    this.width,
    this.textController,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.decoration,
    this.alignment,
  }) : super(key: key);

  final String? label;
  final int? maxLine;
  final double? width;
  final bool readOnly;
  final Icon? suffixIcon;
  final String? hintText;
  final Function()? onTap;
  final InputDecoration? decoration;
  final Alignment? alignment;

  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      ),
      height: 45,
      margin: Dimens.edgeInsets16,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 4,
        minWidth: 100,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextFormField(
                onTap: onTap,
                readOnly: readOnly,
                controller: textController,
                maxLines: maxLine,
                decoration: InputDecoration(
                  contentPadding: Dimens.edgeInsets16_0_16_0,
                  filled: true,
                  fillColor: readOnly == true
                      ? Color.fromARGB(255, 206, 205, 205)
                      : Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(),
                  suffixIcon: suffixIcon,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
