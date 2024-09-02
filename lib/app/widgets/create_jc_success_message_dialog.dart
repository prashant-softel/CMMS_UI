import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class CreateJobCardDialog extends GetView {
  String? approveIncidentReportData;
  String? data;
  List<dynamic>? jcId;

  CreateJobCardDialog({
    super.key,
    this.approveIncidentReportData,
    this.data,
    this.jcId,
  });
  final NewPermitController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Job Card Created !!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 50,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Center(
                    child: Row(
                      children: [
                        // Text('${data}',
                        //     style: TextStyle(color: Colors.green),
                        //     textAlign: TextAlign.center),`
                        Text('Permit is created for the Job, JobCard Id is: ',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center),
                        Text('[${jcId![0]}]',
                            style: TextStyle(color: Colors.green),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20,),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //         width: 15,
                  //       ),
                  //       ElevatedButton(
                  //         style: Styles.greenElevatedButtonStyle,
                  //         onPressed: () => Get.offAllNamed(Routes.newPermit),
                  //         child: const Text('Permit List'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       ElevatedButton(
                  //         style: Styles.blueElevatedButtonStyle,
                  //         onPressed: () => Get.offAndToNamed(Routes.newPermitList),
                  //         child: const Text('View This Permit'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       // ElevatedButton(
                  //       //   style: Styles.redElevatedButtonStyle,
                  //       //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                  //       //   child: const Text('Add New Job'),
                  //       // ),
                  //     ]),
                ]),
          );
        }),
        actions: [
          // Dimens.boxWidth10,
          SizedBox(width: 10),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                style: Styles.darkRedElevatedButtonStyle,
                onPressed: () {
                  Get.offAllNamed(Routes.newPermitList);
                },
                child: const Text('Cancel'),
              ),
              Spacer(),
              ElevatedButton(
                style: Styles.greenElevatedButtonStyle,
                onPressed: () {
                  _controller.clearTypeStoreData();
                  _controller.clearStoreTaskData();
                  _controller.clearStoreTaskActivityData();
                  _controller.clearStoreTasktoActorData();
                  _controller.clearStoreTaskWhereUsedData();
                  _controller.clearStoreTaskfromActorData();

                  // _controller.getIncidentReportList(
                  //     _controller.facilityId,
                  //     _controller.formattedTodate,
                  //     _controller.formattedFromdate,
                  //     false);
                  //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                  Get.offAllNamed(Routes.createMrs, arguments: {
                    "whereUsedId": jcId![0],
                    "activity": _controller.titleTextCtrlr.text,
                    "whereUsed": 4,
                    "type": 1,
                    "fromActorTypeId": 2,
                    "to_actor_type_id": 4
                  });
                  Get.back();
                },
                child: const Text('Add Mrs'),
              ),
              Spacer(),
            ],
          ),
        ],
      );
    }));
  }
}
