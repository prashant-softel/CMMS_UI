import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigators/app_pages.dart';
import '../../theme/colors_value.dart';
import '../preventive_list_controller.dart';

class PriventiveListScreen extends GetView<PreventiveListController> {
  PriventiveListScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preventive List'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.create_checkList,
          );
          // controller.createChecklist();
        },
        backgroundColor: ColorsValue.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorsValue.whiteColor,
        ),
      ),
    );
  }
}
