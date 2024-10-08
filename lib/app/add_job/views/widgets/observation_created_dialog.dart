import 'package:cmms/app/create_observation/create_observation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';

class obsCreatedDialog extends StatelessWidget {
  const obsCreatedDialog({
    this.obsId,
    this.message,
    Key? key,
  }) : super(key: key);

  final int? obsId;
  final String? message;

  @override
  Widget build(BuildContext context) {
    // Use Get.find to get the controller instance
    final CreateObservationController controller = Get.find<CreateObservationController>();

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets00_04_04_04,
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Create Observation',
        textAlign: TextAlign.center,
      ),
      content: Builder(builder: (context) {
        return Container(
          padding: Dimens.edgeInsets05_0_5_0,
          height: 80,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                color: ColorValues.greyLightColour,
                thickness: 1,
              ),
              Dimens.boxHeight10,
              Center(
                child: Text(
                  message ?? 'No message',
                  overflow: TextOverflow.visible, // Use 'visible' to see full message
                ),
              ),
              Dimens.boxHeight10,
            ],
          ),
        );
      }),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: Styles.navyBlueElevatedButtonStyle,
              onPressed: () => controller.goToObsListScreen(),
              child: const Text('Obs List'),
            ),
            Dimens.boxWidth10,
            ElevatedButton(
              style: Styles.yellowElevatedButtonStyle,
              onPressed: () {
                controller.clearStoreData();
                controller.goToViewDetailsScreen(obsId ?? 0);
              },
              child: const Text('View Obs'),
            ),
            Dimens.boxWidth10,
            ElevatedButton(
              style: Styles.greenElevatedButtonStyle,
              onPressed: () => controller.goTocreateObsScreen(),
              child: const Text('Add New Obs'),
            ),
          ],
        ),
      ],
    );
  }
}