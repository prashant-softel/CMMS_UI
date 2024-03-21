import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidgetMobile extends GetView<HomeController> {
  HeaderWidgetMobile({super.key, this.onPressed});
  final HomeController controller = Get.find<HomeController>();
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: ColorValues.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Container(
                width: Get.width * .8,
                height: 45,
                child: DropdownWebWidget(
                  controller: controller,
                  dropdownList: controller.facilityList,
                  isValueSelected: controller.isFacilitySelected.value,
                  selectedValue: controller.selectedFacility.value,
                  onValueChanged: controller.onValueChanged,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.date_range),
              padding: EdgeInsets.zero,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
