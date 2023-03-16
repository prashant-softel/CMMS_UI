import 'package:cmms/app/preventive_maintanance/preventive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPlantDropdownWidget extends GetView<PreventiveController> {
  const SelectPlantDropdownWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.lightBlue.shade50,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: controller.selectedFacility.value,
          icon: const Icon(Icons.arrow_downward),
          elevation: 9,
          style: const TextStyle(color: Colors.black),
          onChanged: (String? selectedValue) {
            controller.isFacilitySelected.value = true;
            controller.selectedFacility.value = selectedValue ?? '';
          },
          items:
              controller.facilityList.map<DropdownMenuItem<String>>((facility) {
            return DropdownMenuItem<String>(
              value: facility?.name ?? '',
              child: Text(facility?.name ?? ''),
            );
          }).toList(),
        ),
      ),
    );
  }
}
