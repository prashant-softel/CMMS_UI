import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

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
          ),
          ListTile(
            leading: Icon(Icons.warning_amber),
            // title: Text('Warrenty'),
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
