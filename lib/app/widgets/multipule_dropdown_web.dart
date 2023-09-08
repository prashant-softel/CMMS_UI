import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../theme/color_values.dart';
import '../theme/dimens.dart';

class MultipDropdownWebWidget extends StatefulWidget {
  String? selectedValue;
  bool? isValueSelected;
  final List? dropdownList;
  final bool? isEditable;
  final dynamic controller;
  final FocusNode? focusNode;
  double? width;
  EdgeInsetsGeometry? margin;
  List<BoxShadow>? boxShadow;
  List<dynamic> selectedItems;
  MultipDropdownWebWidget(
      {super.key,
      this.selectedValue,
      this.isValueSelected,
      this.isEditable,
      this.controller,
      this.focusNode,
      this.width,
      this.margin,
      this.boxShadow,
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
          // height: MediaQuery.of(context).size.height * 0.040,
          width: widget.width,
          // margin: widget.margin,
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(255, 227, 224, 224),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: //

              DropdownSearch<String>.multiSelection(
                  items: widget.dropdownList
                          ?.map<String>((item) => item.name)
                          .toList() ??
                      [], //widget.items,
                  popupProps: PopupPropsMultiSelection.menu(
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
                    showSelectedItems: true,
                    onItemAdded: (selectedItems, addedItem) {},
                    disabledItemFn: (String s) => s.startsWith('I'),
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
                      contentPadding: Dimens.edgeInsets05_0_5_0,
                      hintText: "Select",
                    ),
                  ),
                  onChanged: print,
                  selectedItems: widget.selectedItems
                      .map<String>((item) => item.name)
                      .toList() //["Brazil"],
                  )),
    );
  }
}
  //  popupProps: PopupProps.menu(menuProps: MenuProps()),