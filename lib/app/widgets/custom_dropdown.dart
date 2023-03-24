import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends GetView {
  String? value;
  Widget? ishint;
  Function(String? selectedValue)? onChange;
  List<DropdownMenuItem<String>>? item;
  CustomDropDownButton(
      {Key? key, this.value, this.onChange, this.item, this.ishint})
      : super(key: key);

//   @override
//   State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
// }

//class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          elevation: 9,
          style: const TextStyle(color: Colors.black),
          onChanged: onChange,
          items: item),
    );
  }
}
