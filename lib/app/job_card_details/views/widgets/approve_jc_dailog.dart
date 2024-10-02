import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../job_card_details_controller.dart';

class ApproveJcJobDialog extends GetView<JobCardDetailsController> {
  const ApproveJcJobDialog({
    this.jobId,
    this.message,
    this.tittle,
    super.key,
  });

  ///
  final List<dynamic>? jobId;
  final String? message;
  final String? tittle;

  ///
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Text(
        (message ?? ''),
        textAlign: TextAlign.center,
      ),
      content: Builder(builder: (context) {
        return Container(
          padding: Dimens.edgeInsets05_0_5_0,
          height: Get.height / 6,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, //
              children: [
                Divider(
                  color: ColorValues.greyLightColour,
                  thickness: 1,
                ),
                Dimens.boxHeight20, Center(child: Text("$tittle " " $jobId ")),

                // Center(child: Text("JOb carry forward approved $jobId ")),
                Dimens.boxHeight25,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //
                    children: [
                      ElevatedButton(
                        style: Styles.greenElevatedButtonStyle,
                        onPressed: () => controller.goToJobCardListScreen(),
                        child: const Text('Job List'),
                      ),
                      Dimens.boxWidth10,
                      ElevatedButton(
                        style: Styles.yellowElevatedButtonStyle,
                        child: Text("Job Card"),
                        onPressed: () async {
                          Get.back();
                          try {
                            Get.put(FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',));

                            final _flutterSecureStorage =
                                const FlutterSecureStorage();

                            await _flutterSecureStorage.delete(key: "JcId");

                            //   await controller.setJcId();

                            controller.jobCardList.value = await controller
                                    .jobCardDetailsPresenter
                                    .getJobCardDetails(
                                  jobCardId: controller.jobCardId.value,
                                  isLoading: true,
                                ) ??
                                [];
                            controller.getHistory(controller.facilityId);
                            controller.createPlantDetailsTableData();

                            controller.createJobDetailsTableData();
                            controller.createPermitDetailsTableData();
                            //  createJcDetailsTableData();
                            controller.getEmployeeList();
                            //  getPermitDetails();

                            controller.responsibilityCtrlrs
                                .add(TextEditingController());
                            controller.currentIndex.value = -1;
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      // ElevatedButton(
                      //   style: Styles.yellowElevatedButtonStyle,
                      //   onPressed: () {
                      //     controller.goToJobDetailsScreen();
                      //   },
                      // child: const Text('View Job Card'),
                      // ),
                      Dimens.boxWidth10,
                      ElevatedButton(
                        style: Styles.yellowElevatedButtonStyle,
                        onPressed: () {
                          controller.goToAddJobScreen();
                        },
                        child: const Text('View Job'),
                      ),
                      // ElevatedButton(
                      //   style: Styles.redElevatedButtonStyle,
                      //   onPressed: () => controller.goToAddJobScreen(),
                      //   child: const Text('Add New Job'),
                      // ),
                    ]),
              ]),
        );
      }),
      actions: [],
    );
  }

  ///
}
