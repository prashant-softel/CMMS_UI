import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_values.dart';
import '../create_preventive_checklist_controller.dart';

class CreatePriventiveListScreen
    extends GetView<PreventiveCheckListController> {
  CreatePriventiveListScreen({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add CheckList'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorValues.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorValues.whiteColor,
        ),
      ),
    );
  }
}
