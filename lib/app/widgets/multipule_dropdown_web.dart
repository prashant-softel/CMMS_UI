import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color_values.dart';

class MultipDropdownWebWidget extends StatefulWidget {
  String? selectedValue;
  bool? isValueSelected;
  final List? dropdownList;
  final bool? isEditable;
  final dynamic controller;
  final FocusNode? focusNode;
  double? width;
  double? height;
  EdgeInsetsGeometry? margin;
  List<BoxShadow>? boxShadow;
  List<dynamic> selectedItems;
  Function(dynamic, dynamic) onValueChanged;

  MultipDropdownWebWidget(
      {super.key,
      this.selectedValue,
      this.isValueSelected,
      this.isEditable,
      this.controller,
      required this.onValueChanged,
      this.focusNode,
      this.width,
      this.margin,
      this.boxShadow,
      this.height,
      required this.dropdownList,
      required this.selectedItems});

  @override
  State<MultipDropdownWebWidget> createState() =>
      _MultipDropdownWebWidgetState();
}

class _MultipDropdownWebWidgetState extends State<MultipDropdownWebWidget> {
  ///
  @override
  Widget build(BuildContext context) {
    ///
    return //

        Obx(
      () => Container(
          // color: ColorValues.greyBorderColor,
          height: 40, // MediaQuery.of(context).size.height * 0.040,
          width: widget.width,
          // margin: widget.margin,
          // padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color.fromARGB(255, 186, 184, 184),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                // offset: const Offset(
                //   5.0,
                //   5.0,
                // ),
                // blurRadius: 5.0,
                // spreadRadius: 1.0,
              ),
              BoxShadow(
                  // color: ColorValues.whiteColor,
                  // offset: const Offset(0.0, 0.0),
                  // blurRadius: 0.0,
                  // spreadRadius: 0.0,
                  ),
            ],
            color: ColorValues.whiteColor,
          ),
          child: //

              SingleChildScrollView(
            child: DropdownSearch<String>.multiSelection(
                items: widget.dropdownList
                        ?.map<String>((item) => item.name)
                        .toList() ??
                    [], //widget.items,
                popupProps: PopupPropsMultiSelection.menu(
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorValues.appBlueBackgroundColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorValues.appBlueBackgroundColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  showSelectedItems: true,
                  onItemAdded: (selectedItems, addedItem) {},
                  // disabledItemFn: (String s) => s.startsWith('I'),
                  showSearchBox: true,
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: ColorValues.redColorDark),
                      ),
                      // contentPadding: EdgeInsets.all(5),
                      hintText: "Select",
                      suffixIcon: null),
                ),
                onChanged: (List<String>? _selectedValue) {
                  widget.selectedItems = _selectedValue ?? [];
                  widget.onValueChanged(
                      widget.dropdownList, widget.selectedItems);
                },
                selectedItems: widget.selectedItems
                    .map<String>((item) => item.name)
                    .toList() //["Brazil"],
                ),
          )),
    );
  }
}
  //  popupProps: PopupProps.menu(menuProps: MenuProps()),