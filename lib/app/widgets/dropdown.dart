import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';

class DropdownWidget extends StatelessWidget {
  DropdownWidget({
    super.key,
    this.selectedValue,
    this.isValueSelected,
    this.dropdownList,
    this.isEditable,
    required this.onValueChanged,
    this.controller,
    this.focusNode,
  });

  String? selectedValue;
  bool? isValueSelected;
  final List? dropdownList;
  final bool? isEditable;
  Function(dynamic, dynamic) onValueChanged;
  final dynamic controller;
  final FocusNode? focusNode;

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return //
        Obx(
      () => //
          Container(
        margin: Dimens.edgeInsets16,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 4,
          minWidth: 100,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
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
          // popupProps: PopupProps.dialog(
          //   //
          //   searchFieldProps: TextFieldProps(
          //     decoration: InputDecoration(
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: ColorValues.blueColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: ColorValues.blueColor),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //     ),
          //   ),
          //   showSearchBox: true,
          //   showSelectedItems: true,
          // ),
          items: dropdownList?.map<String>((item) => item.name).toList() ?? [],
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
          selectedItem: selectedValue,
        ),
      ),
    );
  }
}
