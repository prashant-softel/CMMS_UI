import 'package:cmms/app/theme/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/color_values.dart';

/// DO NOT CHANGE THI FILE FOR THE TOP DROPDOWN. CREATE A NEW WIDGET.
class DropdownWebWidget extends StatelessWidget {
  DropdownWebWidget(
      {super.key,
      this.selectedValue,
      this.isValueSelected,
      this.dropdownList,
      this.isEditable,
      required this.onValueChanged,
      this.controller,
      this.focusNode,
      this.width,
      this.margin,
      this.selectedId,
      this.boxShadow});

  String? selectedValue;
  bool? isValueSelected;
  final List? dropdownList;
  final bool? isEditable;
  Function(dynamic, dynamic) onValueChanged;
  final dynamic controller;
  final FocusNode? focusNode;
  double? width;
  EdgeInsetsGeometry? margin;
  List<BoxShadow>? boxShadow;
  int? selectedId;

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return //

        Obx(
      () => Container(
        height: MediaQuery.of(context).size.height * 0.040,
        width: width,
        margin: margin,
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
            ), //BoxShadow
            BoxShadow(
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: //

            DropdownSearch<String>(
          autoValidateMode: AutovalidateMode.always,
          validator: (String? item) {
            if (isValueSelected == false) {
              return "Required field";
            } else {
              return null;
            }
          },
          enabled: isEditable ?? true,
          dropdownButtonProps: DropdownButtonProps(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            focusNode: focusNode,
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorValues.blackColor,
            ),
          ),
          popupProps: PopupProps.menu(
            fit: FlexFit.loose,
            searchFieldProps: TextFieldProps(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              decoration: InputDecoration(
                // isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorValues.blueColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorValues.blueColor),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            showSearchBox: true,
            showSelectedItems: true,
          ),
          items: [
            'Please Select',
            ...?dropdownList?.map<String>((item) => item.name).toList()
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
            textAlign: TextAlign.left,
            dropdownSearchDecoration: InputDecoration(
              // isDense: true,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: ColorValues.redColorDark),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              hintText: "Please Select",
              hintStyle: Styles.grey12,
            ),
          ),
          onChanged: (String? _selectedValue) {
            selectedValue = _selectedValue ?? '';
            onValueChanged(dropdownList, selectedValue);
          },
          selectedItem: selectedValue ?? 'Please Select',
        ),
      ),
    );
  }
}
  //  popupProps: PopupProps.menu(menuProps: MenuProps()),