import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidgetMobile extends GetView<HomeController> {
  HeaderWidgetMobile({
    super.key,
  });
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: ColorValues.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => Container(
                width: Get.width * .5,
                height: 35,
                child: DropdownWebWidget(
                  controller: controller,
                  dropdownList: controller.facilityList,
                  isValueSelected: controller.isFacilitySelected.value,
                  selectedValue: controller.selectedFacility.value,
                  onValueChanged: controller.onValueChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
