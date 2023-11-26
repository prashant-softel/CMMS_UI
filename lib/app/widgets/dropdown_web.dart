import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';

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
          boxShadow: boxShadow,
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
            focusNode: focusNode,
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorValues.blackColor,
            ),
          ),
          popupProps: PopupProps.menu(
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                isDense: true,
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
          items: dropdownList?.map<String>((item) => item.name).toList() ?? [],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              // isDense: true,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: ColorValues.redColorDark),
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 12),
              hintText: "Select",
            ),
          ),
          onChanged: (String? _selectedValue) {
            selectedValue = _selectedValue ?? '';
            onValueChanged(dropdownList, selectedValue);
          },
          selectedItem: selectedValue,
        ),
      ),
    );
  }
}
  //  popupProps: PopupProps.menu(menuProps: MenuProps()),