import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constant/constant.dart';

class NewPermitListMobile extends GetView<NewPermitListController> {
  NewPermitListMobile({Key? key, this.newPermitListModel}) : super(key: key);

  final NewPermitModel? newPermitListModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SelectionArea(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.newPermitList != null
                        ? controller.newPermitList.length
                        : 0,
                    itemBuilder: (context, index) {
                      final newPermitListModel =
                          controller.newPermitList != null
                              ? controller.newPermitList[index]
                              : NewPermitModel();
                      var status =
                          newPermitListModel?.current_status_short.toString() ??
                              '';
                      print('Current Status: $status');
                      return GestureDetector(
                        onTap: () {
                          var _newPermitListId =
                              newPermitListModel?.permitId ?? 0;
                          controller.viewNewPermitList(
                              permitId: _newPermitListId);
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.lightBlue.shade50,
                            elevation: 10,
                            shadowColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Permit Id: ${newPermitListModel?.permitId ?? 0}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorValues.navyBlueColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: (status.toLowerCase() ==
                                                    "created")
                                                ? Color(0xff58c3ca)
                                                : (status.toLowerCase() ==
                                                        "assigned")
                                                    ? Color(0xff58c352)
                                                    : (status.toLowerCase() ==
                                                            "linked")
                                                        ? Color(0xff787099)
                                                        : (status.toLowerCase() ==
                                                                "in progress")
                                                            ? Color(0xffbf8c4b)
                                                            : (status.toLowerCase() ==
                                                                    "closed")
                                                                ? Color(
                                                                    0xff3438cd)
                                                                : (status.toLowerCase() ==
                                                                        "cancelled")
                                                                    ? Color(
                                                                        0xFFBF4844)
                                                                    : Color
                                                                        .fromARGB(
                                                                            255,
                                                                            227,
                                                                            223,
                                                                            108),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Center(
                                            child: Text(
                                              status,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _showPopupMenu(context);
                                        },
                                        child: Image.asset(
                                          'assets/files/menu_vertical.png',
                                          width: 40,
                                        ),
                                      ),
                                    ]),
                                Row(children: [
                                  Expanded(
                                    child: Text(
                                      'Permit Type Name: ',
                                      style: const TextStyle(
                                        color: ColorValues.blackColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${newPermitListModel?.permitTypeName ?? 'Unassigned'}',
                                      style: const TextStyle(
                                        color: ColorValues.blackColor,
                                      ),
                                    ),
                                  ),
                                ]),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${newPermitListModel?.workingAreaName ?? ''}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 239, 87, 27),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Description: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        newPermitListModel?.description ?? '',
                                        style: const TextStyle(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Equipment: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        newPermitListModel
                                                ?.equipment_categories ??
                                            '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Work Area Name: ',
                                        style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(newPermitListModel
                                                ?.workingAreaName ??
                                            ''),
                                      ),
                                    ]),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Approved Time: ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        (newPermitListModel?.approvedDatetime !=
                                                null)
                                            ? DateFormat('dd-MMM-yyyy hh:mm')
                                                .format(newPermitListModel!
                                                    .approvedDatetime!)
                                            : '',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                // Edit Button
                                (varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id == 3 &&
                                                e.edit == 1)
                                            .length >
                                        0)
                                    ? CustomElevatedButton(
                                        onPressed: () {
                                          var _newPermitListId =
                                              newPermitListModel?.permitId ?? 0;
                                          controller.editNewPermit(
                                              permitId: _newPermitListId);
                                        },
                                        text: 'Edit PTW',
                                        icon: Icons.edit,
                                        backgroundColor: Colors.blue,
                                      )
                                    : Container(),
                              ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addNewPermitList(),
        backgroundColor: ColorValues.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorValues.whiteColor,
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        Offset(360, 360),
        Offset(130, 130),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorValues.editColor,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                    Dimens.boxWidth10,
                    Text(
                      "VIEW",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorValues.appDarkBlueColor,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                    ),
                    Dimens.boxWidth10,
                    Text(
                      "Extend",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorValues.cancelColor,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.close,
                    ),
                    Dimens.boxWidth10,
                    Text(
                      "CLOSE",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
