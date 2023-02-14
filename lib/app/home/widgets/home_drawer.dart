import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});

  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 60,
      child: Column(
        children: [
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //   ),
          //   child: Center(
          //     child: Text('CMMS'),
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.wysiwyg_outlined),
            // title: Text('inventory'.tr),
            onTap: () {
              _homeController.currentBottomBarIndex = 0;
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            // title: Text('warrenty'.tr),
            onTap: () {
              _homeController.currentBottomBarIndex = 1;
              // RouteManagement.goToWarrantyScreen();
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            // title: Text(
            //   'Logout',
            //   style: Styles.red15.copyWith(
            //     color: Colors.red,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
