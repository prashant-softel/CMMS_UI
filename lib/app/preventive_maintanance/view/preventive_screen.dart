import 'package:cmms/app/app.dart';
import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigators/app_pages.dart';

class PreventiveScreen extends GetView<PreventiveController> {
  PreventiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 90) / 10;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

    final double itemWidth = size.width / 3;

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (Responsive.isMobile(context))
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "Select Plant :",
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // SelectPlantDropdownWidget(),

                  // Card(
                  //   shadowColor: ColorsValue.greyColor,
                  //   elevation: 1,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(2.0),
                  //     child: DropdownButtonHideUnderline(
                  //       child: DropdownButton(
                  //         // isExpanded: true,
                  //         value: controller.selectedFacility.value,
                  //         icon:
                  //             const Icon(Icons.keyboard_arrow_down_outlined),
                  //         elevation: 9,
                  //         style: const TextStyle(color: Colors.black),
                  //         onChanged: (String? selectedValue) {
                  //           // controller.updateDropdownValue(selectedValue ?? "");
                  //           controller.isFacilitySelected.value = true;
                  //           controller.selectedFacility.value =
                  //               selectedValue ?? '';
                  //           print({
                  //             "selected value",
                  //             controller.selectedFacility.value
                  //           });
                  //           // controller.switchFacility(selectedValue);
                  //         },
                  //         items: controller.facilityList
                  //             .map<DropdownMenuItem<String>>((facility) {
                  //           return DropdownMenuItem<String>(
                  //             value: facility?.name ?? '',
                  //             child: Text(facility?.name ?? ''),
                  //           );
                  //         }).toList(),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        if (Responsive.isDesktop(context))
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Preventive Maintenance",
              style: TextStyle(
                  color: Color.fromARGB(255, 159, 156, 156),
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
          ),
        GridView.count(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          childAspectRatio: Responsive.isMobile(context)
              ? (itemWidth / itemHeight)
              : (itemWidth / itemHeightWeb),
          children: <Widget>[
            _priventiveList(
                tittle: "Create CheckList Number",
                ontap: () {
                  print("hii");
                  Get.toNamed(
                    Routes.create_checkList,
                  );
                }),
            _priventiveList(tittle: "Check Point Creator"),
            _priventiveList(tittle: "CheckList Mapping"),
            _priventiveList(tittle: "PM Schedule"),
            _priventiveList(tittle: "PM Schedule View"),
            _priventiveList(tittle: "PM Report"),
            _priventiveList(tittle: "PM Report"),
            _priventiveList(tittle: "PM Report"),
          ],
        )
      ]),
    );
  }

  _priventiveList({required String tittle, Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 28, 187, 245),
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.all(9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                tittle,
                style: TextStyle(
                    color: ColorValues.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 245, 245),
                border: Border.all(
                  color: ColorValues.whiteColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.format_list_bulleted,
                size: 30,
                color: Color.fromARGB(255, 28, 187, 245),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
