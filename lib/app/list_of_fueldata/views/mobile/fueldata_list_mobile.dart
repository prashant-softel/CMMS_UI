import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/list_of_fueldata/fueldata_list_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/get_fueldata_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FuelListMobile extends StatefulWidget {
  const FuelListMobile({Key? key}) : super(key: key);

  @override
  _FuelListMobileState createState() =>
      _FuelListMobileState();
}

class _FuelListMobileState extends State<FuelListMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FuelDataListController>(
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
                          itemCount: controller.fueldataList.length,
                          itemBuilder: (context, index) {
                            GetFuelDataList Fuel=
                                controller.fueldataList[index];
                            // var status = Kaizens.status_short.toString();
                            // print('Current Status: $status');
                            return GestureDetector(
                              onTap: () {
                                controller.clearStoreData();
                                // int id = Kaizens.planId ?? 0;
                                // Get.toNamed(
                                //   // Routes.viewKaizensing,
                                //   // arguments: {'mcid': id},
                                // );
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
                                                'Fuel Id: ',
                                                // ${Kaizens. ?? 0}
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                             Expanded(
                                              child: Text(
                                                'FD${Fuel.id?? ''}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
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
                                                'Diesel For Vehicles:',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${Fuel.dieselConsumedForVehicles ?? 'Unassigned'}',
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
                                                'Petrol For Vehicles: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${Fuel.petrolConsumedForVehicles?? ''}',
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
                                                'Petrol For Cutting And Movers: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${Fuel.petrolConsumedForGrassCuttingAndMovers?? ''}',
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
                                                'Diesel At Site: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                               '${Fuel.dieselConsumedAtSite?? ''}',
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
                                                'Petrol At Site: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                 '${Fuel.petrolConsumedAtSite?? ''}',
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
                                                'Month: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                 '${Fuel.month_name?? ''}',
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
                                                'Created At: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                 '${Fuel.createdAt?? ''}',
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
                                                Fuel.status == 351
                                            ? CustomElevatedButton(
                                                onPressed: () {
                                                  controller
                                                      .clearStoreData();
                                                  controller
                                                      .clearStoreData();
                                                  // int id = Kaizens?.planId ?? 0;
                                                  // if (id != 0) {
                                                  //   // Get.toNamed(
                                                  //   //     // Routes
                                                  //   //     //     .moduleCleaningPlanning,
                                                  //   //     // arguments: {
                                                  //   //     //   "mcid": id,
                                                  //   //     //   "planId":
                                                  //   //     //       Kaizens?.planId
                                                  //   //     });
                                                  // }
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
                        // controller.KaizensListByDate();
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
}
