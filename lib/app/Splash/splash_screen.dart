import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('${'hello'.tr}'),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                ...List.generate(
                  controller.stateList.length,
                  (index) => ListTile(
                    title: Text('${controller.stateList[index]?.id}'),
                    subtitle: Text('${controller.stateList[index]?.name}'),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
