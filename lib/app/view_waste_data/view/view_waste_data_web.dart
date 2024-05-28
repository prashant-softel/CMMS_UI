import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_waste_data/view_waste_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class ViewWasteDataWeb extends StatefulWidget {
  ViewWasteDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewWasteDataWeb> createState() => _WasteDataWebState();
}

class _WasteDataWebState extends State<ViewWasteDataWeb> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewWasteDataController>(
      id: 'waste-controller',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 450),
                    margin: EdgeInsets.only(
                      left: Responsive.isDesktop(context)
                          ? homeController.menuButton.value
                              ? 250.0
                              : 70.0
                          : 0,
                    ),
                    color: Color.fromARGB(255, 234, 236, 238),
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      children: [
                        HeaderWidget(),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 227, 224, 224),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 236, 234, 234)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.home,
                                color: ColorValues.greyLightColor,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(Routes.home);
                                },
                                child: Text(
                                  "DASHBOARD",
                                  style: Styles.greyLight14,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.clearStoreData();
                                  Get.offNamed(Routes.misDashboard);
                                },
                                child:
                                    Text(" / MIS", style: Styles.greyLight14),
                              ),
                              Text(" / VIEW WASTE DATA",
                                  style: Styles.greyLight14),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Responsive.isDesktop(context)
                      ? AnimatedPositioned(
                          duration: Duration(milliseconds: 450),
                          child: HomeDrawer(),
                        )
                      : Dimens.box0,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
