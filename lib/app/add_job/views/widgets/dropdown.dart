import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors_value.dart';
import '../../../theme/dimens.dart';
import '../../add_job_controller.dart';

class DropdownWidget extends GetView<AddJobController> {
  DropdownWidget({
    super.key,
    this.selectedValue,
    this.isValueSelected,
    this.dropdownList,
    this.isEditable,
  });

  String? selectedValue;
  bool? isValueSelected;
  final List? dropdownList;
  final bool? isEditable;

  @override
  Widget build(BuildContext context) {
    final AddJobController addJobController = Get.find();
    return //
        Obx(
      () => //
          Container(
        //padding: EdgeInsets.symmetric(horizontal: 10.0),
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
              color: ColorsValue.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorsValue.whiteColor,
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
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorsValue.blackColor,
            ),
          ),
          popupProps: PopupProps.dialog(
            //
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsValue.blueColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsValue.blueColor),
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
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: ColorsValue.redColorDark),
              ),
              contentPadding: Dimens.edgeInsets05_0_5_0,
              hintText: "Select",
            ),
          ),
          onChanged: (String? _selectedValue) {
            selectedValue = _selectedValue ?? '';
            addJobController.valueChanged(dropdownList, selectedValue);
          },
          selectedItem: selectedValue,
        ),

        //     DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     dropdownColor: ColorsValue.whiteColor,
        //     isExpanded: true,
        //     value: selectedValue,
        //     hint: Text("Select"),
        //     icon: const Icon(Icons.arrow_downward),
        //     elevation: 50,
        //     style: const TextStyle(color: Colors.black),
        //     onChanged: (String? _selectedValue) {
        //       isValueSelected = true;
        //       selectedValue = _selectedValue ?? '';
        //       addJobController.valueChanged(dropdownList, selectedValue);
        //     },
        //     items: dropdownList?.map<DropdownMenuItem<String>>((model) {
        //       return DropdownMenuItem<String>(
        //         value: model?.name ?? '',
        //         child: Text(model?.name ?? ''),
        //       );
        //     }).toList(),
        //   ),
        // ),
      ),
    );
  }
}
