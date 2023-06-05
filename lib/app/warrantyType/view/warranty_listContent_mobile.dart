import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/models/modulelist_model.dart';
// import '../module_list_controller.dart';
import '../../../domain/models/warranty_model.dart';
import '../warranty_list_controller.dart';

class WarrantyListContentMobile
    extends GetView<WarrantyListController> {
  WarrantyListContentMobile({Key? key}) : super(key: key);

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
                    itemCount: controller.warrantyTypeList != null
                        ? controller.warrantyTypeList?.length
                        : 0,
                    itemBuilder: (context, index) {
                      final moduleModel =
                          (controller.warrantyTypeList != null)
                              ? controller.warrantyTypeList![index]
                              : WarrantyModel();
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
                                        'CheckList Id: ',
                                        style: const TextStyle(
                                            color: ColorValues.blackColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '${moduleModel?.id ?? 0}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorValues.navyBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Text(
                                      'Module Name: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${moduleModel?.name}'
                                        '',
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  // Row(//
                                  //     children: [
                                  //   Text(
                                  //     'Module: ',
                                  //     style: const TextStyle(
                                  //         color: ColorValues.blackColor,
                                  //         fontWeight: FontWeight.w400),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 5,
                                  //   ),
                                  //   Expanded(
                                  //     child: Text(
                                  //       moduleModel
                                  //               ?.moduleName ??
                                  //           '',
                                  //       style: const TextStyle(
                                  //         color: ColorValues.navyBlueColor,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   )
                                  // ]),
                                  // Row(children: [
                                  //   Text(
                                  //     'Feature: ',
                                  //     style: const TextStyle(
                                  //         color: ColorValues.blackColor,
                                  //         fontWeight: FontWeight.w400),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 5,
                                  //   ),
                                  //   Expanded(
                                  //     child: Text(
                                  //       "${moduleModel?.featureName ?? ''}",
                                  //       style: const TextStyle(
                                  //         color: ColorValues.navyBlueColor,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   )
                                  // ]),
                                  // Row(children: [
                                  //   Column(
                                  //     children: [
                                  //       Text(
                                  //         'Menu Image',
                                  //         style: const TextStyle(
                                  //             color: ColorValues.blackColor,
                                  //             fontWeight: FontWeight.w400),
                                  //       ),
                                  //       Text(
                                  //         "${moduleModel?.menuImage ?? ''} min.",
                                  //         style: const TextStyle(
                                  //           color: ColorValues.navyBlueColor,
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  //   Expanded(
                                  //     child: Column(
                                  //       children: [
                                  //         Text(
                                  //           'Add',
                                  //           style: const TextStyle(
                                  //               color: ColorValues.blackColor,
                                  //               fontWeight: FontWeight.w500),
                                  //         ),
                                  //         Text(
                                  //           "${moduleModel?.add ?? ''}",
                                  //           style: const TextStyle(
                                  //             color: ColorValues.navyBlueColor,
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   )
                                  // ]),
                                  // Row(children: [
                                  //   Column(
                                  //     children: [
                                  //       Text(
                                  //         'Edit',
                                  //         style: const TextStyle(
                                  //             color: ColorValues.blackColor,
                                  //             fontWeight: FontWeight.w400),
                                  //       ),
                                  //       Text(
                                  //         "${moduleModel?.edit ?? ''} min.",
                                  //         style: const TextStyle(
                                  //           color: ColorValues.navyBlueColor,
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  //   Expanded(
                                  //     child: Column(
                                  //       children: [
                                  //         Text(
                                  //           'Delete',
                                  //           style: const TextStyle(
                                  //               color: ColorValues.blackColor,
                                  //               fontWeight: FontWeight.w500),
                                  //         ),
                                  //         Text(
                                  //           "${moduleModel?.delete ?? ''}",
                                  //           style: const TextStyle(
                                  //             color: ColorValues.navyBlueColor,
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   )
                                  // ]),
                                  // Row(children: [
                                  //   Column(
                                  //     children: [
                                  //       Text(
                                  //         'View',
                                  //         style: const TextStyle(
                                  //             color: ColorValues.blackColor,
                                  //             fontWeight: FontWeight.w400),
                                  //       ),
                                  //       Text(
                                  //         "${moduleModel?.view ?? ''} min.",
                                  //         style: const TextStyle(
                                  //           color: ColorValues.navyBlueColor,
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  //   Expanded(
                                  //     child: Column(
                                  //       children: [
                                  //         Text(
                                  //           'Approve',
                                  //           style: const TextStyle(
                                  //               color: ColorValues.blackColor,
                                  //               fontWeight: FontWeight.w500),
                                  //         ),
                                  //         Text(
                                  //           "${moduleModel?.approve ?? ''}",
                                  //           style: const TextStyle(
                                  //             color: ColorValues.navyBlueColor,
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   )
                                  // ]),
                                  //
                                  // Row(children: [
                                  //   Column(
                                  //     children: [
                                  //       Text(
                                  //         'Issue',
                                  //         style: const TextStyle(
                                  //             color: ColorValues.blackColor,
                                  //             fontWeight: FontWeight.w400),
                                  //       ),
                                  //       Text(
                                  //         "${moduleModel?.issue ?? ''} min.",
                                  //         style: const TextStyle(
                                  //           color: ColorValues.navyBlueColor,
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  //   Expanded(
                                  //     child: Column(
                                  //       children: [
                                  //         Text(
                                  //           'Self View',
                                  //           style: const TextStyle(
                                  //               color: ColorValues.blackColor,
                                  //               fontWeight: FontWeight.w500),
                                  //         ),
                                  //         Text(
                                  //           "${moduleModel?.selfView ?? ''}",
                                  //           style: const TextStyle(
                                  //             color: ColorValues.navyBlueColor,
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   )
                                  // ]),
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
