import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../home_controller.dart';
import '../../theme/color_values.dart';

class HomeDrawer extends GetView<HomeController> {
  HomeDrawer({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return
        //
        Obx(
      () =>
          //
          Drawer(
         width: Get.width * 0.15,
        child: //
            ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
                //
                children: [
                  ///
                  if (Responsive.isMobile(context))
                    DrawerHeader(
                      child: Center(
                        child: Image.asset(
                          'assets/files/logo.png',
                        ),
                      ),
                    ),

                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: ColorValues.appDarkBlueColor,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.menuItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = controller.menuItems[index];

                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0,
                            ),
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -3),

                            title: Row(
                              children: [
                                Image.asset(
                                  item.icon ?? "",
                                  height: 15,
                                  color: Color(0xffD2D0D0),
                                ),
                                Dimens.boxWidth10,
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    color: Color(0xffD2D0D0),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            //title: Text(item.title),
                            selected: index == controller.selectedIndex.value,
                            onTap: () => {
                              controller.selectedIndex.value = index,
                              Get.back(),
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );

    ///
  }

  ///
}
