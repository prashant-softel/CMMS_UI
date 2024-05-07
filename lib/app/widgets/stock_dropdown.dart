import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';

/// DO NOT CHANGE THI FILE FOR THE TOP DROPDOWN. CREATE A NEW WIDGET.
class DropdownWebStock extends StatelessWidget {
  DropdownWebStock({
    super.key,
    this.selectedValue,
    this.isValueSelected,
    this.dropdownList,
    this.isEditable,
    required this.onValueChanged,
    this.controller,
    this.focusNode,
    this.width,
    this.margin,
  });

  String? selectedValue;
  bool? isValueSelected;
  final List? dropdownList;
  final bool? isEditable;
  Function(dynamic, dynamic) onValueChanged;
  final dynamic controller;
  final FocusNode? focusNode;
  double? width;
  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 227, 224, 224),
          width: 1,
        ),
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
        color: ColorValues.whiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Obx(
        () => DropdownSearch<String>(
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
            focusNode: focusNode,
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorValues.blackColor,
            ),
            iconSize: 24,
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
          ),
          popupProps: PopupProps.menu(
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
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
            dropdownSearchDecoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: ColorValues.redColorDark),
              ),
              contentPadding: Dimens.edgeInsets05_0_5_0,
              hintText: "Select",
            ),
          ),
          onChanged: (String? _selectedValue) {
            selectedValue = _selectedValue ?? '';
            onValueChanged(dropdownList, selectedValue);
          },
          selectedItem: selectedValue ?? "Please Select",
        ),
      ),
    );
  }
}
