import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';

import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class VegetationPlanListMobile extends StatefulWidget {
  const VegetationPlanListMobile({Key? key}) : super(key: key);

  @override
  State<VegetationPlanListMobile> createState() =>
      _VegetationPlanListMobileState();
}

class _VegetationPlanListMobileState extends State<VegetationPlanListMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VegetationPlanListController>(
      id: "stock_Mangement_Date",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Dimens.boxHeight10,
                      HeaderWidgetMobile(
                        onPressed: () {
                          controller.openFromDateToStartDatePicker =
                              !controller.openFromDateToStartDatePicker;
                          controller.update(['stock_Mangement_Date']);
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.vegetationPlanList.length,
                          itemBuilder: (context, index) {
                            VegetationPlanListModel vegPlan =
                                controller.vegetationPlanList[index];
                            var status = vegPlan.statusShort.toString();
                            print('Current Status: $status');
                            return GestureDetector(
                              onTap: () {
                                controller.clearStoreData();
                                int id = vegPlan.planId ?? 0;
                                Get.toNamed(
                                    '${Routes.viewVegetationPlanScreen}/$id');
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
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
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Plan Id: ${vegPlan.planId ?? 0}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: Dimens.edgeInsets8_2_8_2,
                                              decoration: BoxDecoration(
                                                color: ColorValues.addNewColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  status,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      Styles.white10.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight2,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Plan Name: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${vegPlan.title ?? 'Unassigned'}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'No Of Cleaning Days: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${vegPlan.noOfCleaningDays ?? ''}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Created By: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                vegPlan.createdBy ?? '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Frequency: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                vegPlan.frequency ?? '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight4,
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kVegetationControlFeatureId &&
                                                        e.edit ==
                                                            UserAccessConstants
                                                                .kHaveEditAccess)
                                                    .isNotEmpty &&
                                                vegPlan.status == 702
                                            ? CustomElevatedButton(
                                                onPressed: () {
                                                  controller.clearStoreData();
                                                  var id = vegPlan.planId ?? 0;
                                                  Get.toNamed(
                                                    Routes
                                                        .addVegetationPlanScreen,
                                                    arguments: {"vegid": id},
                                                  );
                                                },
                                                text: 'Edit',
                                                icon: Icons.edit,
                                                backgroundColor:
                                                    ColorValues.editColor,
                                              )
                                            : Dimens.box0,
                                      ],
                                    ),
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
                if (controller.openFromDateToStartDatePicker)
                  Positioned(
                    top: 50,
                    left: 10,
                    right: 10,
                    child: DatePickerWidget(
                      selectionMode: DateRangePickerSelectionMode.range,
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        todayCellDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorValues.appDarkBlueColor,
                        ),
                      ),
                      initialSelectedRange: PickerDateRange(
                        controller.fromDate.value,
                        controller.toDate.value,
                      ),
                      onSubmit: (value) {
                        print('po valu ${value.toString()}');
                        PickerDateRange? data = value as PickerDateRange;
                        var pickUpDate =
                            DateTime.parse(data.startDate.toString());
                        controller.fromDate.value = pickUpDate;
                        var dropDate = DateTime.parse(data.endDate.toString());
                        controller.toDate.value = dropDate;
                        controller.getVegListByDate();
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['stock_Mangement_Date']);
                      },
                      onCancel: () {
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['stock_Mangement_Date']);
                      },
                    ),
                  ),
                Dimens.boxHeight10,
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Waiting for Approval":
        return Color(0xff58c3ca);
      case "Approved":
        return Color(0xff58c352);
      // case "linked":
      //   return Color(0xff787099);
      // case "in progress":
      //   return Color(0xffbf8c4b);
      // case "closed":
      //   return Color(0xff3438cd);
      case "Rejected":
        return Color(0xFFBF4844);
      default:
        return Color.fromARGB(255, 227, 223, 108);
    }
  }
}
