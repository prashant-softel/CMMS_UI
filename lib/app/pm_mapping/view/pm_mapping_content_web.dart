import 'package:cmms/app/app.dart';
import 'package:cmms/app/pm_mapping/pm_mapping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PmMappingContentWeb
    extends GetView<PmMappingController> {
  PmMappingContentWeb({Key? key}) : super(key: key);
  // final PreventiveCheckPointController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 45,
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
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: ColorValues.greyLightColor,
                  ),
                  Text(
                    "Dashboard",
                    style: Styles.greyLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / Preventive Maintenance",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / PM Mapping",
                      style: Styles.greyMediumLight12)
                ],
              ),

            ),
            
        ],
        ),
    
    );
  }
}
