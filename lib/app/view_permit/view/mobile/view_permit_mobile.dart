import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class ViewPermitMobile extends GetView<ViewPermitController> {
  ViewPermitMobile({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Dimens.boxHeight5,
        HeaderWidgetMobile(),
        Card(
          color: Colors.lightBlue.shade50,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text1: "Plant: ",
                    text2:
                        '${controller.viewPermitDetailsModel.value?.siteName}')
              ],
            ),
          ),
        ),
      ]),
    ));
  }

  checkBoxMethod(int position) {
    return Checkbox(
        value: position == 1
            ? controller.isChecked1.value = true
            : position == 2
                ? controller.isChecked2.value = true
                : position == 3
                    ? controller.isChecked3.value = true
                    : position == 4
                        ? controller.isChecked4.value = true
                        : position == 5
                            ? controller.isChecked5.value = true
                            : position == 6
                                ? controller.isChecked6.value = true
                                : position == 7
                                    ? controller.isChecked7.value = true
                                    : null,
        onChanged: (bool? value) {
          position == 1
              ? controller.toggleCheckbox1()
              : position == 2
                  ? controller.toggleCheckbox2()
                  : position == 3
                      ? controller.toggleCheckbox3()
                      : position == 4
                          ? controller.toggleCheckbox4()
                          : position == 5
                              ? controller.toggleCheckbox5()
                              : position == 6
                                  ? controller.toggleCheckbox6()
                                  : position == 7
                                      ? controller.toggleCheckbox7()
                                      : null;
        });
  }

  competenessMethod() {
    return SelectionArea(
      child: Container(
        height: 30,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(color: Colors.blue),
          ],
        ),
        child: Center(
            child: Text(
          'View Competeness',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: Styles.black14,
        ),
        Text(
          text2,
          style: TextStyle(
            color: ColorValues.appDarkBlueColor,
            fontWeight: FontWeight.w700,
            fontSize: Dimens.fourteen,
          ),
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}
