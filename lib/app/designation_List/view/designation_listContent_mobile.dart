import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../designation_list_controller.dart';
// import '../module_list_controller.dart';

class DesignationListContentMobile extends GetView<DesignationListController> {
  DesignationListContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return //
        Scaffold(
      body: //
          Obx(
        () => Container(
          child: //
              Column(
            children: [
              Expanded(
                child: ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.designationList != null
                        ? controller.designationList?.length
                        : 0,
                    itemBuilder: (context, index) {
                      final roleModel =
                          // (controller.designationList != null)
                          controller.designationList![index];
                      // : DesignationModel();
                      return Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          color: Colors.lightBlue.shade50,
                          elevation: 10,
                          shadowColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Designation Id: ',
                                        style: const TextStyle(
                                            color: ColorValues.blackColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '${roleModel?.id ?? 0}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorValues.navyBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Text(
                                      'Designation:',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${roleModel?.name}'
                                        '',
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      //
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => controller.createModulelist(),
      //   backgroundColor: ColorValues.navyBlueColor,
      //   child: Icon(
      //     Icons.add,
      //     color: ColorValues.whiteColor,
      //   ),
      // ),
    );
  }

  ///
}
