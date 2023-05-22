import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/inventory_status_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../inventory_status_list_controller.dart';

class InventoryStatusListContentMobile
    extends GetView<InventoryStatusListController> {
  InventoryStatusListContentMobile({Key? key}) : super(key: key);

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
                    itemCount: controller.inventoryStatusListModel != null
                        ? controller.inventoryStatusList?.length
                        : 0,
                    itemBuilder: (context, index) {
                      final inventoryStatusListModel =
                          (controller.inventoryStatusList != null)
                              ? controller.inventoryStatusList![index]
                              : InventoryStatusListModel();
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
                                        '${inventoryStatusListModel?.id ?? 0}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorValues.navyBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Text(
                                      'CheckList Number: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${inventoryStatusListModel?.id}'
                                        '',
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Row(//
                                      children: [
                                    Text(
                                      'Category: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        inventoryStatusListModel?.name ?? '',
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Text(
                                      'Frequency: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${inventoryStatusListModel?.description ?? ''}",
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Duration',
                                          style: const TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "min.",
                                          style: const TextStyle(
                                            color: ColorValues.navyBlueColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            'ManPower',
                                            style: const TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${inventoryStatusListModel?.id ?? ''}",
                                            style: const TextStyle(
                                              color: ColorValues.navyBlueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                  SwitchListTile(
                                    visualDensity: VisualDensity.comfortable,
                                    title: Text(
                                      'Active Status: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    value: inventoryStatusListModel?.id == 1
                                        ? true
                                        : false,
                                    onChanged: (value) {},
                                    activeColor: ColorValues.greenColor,
                                  ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.createChecklist(),
        backgroundColor: ColorValues.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorValues.whiteColor,
        ),
      ),
    );
  }

  ///
}
