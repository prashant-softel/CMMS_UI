import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/return_mrs/return_mrs_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/get_return_mrs_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnMrsListContentMobile extends GetView<ReturnMrsListController> {
  ReturnMrsListContentMobile({Key? key}) : super(key: key);
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    ///
    return GetBuilder<ReturnMrsListController>(
        id: 'mrslist',
        builder: (controller) {
          return //
              Scaffold(
            body: //
                Obx(
              () => Container(
                child: Column(
                  children: [
                    Dimens.boxHeight10,
                    HeaderWidgetMobile(),
                    Dimens.boxHeight10,
                    Expanded(
                      child: ListView.builder(
                          //physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.mrsList != null
                              ? controller.mrsList.length
                              : 0,
                          itemBuilder: (context, index) {
                            final mrsReturnListModel =
                                (controller.mrsList != null)
                                    ? controller.mrsList[index]
                                    : ReturnMrsListModel();
                            return GestureDetector(
                              onTap: () {
                                controller.clearStoreData();
                                // controller.clearStoreDatatype();
                                var _mrsId = controller.mrsList[index]!.id ?? 0;

                                Get.toNamed(Routes.approverReturnMrs,
                                    arguments: {'mrsId': _mrsId});
                              },
                              child: Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'MRS Id: ',
                                                style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                'MRS${mrsReturnListModel?.id ?? 0}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                padding:
                                                    Dimens.edgeInsets8_2_8_2,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorValues.addNewColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  '${mrsReturnListModel?.status_short}',
                                                  style:
                                                      Styles.white10.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            Text(
                                              'Activity: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${mrsReturnListModel?.activity}'
                                                '',
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Row(//
                                              children: [
                                            Text(
                                              'Where Used: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${mrsReturnListModel?.whereUsedType.toString().toUpperCase() ?? ''}${mrsReturnListModel?.whereUsedTypeId ?? ''}',
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ]),
                                          Row(children: [
                                            Text(
                                              'Mrs Detail: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Requested by:${mrsReturnListModel?.requested_by_name ?? ""}\nIssued by:${mrsReturnListModel?.approver_name ?? ""}",
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ]),
                                          Row(children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Order Date',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "${mrsReturnListModel?.requestd_date ?? ''}",
                                                  style: const TextStyle(
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]),
                                          Dimens.boxHeight5,
                                          Center(
                                            child: CustomElevatedButton(
                                              onPressed: () {
                                                controller.clearStoreData();

                                                String mrsId =
                                                    mrsReturnListModel?.id
                                                            .toString() ??
                                                        "";
                                                print({"mrsId": mrsId});
                                                Get.toNamed(
                                                    Routes.returnMrsView,
                                                    arguments: {
                                                      'mrsId':
                                                          int.tryParse("$mrsId")
                                                    });
                                              },
                                              text: 'Edit MRS',
                                              icon: Icons.edit,
                                              backgroundColor: Colors.blue,
                                            ),
                                          )
                                        ]),
                                  ),
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
          );
        });
  }

  ///
}
