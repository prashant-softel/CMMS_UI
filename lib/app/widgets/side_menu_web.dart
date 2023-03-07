import 'package:cmms/app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors_value.dart';
import '../theme/styles.dart';

class SideMenuWeb extends StatelessWidget {
  SideMenuWeb({super.key});

  ///
  var homeController = Get.find<HomeController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => //
          Container(
        height: Get.height,
        width: Get.width * 0.15,
        child: Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.none,
              backgroundColor: ColorsValue.navyBlueColor,
              extended: true,

              minWidth: Get.width * 0.1,
              selectedIndex: homeController.selectedIndex.value,
              groupAlignment: homeController.groupAligment.value,
              onDestinationSelected: (int index) {
                homeController.selectedIndex.value = index;
              },
              unselectedIconTheme: IconThemeData(color: ColorsValue.whiteColor),
              unselectedLabelTextStyle: Styles.white16,
              //selectedLabelTextStyle: Styles.greyLight16,
              //labelType: homeController.labelType.value,
              leading: (homeController.showLeading.value == true)
                  ? Container(color: ColorsValue.yellowColor)
                  : const SizedBox(),
              trailing: homeController.showTrailing.value
                  ? Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: ColorsValue.whiteColor,
                          ),
                        ),
                        Text(
                          'Logout',
                          style: Styles.white14,
                        ),
                      ],
                    )
                  : const SizedBox(),
              destinations: [
                NavigationRailDestination(
                  padding: EdgeInsets.zero,
                  // icon: SizedBox(height: 50, child: Icon(Icons.inventory_outlined)),
                  // selectedIcon:
                  //     SizedBox(height: 50, child: Icon(Icons.inventory_outlined)),
                  // label: //
                  //     SizedBox(
                  //   //height: 100,
                  //   child: Text(
                  //     'Inventory',
                  //   ),
                  // ),
                  icon: Icon(Icons.inventory_outlined),
                  selectedIcon: Icon(Icons.inventory_outlined),
                  label: Text('Inventory'),
                ),
                NavigationRailDestination(
                  padding: EdgeInsets.zero,

                  //icon:
                  //     SizedBox(
                  //   height: 50,
                  //   child: //
                  //       Icon(Icons.warehouse_outlined),
                  // ),
                  // selectedIcon: SizedBox(
                  //   height: 50,
                  //   child: Icon(Icons.warehouse_outlined),
                  // ),
                  icon: Icon(Icons.warehouse_outlined),
                  selectedIcon: Icon(Icons.warehouse_outlined),
                  label: Text('Jobs'),
                ),
                NavigationRailDestination(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Warranty'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
