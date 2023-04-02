import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../navigators/app_pages.dart';
// import '../preventive_list_controller.dart';

class NewPermitMobile
    extends GetView<NewPermitController> {
  NewPermitMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return //
        Scaffold(
      body: //
          Container(
        child: //
            Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.createCheckList,
          );
          // controller.createChecklist();
        },
        backgroundColor: ColorValues.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorValues.whiteColor,
        ),
      ),
    );
  }

  ///
}
