import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_controller.dart';

class HomeDrawer extends GetView<HomeController> {
  HomeDrawer({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return

        ///
        Obx(
      () => //
          ///
          Drawer(
        width: Get.width * 0.15,
        child: ListView.builder(
          itemCount: controller.menuItems.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return //
                  DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Center(
                  child: Text('CMMS'),
                ),
              );
            }

            final item = controller.menuItems[index - 1];

            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              selected: index == controller.selectedIndex.value,
              onTap: () => () {
                controller.selectedIndex.value = index;
                Get.back();
              },
            );
          },
        ),
      ),
    );

    ///
    // Drawer(
    //   width: 250,
    //   child: Column(
    //     children: [
    //       DrawerHeader(
    //         decoration: BoxDecoration(
    //           color: Colors.amber,
    //         ),
    //         child: Center(
    //           child: Text('CMMS'),
    //         ),
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.wysiwyg_outlined),
    //         title: Text('Inventory'),
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.warning_amber),
    //         title: Text('JobList'),
    //         onTap: () {
    //           controller.selectedIndex.value = 1;
    //           //navigatorKey.currentState?.pushNamed(Routes.jobList);
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.warning_amber),
    //         title: Text('Warranty'),
    //       ),
    //       Spacer(),
    //       ListTile(
    //         leading: Icon(
    //           Icons.logout,
    //           color: Colors.red,
    //         ),
    //         title: Text(
    //           'Logout',
    //           style: Styles.red15.copyWith(
    //             color: Colors.red,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  ///
}
