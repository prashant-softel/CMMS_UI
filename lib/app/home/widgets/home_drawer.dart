import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/dimens.dart';
import '../home_controller.dart';

class HomeDrawer extends GetView<HomeController> {
  HomeDrawer({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return

        ///
        Obx(
      () =>

          ///
          Drawer(
        width: 50,
        child: //
            Column(
                mainAxisSize: MainAxisSize.min,
                //
                children: [
              ///
              Dimens.boxHeight20,
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = controller.menuItems[index];

                  return ListTile(
                    //leading: Icon(item.icon),
                    title: Icon(item.icon),
                    //title: Text(item.title),
                    selected: index == controller.selectedIndex.value,
                    onTap: () => {
                      controller.selectedIndex.value = index,
                      Get.back(),
                    },
                  );
                },
              ),
              Spacer(),
              Icon(Icons.logout),
              Dimens.boxHeight20,
            ]),
      ),
    );

    ///
  }

  ///
}
