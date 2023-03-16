import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HeaderWidget extends StatefulWidget {
  String? userName;
  RxList<FacilityModel?>? facilityList;
  bool isFacilitySelected;
  String? selectedFacility;
  HeaderWidget({
    Key? key,
    this.userName,
    this.facilityList,
    this.isFacilitySelected = false,
    this.selectedFacility,
  }) : super(key: key);
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: ColorsValue.whiteColor, boxShadow: [
        new BoxShadow(
            color: Color.fromARGB(255, 240, 237, 237),
            offset: Offset(0.0, 0.0)),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset(
                'assets/files/logo.png',
                // height: 120,
              ),
            ),
          // Obx(
          //   () => DropdownButtonHideUnderline(
          //     child: DropdownButton(
          //       //isExpanded: true,
          //       value: widget.selectedFacility,
          //       icon: const Icon(Icons.arrow_downward),
          //       elevation: 9,
          //       style: const TextStyle(color: Colors.black),
          //       onChanged: (String? selectedValue) {
          //         widget..isFacilitySelected = true;
          //         widget.selectedFacility = selectedValue ?? '';
          //         //controller.switchFacility(selectedValue);
          //       },
          //       items: widget.facilityList
          //           ?.map<DropdownMenuItem<String>>((facility) {
          //         return DropdownMenuItem<String>(
          //           value: facility?.name ?? '',
          //           child: Text(facility?.name ?? ''),
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // ),

          Spacer(),
          if (Responsive.isDesktop(context))
            Icon(Icons.notifications_active, color: ColorsValue.greyLightColor),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: ColorsValue.blueMediumColor,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Color.fromARGB(255, 206, 200, 200),
                    child:
                        Icon(Icons.person, color: ColorsValue.blueMediumColor),
                  ), // icon
                  if (Responsive.isDesktop(context))
                    SizedBox(width: 5), // space between icon and text
                  if (Responsive.isDesktop(context))
                    Text(
                      '${widget.userName ?? "Sujit Kumar"}',
                      style: TextStyle(
                        color: Colors.black, // text color
                        fontSize: 12, // text size
                        fontWeight: FontWeight.w500, // text weight
                      ),
                    ),
                  Icon(Icons.keyboard_arrow_down_outlined,
                      color: ColorsValue.blackColor),
                ],
              ),
            ),
          ),
          if (Responsive.isMobile(context) || Responsive.isTablet(context))
            Icon(Icons.notifications_active, color: ColorsValue.blackColor),
        ],
      ),
    );
  }
}
