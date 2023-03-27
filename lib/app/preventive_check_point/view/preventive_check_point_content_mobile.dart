import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';
import '../preventive_check_point_controller.dart';

class PreventiveCheckPointContentMobile
    extends GetView<PreventiveCheckPointController> {
  PreventiveCheckPointContentMobile({Key? key}) : super(key: key);

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

      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  Routes.create_checkList;
        }, // => controller.createChecklist(),
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
