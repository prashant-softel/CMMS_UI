import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/styles.dart';

class CheckListOfObservationWeb extends StatelessWidget {
  CheckListOfObservationWeb({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
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
                InkWell(
            onTap: () {
              Get.offNamed(Routes.home);
            },
            child: Text(
              "DASHBOARD",
              style: Styles.greyLight14,
            ),
          ),
                InkWell(
                  onTap: () {
                    Get.offNamed(Routes.misDashboard);
                  },
                  child: Text(" / MIS", style: Styles.greyMediumLight12),
                ),
                Text(" / CHECKLIST INSPECTION ",
                    style: Styles.greyMediumLight12),
              ],
            ),
          ),
          Center(child: Text("CHECKLIST INSPECTION"))
        ],
      ),
    );
  }
}
