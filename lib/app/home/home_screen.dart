import 'package:cmms/app/app.dart';
import 'package:cmms/app/warranty/warranty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Scaffold(
          appBar: AppBar(
            title: Text('${'hello'.tr}'),
          ),
          drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
              ? HomeDrawer()
              : null,
          body: Row(
            children: [
              Responsive.isMobile(context) || Responsive.isTablet(context)
                  ? Dimens.box0
                  : HomeDrawer(),
              Expanded(
                child: Center(
                  child: Container(
                    margin: Dimens.edgeInsets16,
                    height: Get.height,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: Get.width,
                    ),
                    child:
                        _controller.pages[_controller.currentBottomBarIndex] ==
                                0
                            ? InventoryModule()
                            : WarrentyScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
